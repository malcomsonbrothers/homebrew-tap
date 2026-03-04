# malcomsonbrothers Homebrew Tap

Homebrew tap for custom CLI tools.

## Install

```bash
brew tap malcomsonbrothers/tap
```

## Install Packages

```bash
brew install --HEAD malcomsonbrothers/tap/yt-transcript
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
- The formula is currently HEAD-only. Once you cut a tagged release of `yt-transcript`, switch to a versioned formula URL + `sha256` so users can install without `--HEAD`.
