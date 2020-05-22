# --------------------------------------------------------------------
# STEP 03: Xorg Server.
echo ""
echo "STEP 03: Xorg Server."
# STEP 03: START.
apt install -y --no-install-recommends xserver-xorg xinit xserver-xorg-video-fbdev x11-xserver-utils libgl1-mesa-dri libtxc-dxtn-s2tc &&
apt install -y policykit-1 hal-info &&
# STEP 03: END.
echo ""
echo "STEP 03: done!"
# --------------------------------------------------------------------
