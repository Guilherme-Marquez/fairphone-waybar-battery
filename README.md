# Fairphone 4 Waybar Battery Indicator for PostmarketOS (POSh)

This repository contains scripts and configuration to display a custom battery indicator on **Waybar** for the **Fairphone 4** running **PostmarketOS (POSh)**.

## Background

On PostmarketOS for Fairphone 4, the default battery percentage is often **not displayed** in the status bar due to hardware interface limitations.  
These scripts read battery voltage and charging status directly from the system's **IIO device interface** and calculate an **estimated state-of-charge (SOC)**.

## What’s included

- **bin/waybar_battery.sh** – Custom Waybar module script that extracts the SOC from the battery script.  
- **scripts/battery_fp4.sh** – Reads the IIO device files, estimates battery voltage, temperature, and SOC.  
- **config/waybar/** – Waybar configuration and CSS for transparent display.  
- **systemd/waybar.service** – Optional systemd service to start Waybar with the custom battery module.  
- **install.sh** – Script to copy files to the correct locations, set permissions, and provide instructions to enable Waybar.

## Installation

1. Clone this repository

2. Enter the folder:

```bash
cd fairphone-waybar-battery
```

3. Run the installer:

```bash
./install.sh'
```

4. The installer will:

- Copy the scripts to /usr/local/bin/ and your home folder.

- Copy Waybar config and CSS to ~/.config/waybar/.

- Copy the systemd service to ~/.config/systemd/user/.

- Show instructions to start or enable Waybar.

---

Usage

1. To start Waybar manually:

```bash
pkill waybar
waybar &
```

2. To enable the service (starts automatically on login):

```bash
systemctl --user enable --now waybar.service
```


⚠️ Important Notes


Use with caution: Tested only on a single Fairphone 4 running PostmarketOS (POSh).

This is not guaranteed to work on other devices or setups.

I take no responsibility for any damage or unexpected behavior.
