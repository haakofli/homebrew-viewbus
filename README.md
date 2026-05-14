# homebrew-viewbus

Homebrew tap for [ViewBus](https://viewbus.app) — an Azure Service Bus desktop
manager with a built-in MCP server.

## Install

```sh
brew install --cask haakofli/viewbus/viewbus
```

This installs the latest signed-by-nothing DMG and clears the macOS quarantine
attribute via a `postflight` step, so you won't hit the "app is damaged" dialog
on first launch.

## Requirements

- **Apple Silicon only** (`arm64`). Intel Macs can run it under Rosetta 2, but
  the build matrix no longer produces a `x86_64` artifact.
- macOS Big Sur (11) or later.

## Updating

`brew upgrade --cask viewbus` picks up new releases. The app's in-app update
toast on macOS only opens the download page — `brew` is the supported update
path.

## Maintainer notes

**`Casks/viewbus.rb` is auto-updated by the [main repo](https://github.com/haakofli/viewbus)'s
release workflow.** On every tag push, GitHub Actions rewrites the `version`
and `sha256` lines (line-anchored `sed`) and force-pushes the result here. Do
not hand-edit those two lines — your changes will be clobbered on the next
release.

Structural changes to the cask (new dependencies, zap entries, etc.) are safe
to edit by hand; only the two pinned lines are managed.
