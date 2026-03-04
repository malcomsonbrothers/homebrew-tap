class YtTranscript < Formula
  desc "Download model-compatible YouTube audio and transcribe locally"
  homepage "https://github.com/malcomsonbrothers/yt-transcript"
  license "MIT"
  head "https://github.com/malcomsonbrothers/yt-transcript.git", branch: "master"

  depends_on "rust" => :build
  depends_on "ffmpeg"
  depends_on "uv"
  depends_on "yt-dlp"

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "yt-transcript", shell_output("#{bin}/yt-transcript --help")
  end
end
