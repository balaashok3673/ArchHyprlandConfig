#!/bin/bash
# =========================================================
# Tokyo Minimal Hyprland Setup Script
# Post-install Arch Linux (Wayland chosen)
# Author: Custom config for ASUS TUF F15 FX506LHB Bala
# =========================================================

set -e

echo "🚀 Starting Tokyo Minimal Hyprland setup..."

# 1️⃣ Update system
sudo pacman -Syu --noconfirm

# 2️⃣ Install core packages
sudo pacman -S --noconfirm \
  hyprland waybar wofi mako kitty \
  wl-clipboard pavucontrol wpctl \
  cliphist hyprpaper sddm \
  noto-fonts ttf-jetbrains-mono \
  ttf-nerd-fonts-symbols

# 3️⃣ NVIDIA + Intel drivers
sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings \
 intel-media-driver libva-intel-driver libva \
 mesa vulkan-intel vulkan-icd-loader

# 4️⃣ Enable services
sudo systemctl enable sddm
sudo systemctl enable bluetooth
sudo systemctl enable NetworkManager

# 5️⃣ Copy configuration files
echo "📂 Copying configs..."
cp -r ./hypr ~/.config/
cp -r ./waybar ~/.config/
cp -r ./wofi ~/.config/
cp -r ./mako ~/.config/
cp -r ./kitty ~/.config/
cp -r ./hyprpaper ~/.config/
cp -r ./assets ~/.config/

# 6️⃣ Set fonts and themes
echo "🎨 Setting JetBrains Mono & TokyoNight theme..."
fc-cache -fv

# 7️⃣ Setup Plymouth for Arch logo splash
sudo pacman -S --noconfirm plymouth
sudo plymouth-set-default-theme -R arch-logo

echo "✅ Tokyo Minimal Hyprland setup complete!"
echo "Rebooting in 5 seconds..."
sleep 5
sudo reboot
