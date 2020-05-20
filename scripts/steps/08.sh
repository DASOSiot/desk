# --------------------------------------------------------------------
# STEP 08. Common Tools.
echo ""
echo " STEP 08: DASOS Common Tools."
# STEP 08: START.
apt install -y git htop zip unzip build-essential make openvpn screen streamer
#Python2
apt install -y python-pip libglib2.0-dev
pip install bluepy
#Python3
apt install -y python3-pip libglib2.0-dev
pip3 install bluepy
# STEP 08: END.
echo ""
echo "STEP 08: done!"
# --------------------------------------------------------------------
