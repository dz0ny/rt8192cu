#!/bin/bash
sudo mv rt8192cu /usr/src/8192cu-4.0.2.9000.20130911
sleep 5 
sudo dkms add -m 8192cu -v 4.0.2.9000.20130911
sleep 5
sudo dkms build -m 8192cu -v 4.0.2.9000.20130911
sleep 5
sudo dkms install -m 8192cu -v 4.0.2.9000.20130911
sleep 5
echo "RESTART YOUR SYSTEM PLEASE!"