class YtTranscript < Formula
  desc "Download model-compatible YouTube audio and transcribe locally"
  homepage "https://github.com/malcomsonbrothers/yt-transcript"
  version "0.1.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-macos-arm64.tar.gz"
    sha256 "655413060e8b201b4a66d428dcf9644be994322fcb1a8101844e01137d4ea2b8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-linux-x86_64.tar.gz"
    sha256 "9cf05d72e8b196c6e9263253b02c85d2b4002351b046f43058f7c9c512ff94f2"
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
