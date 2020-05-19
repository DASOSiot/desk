#!/bin/bash

# --------------------------------------------------------------------
# DASOS Desk: A HypriotOS based desktop environment to run in tandem with DASOS Forest.
# --------------------------------------------------------------------
# XORG Environment for HypriotOS
# Based On: https://raw.githubusercontent.com/hypriot/x11-on-HypriotOS/master/install-x11-basics.sh
#
# BLUETOOTH: Install & Configuration
# Based On: https://www.pcsuggest.com/linux-bluetooth-setup-hcitool-bluez/
# Based On: https://www.pcsuggest.com/bluetooth-linux-part-2/
# Based On: https://github.com/noble/noble#running-on-linux


# DONE--------------------------------------------------------------------
# STEP 02: Video Settings in Configuration File
# SOURCE: Raspberry Pi 3B Video Options: https://www.raspberrypi.org/documentation/configuration/config-txt/video.md
echo ""
echo "STEP 02: DASOS Desktop... Creating a /boot/config.txt"
CONFIG_TXT_FILE=/boot/config.txt
if [ ! -f ${CONFIG_TXT_FILE} ]; then

cat << EOF | sudo tee ${CONFIG_TXT_FILE} >/dev/null
display_rotate=0       # normal HDMI displays
#display_rotate=2      # 7" Touch Screen display from RaspberryPi.Org
EOF

fi
cat ${CONFIG_TXT_FILE}
echo "...done"


# DONE--------------------------------------------------------------------
# STEP 03.1. Xorg Server
echo ""
echo " STEP 03.1: DASOSdesk... Installing Graphic Engine."
sudo apt-get install -y --no-install-recommends xserver-xorg xinit xserver-xorg-video-fbdev x11-xserver-utils libgl1-mesa-dri libtxc-dxtn-s2tc
sudo apt-get install -y policykit-1 hal-info
echo "...done"
# DONE--------------------------------------------------------------------
# STEP 03.2. Xorg Server Turbo.
# SOURCE: https://github.com/ssvb/xf86-video-fbturbo/wiki/Installation
echo ""
echo " STEP 03.2: DASOSdesk... compiling fbturbo."
sudo apt-get install -y git build-essential xorg-dev xutils-dev x11proto-dri2-dev
sudo apt-get install -y libltdl-dev libtool automake libdrm-dev
sudo mkdir /opt/vendor/ssvb
cd /opt/vendor/ssvb
sudo git clone https://github.com/ssvb/xf86-video-fbturbo.git
cd xf86-video-fbturbo
sudo autoreconf -vi
sudo ./configure --prefix=/usr
sudo make
sudo make install
sudo cp xorg.conf /etc/X11/xorg.conf
echo "...done"


# DONE--------------------------------------------------------------------
# STEP 04:
echo ""
echo " STEP 04: DASOS Desktop Display Manager."
sudo apt-get install -y lightdm accountsservice
echo "...done"


# Done --------------------------------------------------------------------
# STEP 05.1 HypriotOS Core
echo ""
echo " STEP 05.1: DASOS Core Packages"
sudo apt-get install -y openvpn screen streamer
sudo apt-get install -y python-pip libglib2.0-dev
sudo pip install bluepy
sudo apt-get install -y python3-pip libglib2.0-dev
sudo pip3 install bluepy

# DONE 2/8--------------------------------------------------------------------
# STEP 05.2 LXDE Desktop & Utilities
echo ""
echo " STEP 05.2: DASOS Desktop Packages"
sudo apt-get install -y lxde lxde-common lxappearance florence alsa-utils openbox obconf alacarte # Appearance Tools
sudo apt-get install -y baobab gparted gnome-disk-utility gsmartcontrol # Storage Tools
sudo apt-get install -y pavucontrol # Audio Tools
sudo apt-get install -y xawtv tv-fonts # TV Viewer for X11
sudo apt-get install -y xfce4-notifyd # Notification tools
sudo apt-get install -y xfce4-power-manager # Power Tools
sudo apt-get install -y chromium-browser remmina # Internet Tools
sudo apt-get install -y sysbench synaptic # System Tools

echo "...done"


# DONE--------------------------------------------------------------------
# STEP 06. Network Devices
echo ""
echo " STEP 06: Network Devices"
sudo apt-get install -y avahi-daemon system-config-printer xsane cups
echo "...done"


# DONE--------------------------------------------------------------------
# STEP 07. Bluetooth
echo ""
echo " STEP 07: Bluetooth Ecosystem"
# Compile Bluez
# SOURCE: https://learn.adafruit.com/install-bluez-on-the-raspberry-pi/installation

# Download & Make
sudo mkdir /opt/vendor/bluez
cd /opt/vendor/bluez
sudo wget http://www.kernel.org/pub/linux/bluetooth/bluez-5.50.tar.xz
sudo tar xvf bluez-5.50.tar.xz
cd bluez-5.50
# Dependencies
sudo apt-get install -y libusb-dev libdbus-1-dev libglib2.0-dev libudev-dev libical-dev libreadline-dev
# Make
sudo ./configure
sudo make
sudo make install

# Enable Bluetooth Low Energy Features
sudo sed -i -e 's;ExecStart=/usr/lib/bluetooth/bluetoothd;ExecStart=/usr/local/libexec/bluetooth/bluetoothd --experimental;' /lib/systemd/system/bluetooth.service

# Bluetooth Ecosystem
sudo apt-get install -y bluetooth
sudo apt-get install -y bluez-tools bluez-cups bluez-obexd blueman pulseaudio-module-bluetooth

# This firmware is required for operation of Bluetooth dongles based on the Broadcom BCM203x chipset.
sudo apt-get install -y bluez-firmware
# Add package with the firmware that matches your device. EXAMPLE:
#sudo apt-get install firmware-atheros

# NODE: Grants the node binary cap_net_raw privileges, so it can start/stop BLE advertising.
# Needs a package
sudo apt-get install libcap2-bin
#Needs to execute from regular user (non root)
#sudo setcap cap_net_raw+eip $(eval readlink -f `which node`)

# NODE: Use specific HCI Device
#sudo NOBLE_HCI_DEVICE_ID=1 node <your file>.js


# Start & Enable Bluetooth on boot
sudo systemctl start bluetooth.service
#IMPORTANTE: la siguiente linea debe estar descomentada
sudo systemctl enable bluetooth.service

echo "...done"


# DONE--------------------------------------------------------------------
# STEP 08: Users, Groups & Passwords
echo ""
echo " STEP 08.1: Setting-Up Users, Groups & Passwords"
#source /opt/tools/DASOSusers.sh

# TEMPORARY with walmart user
sudo usermod -aG bluetooth pirate
sudo usermod -aG bluetooth pirate
#PRINTER GROUP
sudo usermod -aG lp pirate
#SCANNER GROUP#
sudo usermod -aG scanner pirate

echo "...done"

# DONE--------------------------------------------------------------------
echo ""
echo " STEP 08.2: Enable DASOS Desktop autologin for user=pirate"
LIGHTDM_CONF_FILE=/etc/lightdm/lightdm.conf
if [ ! -f ${LIGHTDM_CONF_FILE}.sav ]; then

# backup config file
sudo mv ${LIGHTDM_CONF_FILE} ${LIGHTDM_CONF_FILE}.sav
# new config file
cat << EOF | sudo tee ${LIGHTDM_CONF_FILE} >/dev/null
[SeatDefaults]
autologin-user=pirate
autologin-user-timeout=0
EOF

fi
cat ${LIGHTDM_CONF_FILE}
echo "...done"


# DONE--------------------------------------------------------------------
echo ""
echo " STEP 09: Removing unnecessary packages"
sudo apt-get -y autoremove


# DONE--------------------------------------------------------------------
echo ""
echo " STEP 10: Adding External Resources"
cd /opt/vendor

# SPEED TEST
# Based On: http://www.speedtest.net/
# Based On: https://www.raspberrypi-spy.co.uk/2015/03/measuring-internet-speed-in-python-using-speedtest-cli/
sudo mkdir /opt/vendor/sievel
cd /opt/vendor/sievel
sudo git clone https://github.com/sivel/speedtest-cli.git
cd /opt/vendor/sievel/speedtest-cli
sudo python3 speedtest.py --share

# ADAFRUIT EXAMPLES
sudo mkdir /opt/vendor/adafruit
cd /opt/vendor/adafruit
sudo git clone https://github.com/adafruit/adafruit-pi-cam.git
sudo git clone https://github.com/adafruit/Adafruit_Python_BMP.git
sudo git clone https://github.com/adafruit/Adafruit_Python_DHT.git
sudo git clone https://github.com/adafruit/Adafruit_Python_LED_Backpack.git
sudo git clone https://github.com/adafruit/Adafruit-RasPipe.git
sudo git clone https://github.com/adafruit/FreqShow.git
sudo git clone https://github.com/adafruit/pi_hello_video.git
sudo git clone https://github.com/adafruit/Raspberry-Pi-Installer-Scripts.git
sudo git clone https://github.com/adafruit/rpi-fb-matrix.git

# PIMORONI EXAMPLES
sudo mkdir /opt/vendor/pimoroni
cd /opt/vendor/pimoroni
sudo git clone https://github.com/pimoroni/blinkt.git


# DONE--------------------------------------------------------------------
echo ""
echo "...DASOS Desk: DONE!!!... Reboting ..."
sleep 3s
sudo reboot
