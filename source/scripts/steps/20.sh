# --------------------------------------------------------------------
# STEP 20. External Resources. Speedtest .
# SOURCE: http://www.speedtest.net/
echo ""
echo " STEP 20: External. Speedtest. "
# STEP 20: START.
mkdir /opt/vendor/sievel
cd /opt/vendor/sievel
git clone https://github.com/sivel/speedtest-cli.git
cd /opt/vendor/sievel/speedtest-cli
python3 speedtest.py --share
# STEP 20: END.
echo ""
echo "STEP 20: done!"
