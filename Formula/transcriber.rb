class Transcriber < Formula
  desc "Fast video transcription CLI powered by whisper.cpp"
  homepage "https://github.com/RedAtman/transcriber"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.8/transcriber-macos-aarch64"
      sha256 "01af3e9e828db01c2ef0555dcf0bf5a85004f5e5be89aab99bc2393cbaff49ee"

      def install
        bin.install "transcriber-macos-aarch64" => "transcriber"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.8/transcriber-macos-x86_64"
      sha256 "c61aa93149a670ae9934b4c55db7d76bd082a655555fdaecc5423e194db42767"

      def install
        bin.install "transcriber-macos-x86_64" => "transcriber"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/transcriber/releases/download/v0.1.8/transcriber-linux-x86_64"
    sha256 "bea16976aed2d8d28d80f035c6d5077c929c190ffc5b578427ce63798b8c57e3"

    def install
      bin.install "transcriber-linux-x86_64" => "transcriber"
    end
  end

  test do
    system "#{bin}/transcriber", "--help"
  end
end
