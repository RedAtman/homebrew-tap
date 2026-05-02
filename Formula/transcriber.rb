class Transcriber < Formula
  desc "Fast video transcription CLI powered by whisper.cpp"
  homepage "https://github.com/RedAtman/transcriber"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.2/transcriber-macos-aarch64"
      sha256 "c18e8f8a5d86d7b273e1d4f8e7d422457cec8199bc42796ec104d86a94208928"

      def install
        bin.install "transcriber-macos-aarch64" => "transcriber"
      end
    end
    on_intel do
      url "https://github.com/RedAtman/transcriber/releases/download/v0.1.2/transcriber-macos-x86_64"
      sha256 "c18e8f8a5d86d7b273e1d4f8e7d422457cec8199bc42796ec104d86a94208928"

      def install
        bin.install "transcriber-macos-x86_64" => "transcriber"
      end
    end
  end

  on_linux do
    url "https://github.com/RedAtman/transcriber/releases/download/v0.1.2/transcriber-linux-x86_64"
    sha256 "817c86f40cb32952e1eb6e6196a5d4ab5fb23e663e46c30fef5604c6aa0ef773"

    def install
      bin.install "transcriber-linux-x86_64" => "transcriber"
    end
  end

  test do
    system "#{bin}/transcriber", "--help"
  end
end
