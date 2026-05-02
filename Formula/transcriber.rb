class Transcriber < Formula
  desc "Fast video transcription CLI powered by whisper.cpp"
  homepage "https://github.com/RedAtman/transcriber"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.4/transcriber-macos-aarch64"
      sha256 "33f4e1e2f69e1bd648f0a32f7888d8663737135059b73a6e328844c6e7e8a30e"

      def install
        bin.install "transcriber-macos-aarch64" => "transcriber"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.4/transcriber-macos-x86_64"
      sha256 "33f4e1e2f69e1bd648f0a32f7888d8663737135059b73a6e328844c6e7e8a30e"

      def install
        bin.install "transcriber-macos-x86_64" => "transcriber"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/transcriber/releases/download/v0.1.4/transcriber-linux-x86_64"
    sha256 "947b16cc44fdd883ed9ff2bafe4c48e4053721f9002b77d72a98486cca934cbd"

    def install
      bin.install "transcriber-linux-x86_64" => "transcriber"
    end
  end

  test do
    system "#{bin}/transcriber", "--help"
  end
end
