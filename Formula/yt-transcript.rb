class YtTranscript < Formula
  desc "Download model-compatible YouTube audio and transcribe locally"
  homepage "https://github.com/malcomsonbrothers/yt-transcript"
  version "0.1.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-macos-arm64.tar.gz"
    sha256 "40e7a0b253e4edac8a1f10605486338be53b4492748511882e409b6da93b3de4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-linux-x86_64.tar.gz"
    sha256 "29f0540d2ed23ffeca95767299f0997d6d9d5c55f4139a7cddbb03f6457c6b69"
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
