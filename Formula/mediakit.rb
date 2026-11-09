class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.4/mediakit-macos-arm64"
      sha256 "485ed4ec4169e02f0fce94a438150858657518d61030208d53f21b34f18a5649"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.4/mediakit-macos-x86_64"
      sha256 "31983b59ab0cc8d95c6e2a60da1c718e9a1c6e286cd41bc22700a3f34e2c1c3f"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.4/mediakit-linux-x86_64"
    sha256 "adaf502620db08c3624ba76abe5bbe13fc771b532538ecf9e6f4e8df3507810e"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
