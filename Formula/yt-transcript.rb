class YtTranscript < Formula
  desc "Download YouTube audio and transcribe it with Together AI or a local runtime"
  homepage "https://github.com/malcomsonbrothers/yt-transcript"
  version "0.3.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-macos-arm64.tar.gz"
    sha256 "6a085b79e5e8b84906eef5e2ec4f6c6c7cc1546489dca3c19893ddf875e3f9b0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/malcomsonbrothers/yt-transcript/releases/download/v#{version}/yt-transcript-v#{version}-linux-x86_64.tar.gz"
    sha256 "dfc037f39b518931165b65412fd07b6c70dbd3d794cf6f28c5fe680fb948d191"
  end

  head "https://github.com/malcomsonbrothers/yt-transcript.git", branch: "master"

  # yt-dlp is deliberately not a dependency. It is resolved from PATH (or via
  # --yt-dlp-path), so pinning it here would shadow a newer install with
  # Homebrew's stable build. YouTube breaks yt-dlp often enough that users
  # need to choose their own channel.
  depends_on "ffmpeg"
  depends_on "uv"

  def install
    bin.install "yt-transcript"
  end

  def caveats
    <<~EOS
      yt-transcript needs yt-dlp on your PATH; it is not installed as a
      dependency so you can pick the release channel yourself. YouTube breaks
      yt-dlp regularly and fixes land in nightly weeks before stable, so the
      nightly channel is recommended:

        uv tool install --prerelease allow "yt-dlp[default]"
        uv tool upgrade --prerelease allow yt-dlp

      Cloud transcription (the default) needs TOGETHER_API_KEY.
    EOS
  end

  test do
    assert_match "yt-transcript", shell_output("#{bin}/yt-transcript --help")
  end
end
