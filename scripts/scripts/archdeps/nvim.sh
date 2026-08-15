#!/usr/bin/env bash
sudo pacman -S --needed git neovim fd ripgrep xclip wl-clipboard ttf-jetbrains-mono-nerd unzip imagemagick mise wget\
	tree-sitter-cli jq dotnet-sdk tectonic ghostscript
eval "$(mise activate)"
mise use -g node
dotnet tool install -g dotnet-outdated-tool
