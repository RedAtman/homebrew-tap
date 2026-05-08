class Transcriber < Formula
  desc "Fast video transcription CLI powered by whisper.cpp"
  homepage "https://github.com/RedAtman/transcriber"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.4/transcriber-macos-aarch64"
      sha256 "2d248b9224a20f631896e6892012b8c1ad5273f28333a1214478c3f10317258a"

      def install
        bin.install "transcriber-macos-aarch64" => "transcriber"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.4/transcriber-macos-x86_64"
      sha256 "2d248b9224a20f631896e6892012b8c1ad5273f28333a1214478c3f10317258a"

      def install
        bin.install "transcriber-macos-x86_64" => "transcriber"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/transcriber/releases/download/v0.1.4/transcriber-linux-x86_64"
    sha256 "10d933c405aaf02b1c8ce14c35fed28c06ab18d14b97272c420f933452e72605"

    def install
      bin.install "transcriber-linux-x86_64" => "transcriber"
    end
  end

  test do
    system "#{bin}/transcriber", "--help"
  end
end
