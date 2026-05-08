class Transcriber < Formula
  desc "Fast video transcription CLI powered by whisper.cpp"
  homepage "https://github.com/RedAtman/transcriber"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.7/transcriber-macos-aarch64"
      sha256 "a5c0e0fe800f1cfc5601be19b41113329d3a73ba9b191a95f082554d44a9630f"

      def install
        bin.install "transcriber-macos-aarch64" => "transcriber"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.7/transcriber-macos-x86_64"
      sha256 "a5c0e0fe800f1cfc5601be19b41113329d3a73ba9b191a95f082554d44a9630f"

      def install
        bin.install "transcriber-macos-x86_64" => "transcriber"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/transcriber/releases/download/v0.1.7/transcriber-linux-x86_64"
    sha256 "738b7fedaffb1ab445039725a28fbf93faf2f8deb92d2062e03b9c6f610551c5"

    def install
      bin.install "transcriber-linux-x86_64" => "transcriber"
    end
  end

  test do
    system "#{bin}/transcriber", "--help"
  end
end
