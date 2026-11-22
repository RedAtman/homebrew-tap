class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.5/mediakit-macos-arm64"
      sha256 "6f9f141a3bc30f2e28097a3e48ae009754fc9ed87248b6d7375e0de3e3ef7855"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.5/mediakit-macos-x86_64"
      sha256 "d4e41d256a2ff92ac81e55564397488fc6e301b3b0852824561f360b6fc1648f"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.5/mediakit-linux-x86_64"
    sha256 "6e2eb6d8a5786ef59fd857d47110dc8aebc00e6c5707b79b23f9f1c45415a13a"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
