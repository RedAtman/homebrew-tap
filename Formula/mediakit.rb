class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.11/mediakit-macos-arm64"
      sha256 "320597aef046e418cbb03b1e16a9c653aba25990076efb1ffae355c820fca9f0"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.11/mediakit-macos-x86_64"
      sha256 "f6fe0090018ca96625eca304a77e653984353be74e32022450b745674f83c190"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.11/mediakit-linux-x86_64"
    sha256 "7a4698ed587d46aaa3dbbf836c4cb231e81c948da8d6b4f9e673e0433d8d3b8e"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
