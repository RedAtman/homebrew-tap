class Transcriber < Formula
  desc "Fast video transcription CLI powered by whisper.cpp"
  homepage "https://github.com/RedAtman/transcriber"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.1/transcriber-macos-aarch64"
      sha256 "6d774cb254cfde20c67a45ead5cce898ed5db2a209014a17094de56007d04379"

      def install
        bin.install "transcriber-macos-aarch64" => "transcriber"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.1/transcriber-macos-x86_64"
      sha256 "6d774cb254cfde20c67a45ead5cce898ed5db2a209014a17094de56007d04379"

      def install
        bin.install "transcriber-macos-x86_64" => "transcriber"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/transcriber/releases/download/v0.1.1/transcriber-linux-x86_64"
    sha256 "cdbd30c2a5916752c0bd71525134014768e7e411684c1ec9c104c0c99f2837e4"

    def install
      bin.install "transcriber-linux-x86_64" => "transcriber"
    end
  end

  test do
    system "#{bin}/transcriber", "--help"
  end
end
