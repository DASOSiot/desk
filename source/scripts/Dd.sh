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
#set -e # ERROR STOP
#STEPS: START.
bash ./steps/00.sh &&
bash ./steps/01.sh &&
bash ./steps/02.sh &&
bash ./steps/03.sh &&
bash ./steps/04.sh &&
bash ./steps/05.sh &&
bash ./steps/06.sh &&
bash ./steps/07.sh &&
bash ./steps/08.sh &&
bash ./steps/09.sh &&
bash ./steps/10.sh &&
bash ./steps/11.sh &&
bash ./steps/20.sh &&
#bash ./steps/21.sh &&
#
bash ./steps/99.sh &&
# STEPS: END.
echo "... STEPS completed."
# --------------------------------------------------------------------
# SCRIPT: END
