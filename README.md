# Homebrew tap for SculptForge

[SculptForge](https://github.com/islandmed/SculptForge) is a free, open-source digital sculpting app for Windows,
macOS and Linux. This tap installs it on macOS with [Homebrew](https://brew.sh).

```sh
brew install --cask islandmed/tap/sculptforge       # taps this repository the first time
brew upgrade --cask sculptforge                     # later, to update
brew uninstall --cask --zap sculptforge             # remove it and its settings (leave out --zap to keep them)
```

You get `SculptForge.app` in Applications, and `sculptforge-cli` (the command line tool and MCP server) on your
`PATH`. It needs macOS 11 (Big Sur) or newer; one universal build runs on Apple silicon and Intel.

## What is in here

| File | What |
|---|---|
| `Casks/sculptforge.rb` | The cask. It downloads `SculptForge-<version>-darwin-universal.dmg` from the [GitHub release](https://github.com/islandmed/SculptForge/releases) of the same version and checks its SHA-256 |

The app is signed ad hoc, not notarized yet, so the cask removes macOS's quarantine flag after installing; without
that macOS would refuse to open it. Installing by hand from the release page works too (right-click the app and choose
**Open** the first time).

## How it is updated

Every SculptForge release updates the cask (`version` and `sha256`) as one step of the release script
([`scripts/release.sh`](https://github.com/islandmed/SculptForge/blob/main/scripts/release.sh)), and the step fails
the release if the cask does not carry the real checksum of the published `.dmg`. So the tap is never behind a
release, and there is nothing to bump by hand: please don't open version-bump pull requests here.

## Questions and problems

Bugs, install trouble and ideas go to [SculptForge's issues](https://github.com/islandmed/SculptForge/issues); the
[guide](https://sculptforge.app/guide/installing.html) covers installing on every platform, and the
[Discord](https://discord.gg/gWrYkEmQhH) is the place for questions. SculptForge is free software under the
[GPL-3.0-or-later](https://github.com/islandmed/SculptForge/blob/main/LICENSE): <https://sculptforge.app>.
