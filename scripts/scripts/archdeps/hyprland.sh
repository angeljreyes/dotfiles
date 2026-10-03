#!/usr/bin/env bash
if ! command -v yay &> /dev/null; then
	echo "You need yay to install these dependencies"
	exit 1
fi

yay -S --needed git hyprland hyprmoncfg-bin noctalia xdg-desktop-portal-hyprland ttf-jetbrains-mono-nerd\
	kitty wl-clipboard noto-fonts noto-fonts-emoji noto-fonts-cjk numix-cursor-theme adwaita-dark nwg-look\
	catppuccin-gtk-theme-mocha catppuccin-qt5ct-git darkly-bin alsa-utils pipewire pipewire-pulse\
	wireplumber polkit qt5ct qt6ct udiskie

echo "Done!"
echo "Once in a graphical session, you should run 'nwg-look', 'qt5ct' and 'qt6ct' to set the themes and cursors"
