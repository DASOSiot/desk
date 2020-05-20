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
mkdir /opt/vendor
mkdir /opt/vendor/dasos
cd /opt/vendor/dasos
# STEP 00: END.
echo ""
echo "STEP 00: done!"
# --------------------------------------------------------------------
