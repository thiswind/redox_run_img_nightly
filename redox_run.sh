#!/bin/bash - 
#===============================================================================
#
#          FILE: redox_run.sh
# 
#         USAGE: ./redox_run.sh 
# 
#   DESCRIPTION: run latest official released RedoxOS image automatically
# 
#       OPTIONS: linux or mac, not windows
#  REQUIREMENTS: python3 installed, pip installed
#          BUGS: 
#         NOTES: ---
#        AUTHOR: thiswind (thiswind@gmail.com), 
#  ORGANIZATION: 
#       CREATED: 2019/07/17 20:18
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# ensure virtualenv
echo "check if virtualenv installed ...."
if pip list | grep -F virtualenv; then
	echo "virtualenv is already installed"
else
	echo "install virtualenv..."
	pip install --user virtualenv
fi

echo "check if virtualenv activated"
if [ -e venv ]; then
	echo "venv is alrady exists"
else
	echo "setup venv..."
	virtualenv --python=python3 venv
fi

echo "activate venv"
. ./venv/bin/activate
which python

# ensure pre-requirements
pip install -r requirements.txt

# ensure harddrive.bin
if [ -f harddrive.bin ]; then
	echo "harddrive.bin is existing."
else
	# download latest redox official harddrive image
	wget -L -N $(curl -L https://static.redox-os.org/img/ | grep "harddrive.bin" | python fetch_image_url.py)
	cp *harddrive.bin.gz harddrive.bin.gz
	gzip -d harddrive.bin.gz
fi

# ensure emulator
#wget -L -N https://gitlab.redox-os.org/redox-os/redox/raw/master/bootstrap.sh
chmod a+x bootstrap.sh
./bootstrap.sh -d

# start redox os
qemu-system-x86_64 -serial mon:stdio -d cpu_reset -d guest_errors -smp 4 -m 1024 -s -machine q35 -device ich9-intel-hda -device hda-duplex -net nic,model=e1000 -net user -device nec-usb-xhci,id=xhci -device usb-tablet,bus=xhci.0 -drive file=harddrive.bin,format=raw
