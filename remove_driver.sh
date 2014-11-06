#!/bin/bash
echo "Remove rt8192cu..."
sudo dkms remove -m 8192cu -v 4.0.2.9000.20130911 --all
sudo rm -r -d /usr/src/8192cu-4.0.2.9000.20130911
echo "Remove: /etc/modprobe.d/blacklist-rtl-wlan-drivers.conf..."
sudo rm /etc/modprobe.d/blacklist-rtl-wlan-drivers.conf
sleep 5
echo "Unload wlan drivers..."
sudo rmmod 8192cu
sleep 5
echo "Load wlan drivers..."
sudo modprobe rtl8192cu
