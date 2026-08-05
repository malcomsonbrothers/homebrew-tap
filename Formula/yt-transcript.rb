class YtTranscript < Formula
  desc "Download model-compatible YouTube audio and transcribe locally"
  homepage "https://github.com/malcomsonbrothers/yt-transcript"
  version "0.2.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-macos-arm64.tar.gz"
    sha256 "ecc2a1aaf185a3673612c64f6c44b4af555446505fbce7c785d3ee7704fbec49"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-linux-x86_64.tar.gz"
    sha256 "862b93f517e701fbeda7449726d9f2f1a012ada8becb8331b21873b27d8a981b"
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
