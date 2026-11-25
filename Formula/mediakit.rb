class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.8/mediakit-macos-arm64"
      sha256 "c5dcbdf17add4cd3352c2777393e6d92a0f40d3c8c63dc66bfa7127116dcb792"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.8/mediakit-macos-x86_64"
      sha256 "fc9a79ee6f5187e7d03987f787ab54d59416e3c42746ae31a044ed6554676c2a"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.8/mediakit-linux-x86_64"
    sha256 "092d390bcf2576f66dbe4b243844e3a1fad5a27458ddb61f40b5c1485305c69f"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
