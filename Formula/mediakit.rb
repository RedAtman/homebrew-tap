class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.6/mediakit-macos-arm64"
      sha256 "e3b07c208a6a23e73b71eb95f4c8d0db7a3ecb6213ec602e23afd25bc5e80fed"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.6/mediakit-macos-x86_64"
      sha256 "b4a39922060418e0d8d834eeb5945bbf746c308839083d9d3230885f3b3737fd"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.6/mediakit-linux-x86_64"
    sha256 "358be668ba795f98d7ce6600e969b780b6a58ba442be08e7ddfcd60f8a5e50f4"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
