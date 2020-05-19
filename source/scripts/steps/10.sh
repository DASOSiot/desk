# --------------------------------------------------------------------
# STEP 10. Users, Groups & Permissions.
echo ""
echo " STEP 10: Users, Groups & Passwords"
# STEP 10: START.
# CUSTOM user/group scripts.
bash ./users/00.sh &&
bash ./users/01.sh &&
# CUSTOM USER: Pirate (Hypriot)
# Bluetooth GROUP
usermod -aG bluetooth pirate
# PRINTER GROUP
usermod -aG lp pirate
# SCANNER GROUP#
usermod -aG scanner pirate
# STEP 10: END.
echo ""
echo "STEP 10: done!"
# --------------------------------------------------------------------
