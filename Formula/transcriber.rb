class Transcriber < Formula
  desc "Fast video transcription CLI powered by whisper.cpp"
  homepage "https://github.com/RedAtman/transcriber"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.3/transcriber-macos-aarch64"
      sha256 "28547eb248e89cb334d0a70c42e3c09161a8560ae26abe477e45ec480d8b1129"

      def install
        bin.install "transcriber-macos-aarch64" => "transcriber"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.3/transcriber-macos-x86_64"
      sha256 "28547eb248e89cb334d0a70c42e3c09161a8560ae26abe477e45ec480d8b1129"

      def install
        bin.install "transcriber-macos-x86_64" => "transcriber"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/transcriber/releases/download/v0.1.3/transcriber-linux-x86_64"
    sha256 "f925e99847e9a9488de30bb552c2100664752c7d80c37f20edc83bfc000f9add"

    def install
      bin.install "transcriber-linux-x86_64" => "transcriber"
    end
  end

  test do
    system "#{bin}/transcriber", "--help"
  end
end
