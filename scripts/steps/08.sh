# --------------------------------------------------------------------
# STEP 08. Common Tools.
echo ""
echo "STEP 08: DASOS Common Tools."
# STEP 08: START.
apt install -y git htop zip unzip build-essential make openvpn screen streamer
# Python3 Extras
apt install -y python3-pip libglib2.0-dev
# Python3 Packages
pip3 install bluepy
pip3 install setuptools
pip3 install RPI.GPIO
pip3 install adafruit-blinka
# STEP 08: END.
echo ""
echo "STEP 08: done!"
# --------------------------------------------------------------------
