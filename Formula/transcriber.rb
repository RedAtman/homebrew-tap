class Transcriber < Formula
  desc "Fast video transcription CLI powered by whisper.cpp"
  homepage "https://github.com/RedAtman/transcriber"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.2/transcriber-macos-aarch64"
      sha256 "b599d0d58b167596332fa2d9546ba0b4cd7d49bed963aacde546b016735656d1"

      def install
        bin.install "transcriber-macos-aarch64" => "transcriber"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.2/transcriber-macos-x86_64"
      sha256 "b599d0d58b167596332fa2d9546ba0b4cd7d49bed963aacde546b016735656d1"

      def install
        bin.install "transcriber-macos-x86_64" => "transcriber"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/transcriber/releases/download/v0.1.2/transcriber-linux-x86_64"
    sha256 "2866705230ebbe8de335ee528231fbe9a96b1fc227acf76e4595c9a5c794ff46"

    def install
      bin.install "transcriber-linux-x86_64" => "transcriber"
    end
  end

  test do
    system "#{bin}/transcriber", "--help"
  end
end
