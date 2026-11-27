class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.13/mediakit-macos-arm64"
      sha256 "0d726cebed9b9821bcc04759de7195f4cd645dedd7e6aeaba1ca7a805b8515f1"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.13/mediakit-macos-x86_64"
      sha256 "09f60ff190802a17f777f27f465f4c476e6f2388cbf2a887f52a9753e8aff2cf"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.13/mediakit-linux-x86_64"
    sha256 "b8bcab2d8a5d64147345ec820d693b68fd6ddd62f6936521d34405f33a9a0c10"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
