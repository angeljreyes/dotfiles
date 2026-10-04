#!/usr/bin/env bash

sudo systemctl enable fstrim.timer
sudo timedatectl set-ntp true
sudo pacman -S --needed amd-ucode bluez bluez-utils nvidia-utils lib32-nvidia-utils mesa vulkan-radeon lib32-vulkan-radeon\
	brightnessctl pipewire pipewire-pulse wireplumber tuned tuned-ppd
sudo systemctl enable --now bluetooth.service tuned.service

# Use pipewire instead of pulseaudio.
# Pulseaudio is buggy on this laptop.
sudo systemctl --user enable --now pipewire pipewire-pulse wireplumber
