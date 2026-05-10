# Juanipis Homebrew Tap

Custom [Homebrew](https://brew.sh) tap for [@Juanipis](https://github.com/Juanipis)' Mac apps.

## Install

```bash
brew install --cask juanipis/tap/fanctl
```

That's it. `brew` learns about the tap on first use.

## Available casks

| Name | Description |
|------|-------------|
| **[fanctl](https://github.com/Juanipis/fanctl)** | Native macOS fan controller for Apple Silicon. |

## Updating

```bash
brew update && brew upgrade --cask fanctl
```

## Uninstall

```bash
brew uninstall --cask fanctl
brew untap juanipis/tap     # if you also want the tap gone
```

## How this tap is maintained

Cask versions are bumped automatically on every new release of the upstream
project, by a workflow that runs in the source repo and pushes a commit
here. The bumps follow the rules in
[homebrew-casks/CONTRIBUTING.md](https://github.com/Homebrew/homebrew-cask/blob/master/CONTRIBUTING.md).
