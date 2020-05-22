# --------------------------------------------------------------------
# STEP 00: Enviromental Configuration.
# --------------------------------------------------------------------
echo ""
echo "STEP 00: Defaults"
# STEP: 00. START.
# Swap File
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
# OPT Structure
rm -rf /opt/vendor # Needed for Re-Install
mkdir /opt/vendor
rm -rf /opt/vendor/github # Needed for Re-Install
mkdir /opt/vendor/github
rm -rf /opt/vendor/github/dasosiot # Needed for Re-Install
mkdir /opt/vendor/github/dasosiot
cd /opt/vendor/github/dasosiot
git clone https://github.com/DASOSiot/sense.git
git clone https://github.com/DASOSiot/time.git
git clone https://github.com/DASOSiot/desk.git
# STEP 00: END.
echo ""
echo "STEP 00: done!"
# --------------------------------------------------------------------
