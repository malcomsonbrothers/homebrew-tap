# malcomsonbrothers Homebrew Tap

Homebrew tap for custom CLI tools.

## Install

```bash
brew tap malcomsonbrothers/tap
```

## Install Packages

```bash
brew install malcomsonbrothers/tap/yt-transcript
```

## Packages

### Formulae

- `yt-transcript` - Download model-compatible YouTube audio and transcribe locally with NeMo.

## Update / Uninstall

```bash
brew update
brew upgrade

brew uninstall yt-transcript
```

## Notes

- `yt-transcript` depends on `yt-dlp`, `ffmpeg`, and `uv` (installed automatically by Homebrew).
- First run downloads model weights and runtime dependencies into:
  - `~/.cache/huggingface/hub/`
  - `~/.cache/uv/`
- Bottles are not used for this formula; it installs a prebuilt release binary from GitHub Releases.
