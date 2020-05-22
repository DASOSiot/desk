# --------------------------------------------------------------------
# STEP 99. Cleanup.
echo ""
echo " STEP 99: Cleanup & Reboot."
# STEP 99: START.
apt -y autoremove
# STEP 99: END.
echo ""
echo "STEP 99: done!"
echo ""
echo "... DASOS Desk is now complete. The system will reboot now..."
sleep 5s
reboot
# --------------------------------------------------------------------
