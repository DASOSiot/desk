# --------------------------------------------------------------------
# STEP 11. LXDE Desktop & Looks.
echo ""
echo " STEP 11: LXDE CUSTOM Desktop. "
# STEP 11: START.
apt install -y lxde-core lxde-common && # Desktop: Core & Tools
apt install -y openbox obconf && # Desktop: Window Manager
apt install -y alacarte && # Desktop: Menu Manager
apt install -y seahorse && #Desktop: User Tools
apt install -y xfce4-notifyd xfce4-power-manager xfce4-power-manager-plugins && # XFCE Addons
apt install -y network-manager network-manager-gnome network-manager-openvpn-gnome && # GNOME: Network Manager
apt install -y alsa-utils pavucontrol pulseaudio && # Desktop: Audio Manager
apt install -y xawtv tv-fonts && # Desktop: TV Viewer
apt install -y florence && # Desktop: Virtual Keyboard
apt install -y chromium-browser firefox-esr remmina && # Desktop: Internet
apt install -y baobab gparted gnome-disk-utility gsmartcontrol && # Desktop: Storage
apt install -y sysbench synaptic &&# System Tools

# STEP 11: END.
echo ""
echo "STEP 11: done!"
# --------------------------------------------------------------------
