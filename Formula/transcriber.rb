class Transcriber < Formula
  desc "Fast video transcription CLI powered by whisper.cpp"
  homepage "https://github.com/RedAtman/transcriber"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.4/transcriber-macos-aarch64"
      sha256 "7dee3fb0cc388bc5e6e1d81aa3e8592d38469ab766fa098a1b77443192332438"

      def install
        bin.install "transcriber-macos-aarch64" => "transcriber"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.4/transcriber-macos-x86_64"
      sha256 "7dee3fb0cc388bc5e6e1d81aa3e8592d38469ab766fa098a1b77443192332438"

      def install
        bin.install "transcriber-macos-x86_64" => "transcriber"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/transcriber/releases/download/v0.1.4/transcriber-linux-x86_64"
    sha256 "a2fddb761417ba968ece0c85b86077c9941fe339d2c627e060acf8a05dd1edac"

    def install
      bin.install "transcriber-linux-x86_64" => "transcriber"
    end
  end

  test do
    system "#{bin}/transcriber", "--help"
  end
end
