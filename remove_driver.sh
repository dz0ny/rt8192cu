#!/bin/bash
echo "Remove rt8192cu..."
sudo dkms remove -m 8192cu -v 4.0.2.9000.20130911 --all
echo "Remove: /etc/modprobe.d/blacklist-rtl-wlan-drivers.conf..."
sudo rm /etc/modprobe.d/blacklist-rtl-wlan-drivers.conf
read -p "Press [Enter] to reboot your PC..." cd
sudo reboot