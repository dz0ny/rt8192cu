Why dkms?
Dkms allows to compile the driver automatically when you install a new kernel.
Source: http://en.wikipedia.org/wiki/Dynamic_Kernel_Module_Support

Before installation:
- Please remove the none dkms version of this driver!
1. Change to the old driver directory (where the "Makefile" is)
2. Open terminal in this directory
3. Type: sudo make uninstall

Install dkms-driver:
1. Unpack rt8192cu_dkms.zip
2. Open terminal in rt8192cu_dkms
3. Type: chmod +x install.sh
4. Type: sudo ./install.sh
5. Restart your system

Uninstall dkms-driver:
1. Open terminal
2. Type: sudo dkms remove -m 8192cu -v 4.0.2.9000.20130911 --all