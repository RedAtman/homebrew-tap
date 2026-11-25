class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.9/mediakit-macos-arm64"
      sha256 "33aeed01398b5ace4b772a2390d66209f8829c772a6c10d42c86f34866433cec"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.9/mediakit-macos-x86_64"
      sha256 "bd194f7880879fbb76825e3af55a0d0f520d8a609169741457fec9dec9fecd3d"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.9/mediakit-linux-x86_64"
    sha256 "0aeb3b76a866457b13051420327c3283867a76f9d7f45fab49b9711ac3e0691b"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
