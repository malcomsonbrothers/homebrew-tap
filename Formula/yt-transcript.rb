class YtTranscript < Formula
  desc "Download model-compatible YouTube audio and transcribe locally"
  homepage "https://github.com/malcomsonbrothers/yt-transcript"
  version "0.1.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-macos-arm64.tar.gz"
    sha256 "f29a1de7039144c88c4ddb7a80be26c250999ff24f7a62d3d9d1b0162617395c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-linux-x86_64.tar.gz"
    sha256 "8ec78298c949e0684f2592bd694e8906458cf7cd971343a6c9f86f06ced8c109"
  end

  head "https://github.com/malcomsonbrothers/yt-transcript.git", branch: "master"

  depends_on "ffmpeg"
  depends_on "uv"
  depends_on "yt-dlp"

  def install
    bin.install "yt-transcript"
  end

  test do
    assert_match "yt-transcript", shell_output("#{bin}/yt-transcript --help")
  end
end
