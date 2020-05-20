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
#set -v # VERBOSE OPERATIONS
set -e # STOP IF ERROR
#STEPS: START.
bash ./scripts/steps/00.sh $1 $2 $3 $4 $5 && # Defaults
bash ./scripts/steps/01.sh $1 $2 $3 $4 $5 && # Update & Upgrade
bash ./scripts/steps/02.sh $1 $2 $3 $4 $5 && # Display Options
bash ./scripts/steps/03.sh $1 $2 $3 $4 $5 && # Graphic Engine
bash ./scripts/steps/04.sh $1 $2 $3 $4 $5 && # Graphic Engine: Turbo (compiled)
bash ./scripts/steps/05.sh $1 $2 $3 $4 $5 && # Display Manager
bash ./scripts/steps/06.sh $1 $2 $3 $4 $5 && # Display Manager: Autologin
bash ./scripts/steps/07.sh $1 $2 $3 $4 $5 && # Network Devices
bash ./scripts/steps/08.sh $1 $2 $3 $4 $5 && # Common Tools
bash ./scripts/steps/09.sh $1 $2 $3 $4 $5 && # Bluetooth: Upgrade (compiled)
bash ./scripts/steps/10.sh $1 $2 $3 $4 $5 && # Users & Groups
bash ./scripts/steps/11.sh $1 $2 $3 $4 $5 && # XX
bash ./scripts/steps/20.sh $1 $2 $3 $4 $5 && # Speedtest
bash ./scripts/steps/21.sh $1 $2 $3 $4 $5 && # Adafruit
bash ./scripts/steps/22.sh $1 $2 $3 $4 $5 && # Pimoroni
#
bash ./steps/99.sh $1 $2 $3 $4 $5 &&
# STEPS: END.
echo "... STEPS completed. Bye $1. Enjoy!"
# --------------------------------------------------------------------
# SCRIPT: END
