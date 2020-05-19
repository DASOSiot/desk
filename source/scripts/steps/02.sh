# --------------------------------------------------------------------
# STEP 02: Raspberry Pi 3B Video Options
# SOURCE: https://www.raspberrypi.org/documentation/configuration/config-txt/video.md
# --------------------------------------------------------------------
echo ""
echo "STEP 02: Video Display Options"
# STEP 02: START.
CONFIG_TXT_FILE=/boot/config.txt
if [ ! -f ${CONFIG_TXT_FILE} ];

then
# backup original file
mv ${CONFIG_TXT_FILE} ${CONFIG_TXT_FILE}.original

cat << EOF | sudo tee ${CONFIG_TXT_FILE} >/dev/null
display_rotate=0       # Normal HDMI displays
#display_rotate=2      # EXAMPLE: 7" Touch Screen display from RaspberryPi.Org
EOF

fi
cat ${CONFIG_TXT_FILE}
# STEP 02: END.
echo ""
echo "STEP 02: done!"
# --------------------------------------------------------------------
