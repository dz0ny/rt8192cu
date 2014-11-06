#!/bin/bash
echo "Install rt8192cu..."
sudo mv rt8192cu /usr/src/8192cu-4.0.2.9000.20130911
sleep 5 
sudo dkms add -m 8192cu -v 4.0.2.9000.20130911
sleep 5
sudo dkms build -m 8192cu -v 4.0.2.9000.20130911
sleep 5
sudo dkms install -m 8192cu -v 4.0.2.9000.20130911
sleep 5
echo "Create: /etc/modprobe.d/blacklist-rtl-wlan-drivers.conf..."
sudo touch /etc/modprobe.d/blacklist-rtl-wlan-drivers.conf
echo "# Blacklist native RealTek 8192CU-Driver" | sudo tee -a /etc/modprobe.d/blacklist-rtl-wlan-drivers.conf
echo "blacklist rtl8192cu" | sudo tee -a /etc/modprobe.d/blacklist-rtl-wlan-drivers.conf
sleep 5
echo "Unload wlan drivers..."
sudo rmmod rtl8192cu
sleep 5
echo "Load wlan drivers..."
sudo modprobe 8192cu
