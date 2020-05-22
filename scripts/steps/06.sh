# --------------------------------------------------------------------
# STEP 06. Display Manager. Autologin.
echo ""
echo "STEP 06: Autologin."
# STEP 06: START.
LIGHTDM_CONF_FILE=/etc/lightdm/lightdm.conf
if [ ! -f ${LIGHTDM_CONF_FILE}.sav ];

then
# backup original file
mv ${LIGHTDM_CONF_FILE} ${LIGHTDM_CONF_FILE}.original

cat << EOF | sudo tee ${LIGHTDM_CONF_FILE} >/dev/null
[SeatDefaults]
autologin-user=pirate
autologin-user-timeout=0
EOF

fi
cat ${LIGHTDM_CONF_FILE}
# STEP 06: END.
echo ""
echo "STEP 06: done!"
# --------------------------------------------------------------------
