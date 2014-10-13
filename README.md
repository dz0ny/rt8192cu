###Why DKMS?
Dkms allows to compile the driver automatically when you install a new kernel.

Source: http://en.wikipedia.org/wiki/Dynamic_Kernel_Module_Support

###Before installation:
- Please remove the none dkms version of this driver!
1. Change to the old driver directory (where the "Makefile" is)
2. Open terminal in this directory
3. Type: sudo make uninstall

###Install dkms-driver:
1. Unpack rt8192cu_dkms.zip
2. Open terminal in rt8192cu_dkms
3. Type: chmod +x install_driver.sh
4. Type: sudo ./install_driver.sh

###Uninstall dkms-driver:
1. Open terminal in rt8192cu_dkms
2. Type: chmod +x remove_driver.sh
3. Type: sudo ./remove_driver.sh

###Uninstall dkms-driver manualy:
1. Open terminal
2. Type: sudo dkms remove -m 8192cu -v 4.0.2.9000.20130911 --all
3. Type: sudo rm /etc/modprobe.d/blacklist-rtl-wlan-drivers.conf
4. Type: sudo rmmod 8192cu
5. Type: sudo modprobe rtl8192cu

###Changelog:
1. Newest realtek driver: http://goo.gl/01rZCY  (Name: RTL8192CU, Version: 4.0.2_9000, Release: 2013/10/29)
2. Procfs patch for kernel --> 3.10 (http://goo.gl/a8kgGi) --> tested on 3.10 - 3.17!
3. Script for easy installation & removal
