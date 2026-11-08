class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.3/mediakit-macos-arm64"
      sha256 "a63ff7cfd09ee2df909195b69ff50ecc4928e2b863654d25b6308e60a1c72075"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.3/mediakit-macos-x86_64"
      sha256 "dc5e5db4ddda635d6124bdad9f5fd42c23194a00ef6d596cdaca2abeb96c4f50"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.3/mediakit-linux-x86_64"
    sha256 "269966adc9bee8616f07a8a8974bcdf5f16b05c127fa063ce0c9865452770f84"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
