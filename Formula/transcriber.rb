class Transcriber < Formula
  desc "Fast video transcription CLI powered by whisper.cpp"
  homepage "https://github.com/RedAtman/transcriber"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.2/transcriber-macos-aarch64"
      sha256 "1eb9e98579a9977b951b4eea9700af996ef9bebf6d208ea5bf0fe95ca242c231"

      def install
        bin.install "transcriber-macos-aarch64" => "transcriber"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.2/transcriber-macos-x86_64"
      sha256 "1eb9e98579a9977b951b4eea9700af996ef9bebf6d208ea5bf0fe95ca242c231"

      def install
        bin.install "transcriber-macos-x86_64" => "transcriber"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/transcriber/releases/download/v0.1.2/transcriber-linux-x86_64"
    sha256 "9ada3044b049af9522fe6abdb8af5db0aba6fa351ff50525aae07454108ba36d"

    def install
      bin.install "transcriber-linux-x86_64" => "transcriber"
    end
  end

  test do
    system "#{bin}/transcriber", "--help"
  end
end
