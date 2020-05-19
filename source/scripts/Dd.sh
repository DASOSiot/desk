#!/bin/bash
# --------------------------------------------------------------------
# DASOS Desk: A HypriotOS based desktop powered by the DASOS Team.
# --------------------------------------------------------------------
# SCRIPT: START
# --------------------------------------------------------------------
echo ""
echo "DASOS Desktop Installer"
# --------------------------------------------------------------------
# STEPS: Configuration.
#set -v # VERBOSE
set -e # ERROR STOP
#STEPS: START.
bash ./steps/00.sh && # Defaults
bash ./steps/01.sh && # Update & Upgrade
bash ./steps/02.sh && # Display Options
bash ./steps/03.sh && # Graphic Engine
bash ./steps/04.sh && # Graphic Engine: Turbo (compiled)
bash ./steps/05.sh && # Display Manager
bash ./steps/06.sh && # Display Manager: Autologin
bash ./steps/07.sh && # Network Devices
bash ./steps/08.sh && # Common Tools
bash ./steps/09.sh && # Bluetooth: Upgrade (compiled)
bash ./steps/10.sh && # Users & Groups
bash ./steps/11.sh && # XX
bash ./steps/20.sh && # YY
#bash ./steps/21.sh &&
#
bash ./steps/99.sh &&
# STEPS: END.
echo "... STEPS completed."
# --------------------------------------------------------------------
# SCRIPT: END
