# Homebrew tap for losh

This tap distributes [losh](https://github.com/akrentsel/losh), a local coding
agent interface for remote machines reached through SSH.

## Install

    brew install akrentsel/tap/losh

Codex is currently the supported local harness. Install and authenticate it
separately if needed:

    brew install --cask codex
    codex login status

Then connect to any host that already works with ordinary SSH:

    ssh user@example.com true
    losh user@example.com

To add the tap explicitly before installing:

    brew tap akrentsel/tap
    brew install losh
