#!/usr/bin/env python3
"""Bump every tracked formula to its project's latest GitHub release.

The formula owns its own structure: this only rewrites the release tag in each
`url` and the sha256 line directly below it, so hand edits to desc/test/deps
survive a bump. Platform asset names are read back out of the formula, so
adding or dropping a platform is a formula edit, not a script edit.
"""

from __future__ import annotations

import hashlib
import json
import pathlib
import re
import subprocess
import sys
import tempfile

# Projects whose formula is Formula/<repo name>.rb. Adding a project means
# adding its name here; an absent formula is a hard error, not a silent skip.
PROJECTS = ["RedAtman/mediakit", "RedAtman/transcriber"]

URL_RE = re.compile(
    r'(?P<prefix>^\s*url "https://github\.com/[^"]+/releases/download/)'
    r'(?P<tag>[^/]+)/(?P<asset>[^"]+)"'
)
SHA_RE = re.compile(r'sha256 "[^"]*"')


def gh(*args: str) -> str:
    return subprocess.run(
        ["gh", *args], check=True, capture_output=True, text=True
    ).stdout


def latest_tag(repo: str) -> str:
    # Prereleases are filtered out rather than taken on trust: a tag like
    # v1.2.3-rc1 must never become the version a tap user installs.
    releases = json.loads(
        gh("release", "list", "-R", repo, "--limit", "30", "--json", "tagName,isPrerelease")
    )
    stable = [r for r in releases if not r["isPrerelease"]]
    if not stable:
        raise SystemExit(f"{repo}: no non-prerelease release found")
    return stable[0]["tagName"]


def asset_shas(repo: str, tag: str, assets: list[str]) -> dict[str, str]:
    with tempfile.TemporaryDirectory() as tmp:
        for asset in assets:
            gh("release", "download", tag, "-R", repo, "--pattern", asset, "--dir", tmp, "--clobber")
        return {
            asset: hashlib.sha256((pathlib.Path(tmp) / asset).read_bytes()).hexdigest()
            for asset in assets
        }


def bump(repo: str) -> bool:
    formula = pathlib.Path("Formula") / f"{repo.split('/')[1]}.rb"
    if not formula.is_file():
        raise SystemExit(f"{repo}: {formula} does not exist")

    tag = latest_tag(repo)
    lines = formula.read_text().splitlines(keepends=True)
    urls = [m for m in (URL_RE.match(line) for line in lines) if m]
    if not urls:
        raise SystemExit(f"{repo}: {formula} has no release urls to bump")

    if {m.group("tag") for m in urls} == {tag}:
        print(f"{repo}: already at {tag}")
        return False

    assets = list(dict.fromkeys(m.group("asset") for m in urls))
    shas = asset_shas(repo, tag, assets)

    out: list[str] = []
    pending: str | None = None  # asset whose sha256 line comes next
    for line in lines:
        url = URL_RE.match(line)
        if url:
            pending = url.group("asset")
            line = URL_RE.sub(
                lambda m: f'{m.group("prefix")}{tag}/{m.group("asset")}"', line
            )
        elif pending and SHA_RE.search(line):
            line = SHA_RE.sub(f'sha256 "{shas[pending]}"', line)
            pending = None
        out.append(line)

    if pending:
        raise SystemExit(f"{repo}: url {pending} has no sha256 line below it")

    formula.write_text("".join(out))
    print(f"{repo}: bumped to {tag} ({len(assets)} assets)")
    return True


def main() -> int:
    failed = []
    for repo in PROJECTS:
        try:
            bump(repo)
        except (subprocess.CalledProcessError, SystemExit) as exc:
            # One broken project must not hide the state of the others, but it
            # does have to turn the run red: a stale formula is invisible
            # otherwise.
            print(f"::error::{repo}: {exc}", file=sys.stderr)
            failed.append(repo)
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
