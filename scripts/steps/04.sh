# --------------------------------------------------------------------
# STEP 04. Xorg Server Turbo.
# SOURCE: https://github.com/ssvb/xf86-video-fbturbo/wiki/Installation
echo ""
echo "STEP 04: Compiling fbturbo."
# STEP 04: START.
apt install -y git build-essential xorg-dev xutils-dev x11proto-dri2-dev &&
apt install -y libltdl-dev libtool automake libdrm-dev &&
mkdir /opt/vendor/ssvb
cd /opt/vendor/ssvb
git clone https://github.com/ssvb/xf86-video-fbturbo.git
cd xf86-video-fbturbo
autoreconf -vi
./configure --prefix=/usr
make
make install
cp xorg.conf /etc/X11/xorg.conf
# STEP 04: END.
echo ""
echo "STEP 04: done!"
# --------------------------------------------------------------------
