#!/bin/bash
echo "Letöltés..."
wget -b https://raw.githubusercontent.com/bpk-ctrl/sh/refs/heads/main/kirugás.sh
sudo chmod +x kirugás.sh
sudo cp kirugás.sh /usr/bin/kirugas
sleep 1
echo "Letöltve."
sudo apt install wireless-tools
sudo apt install aircrack-ng
read
kirugas
