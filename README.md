# Realtek driver for 8192cu / 8188cu devices #


The in-tree kernel drivers for these devices do not work so the official realtek
drivers have to be used. Gladly, these were released as GPL code so we can
publish them freely. Unfortunately, they have some issues with 64bit machines so
this repository contains the fixes to make them work.

Please note that these fixes are not officially from realtek so there is no
guarantee that they work. However, I run this driver on my 64bit x86_64 linux
machine and they work like a charm. Furthermore, I try to keep them compatible
with linux-next. Therefore, they should work with every new kernel release.

If the current code does not compile with your kernel, please check out a
previous version that was known to work. I try to add tags for every kernel
release.

If there are issues, please do not hesitate to contact me. Furthermore, if any
of you can confirm that the in-tree kernel drivers work with these devices, I
will gladly drop this repository as it isn't really fun to maintain this.
## WHAT IS NEW? ##
Added support for kernel 3.10+ (3.11 working, 3.12 not tested)

## Install ##


### Easy Install on Ubuntu ###


On Ubuntu 13.10, the following commands ought to download and install this
module, replacing the buggy built-in rtl8192cu driver:
    
    sudo apt-get install git build-essential linux-headers-generic
    git clone https://github.com/dz0ny/rt8192cu.git
    cd rt8192cu
    make
    sudo make install
    sudo modprobe -r rtl8192cu
    sudo modprobe 8192cu
    echo "" | sudo tee -a /etc/modprobe.d/blacklist.conf
    echo "# Blacklist native RealTek 8188CUs drivers" | sudo tee -a /etc/modprobe.d/blacklist.conf   
    echo "blacklist rtl8192cu" | sudo tee -a /etc/modprobe.d/blacklist.conf   
    echo "blacklist rtl8192c_common" | sudo tee -a /etc/modprobe.d/blacklist.conf   
    echo "blacklist rtlwifi" | sudo tee -a /etc/modprobe.d/blacklist.conf   


### Hard Install ###

You need the kernel headers installed with a working symlink in
/lib/modules/<version>/kernel to your kernel sources. Then simply run:

    make
    
and use the new "8192cu.ko" kernel module. Do not mix it up with the in-kernel
file called

    rtl8192cu.ko
    
Also make sure that all other in-kernel realtek wlan drivers are unloaded so
this driver can claim the wlan-device.

You can clean up the directory tree with:

    make clean

## Patch ##

The ./patches/ directory contains an helper that can generate a patch with all
changes that can be applied to the latest tarball. This way, one does not have
to clone the whole repository to get the sources. Simply run:

    cd patches
    ./mkdiff.sh
    
This will generate ./patches/rt8192cu_diff.patch which can be applied with:

    patch -p1 <rt8192cu_diff.patch

to the original driver tarball which can also be found in this repository.

The current Realtek driver version that this repository is based on is:
    
    v3.4.4_4749.20121105

## License / Copying ##

The Realtek tarball didn't include license-terms, however, all code files that I
added to this repository are licensed as GPL-v2, therefore, there shouldn't be
any issues if you clone this.
