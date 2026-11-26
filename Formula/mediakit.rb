class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.10/mediakit-macos-arm64"
      sha256 "1287964b3c4143531f8d2294f5eb10fb9dbbb0bf0c338f1dbebc00deecac9e9b"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.10/mediakit-macos-x86_64"
      sha256 "6dd9a9838c24ae364cf48d9005e9258cc9244b58283e092430204f62f7bae9bb"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.10/mediakit-linux-x86_64"
    sha256 "2b0af9b7796c08ad3ea567ec9897bb8c5027614d7d377ff352445e86fa29de77"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
