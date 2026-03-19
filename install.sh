#!/bin/bash
echo "Installing Waybar battery scripts..."

# Copy scripts to system locations
sudo cp bin/waybar_battery.sh /usr/local/bin/
sudo cp scripts/battery_fp4.sh /home/$USER/
sudo chmod +x /usr/local/bin/waybar_battery.sh /home/$USER/battery_fp4.sh

# Copy Waybar config and style
mkdir -p ~/.config/waybar
cp config/waybar/config ~/.config/waybar/
cp config/waybar/style.css ~/.config/waybar/

# Copy systemd service
mkdir -p ~/.config/systemd/user
cp systemd/waybar.service ~/.config/systemd/user/
systemctl --user daemon-reload

echo "Installation complete."
echo "You can enable the service with:"
echo "  systemctl --user enable --now waybar.service"
echo "Or start Waybar manually with:"
echo "  pkill waybar; waybar &"

echo "⚠️ Use with caution: Tested only on a single Fairphone 4. I take no responsibility."
