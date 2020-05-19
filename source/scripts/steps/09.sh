# --------------------------------------------------------------------
# STEP 09. Custom Bluetoothd.
# SOURCE: Compile Bluez. https://learn.adafruit.com/install-bluez-on-the-raspberry-pi/installation
echo ""
echo " STEP 09: Bluetooth Ecosystem."
# STEP 09: START.
# Download & Make
mkdir /opt/vendor/bluez
cd /opt/vendor/bluez
wget http://www.kernel.org/pub/linux/bluetooth/bluez-5.50.tar.xz
tar xvf bluez-5.50.tar.xz
cd bluez-5.50
# Dependencies
apt install -y libusb-dev libdbus-1-dev libglib2.0-dev libudev-dev libical-dev libreadline-dev
# Make
./configure
make
make install

# Enable Bluetooth Low Energy Features
sed -i -e 's;ExecStart=/usr/lib/bluetooth/bluetoothd;ExecStart=/usr/local/libexec/bluetooth/bluetoothd --experimental;' /lib/systemd/system/bluetooth.service

# Bluetooth Ecosystem
apt install -y bluetooth
apt install -y bluez-tools bluez-cups bluez-obexd blueman pulseaudio-module-bluetooth

# This firmware is required for operation of bluetooth dongles based on the Broadcom BCM203x chipset.
apt install -y bluez-firmware
# Add package with the firmware that matches your bluetooth device. EXAMPLE:
#apt install -y firmware-atheros

################PENDING: Node config
# NODE: Grants the node binary cap_net_raw privileges, so it can start/stop BLE advertising.
# Needs a package
#apt -y install libcap2-bin
#Needs to execute from regular user (non root)
#sudo setcap cap_net_raw+eip $(eval readlink -f `which node`)

# NODE: Use specific HCI Device
#sudo NOBLE_HCI_DEVICE_ID=1 node <your file>.js
################PENDING

# Start Bluetooth
systemctl start bluetooth.service
# Enable Bluetooth on boot
systemctl enable bluetooth.service
# STEP 09: END.
echo ""
echo "STEP 09: done!"
# --------------------------------------------------------------------
