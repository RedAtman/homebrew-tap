class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.7/mediakit-macos-arm64"
      sha256 "af51b8cb7d5859c92364f2cb09143e47e116445d19ee9510e05c7e8a3afaabcf"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.7/mediakit-macos-x86_64"
      sha256 "cb8c637e381665fe35faa179be72d99d8717358a732e5cea9efcc81598de9e73"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.7/mediakit-linux-x86_64"
    sha256 "8e1313cea1c40b6c60cc0175ab260cb02eb3528d4fd77746ca2374e2edadc7a9"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
