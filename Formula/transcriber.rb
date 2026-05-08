class Transcriber < Formula
  desc "Fast video transcription CLI powered by whisper.cpp"
  homepage "https://github.com/RedAtman/transcriber"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.6/transcriber-macos-aarch64"
      sha256 "ad43bb3aa5adfcf367dabbef04d8035ea434c7329bfb009a7e1baea975bd5035"

      def install
        bin.install "transcriber-macos-aarch64" => "transcriber"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.6/transcriber-macos-x86_64"
      sha256 "ad43bb3aa5adfcf367dabbef04d8035ea434c7329bfb009a7e1baea975bd5035"

      def install
        bin.install "transcriber-macos-x86_64" => "transcriber"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/transcriber/releases/download/v0.1.6/transcriber-linux-x86_64"
    sha256 "0633986d9ee08dcf5e9b7f8fdcc7f43837fed22bea37ef0bc3d37ad63283e487"

    def install
      bin.install "transcriber-linux-x86_64" => "transcriber"
    end
  end

  test do
    system "#{bin}/transcriber", "--help"
  end
end
