# --------------------------------------------------------------------
# STEP 10. Users, Groups & Permissions.
echo ""
echo " STEP 10: Users, Groups & Permissions"
# STEP 10: START.
# CUSTOM user/group scripts.
bash ./scripts/users/00.sh &&
bash ./scripts/users/01.sh &&
# CUSTOM USER: Pirate (Hypriot)
# Bluetooth GROUP
usermod -aG bluetooth $1
# PRINTER GROUP
usermod -aG lp $1
# SCANNER GROUP#
usermod -aG scanner $1
# STEP 10: END.
echo ""
echo "STEP 10: done!"
# --------------------------------------------------------------------
