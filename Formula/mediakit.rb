class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.12/mediakit-macos-arm64"
      sha256 "09c19db545c7e367c79faf80955ae842ffaf93222f318e0a6f23c35aa574d264"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.12/mediakit-macos-x86_64"
      sha256 "f0d9fcf5cb179cad5b82234f9d75bbdf58fa97efb66c9b37244b6918059927af"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.12/mediakit-linux-x86_64"
    sha256 "8430f5363ec2f92703454fc8b72bcf5b439a7ad682cbf4e88eccc27a7fb59075"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
