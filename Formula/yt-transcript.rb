class YtTranscript < Formula
  desc "Download model-compatible YouTube audio and transcribe locally"
  homepage "https://github.com/malcomsonbrothers/yt-transcript"
  version "0.1.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-macos-arm64.tar.gz"
    sha256 "abe5ccfbbf0edffd552c149a966befaa5619ea617eaac8ac8a33776801368976"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-linux-x86_64.tar.gz"
    sha256 "e9ff605f838ca7df76b16c75a39406c7907518e8cba7978e672dee9867fd8b24"
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
