class Mediakit < Formula
  desc "Python CLI tool for batch media operations"
  homepage "https://github.com/RedAtman/mediakit"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.2/mediakit-macos-arm64"
      sha256 "d49c5bb7e107a59669f2d7ef7da0469bb2906322fae5db3d2c50dc29789deca6"

      def install
        bin.install "mediakit-macos-arm64" => "mediakit"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/mediakit/releases/download/v0.1.2/mediakit-macos-x86_64"
      sha256 "f936fdcc737d4c076660efcd1826e19124d5ac343ce232117a9a1b8e3822b1ec"

      def install
        bin.install "mediakit-macos-x86_64" => "mediakit"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/mediakit/releases/download/v0.1.2/mediakit-linux-x86_64"
    sha256 "c9264a38e96685c49b95cfdbb31e00391d46f853a9f92fddcc3006a1a231304e"

    def install
      bin.install "mediakit-linux-x86_64" => "mediakit"
    end
  end

  test do
    system "#{bin}/mediakit", "-v"
  end
end
