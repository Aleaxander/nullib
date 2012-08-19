#!/bin/bash

#
# The general install routine
#

INSTALL_ROUTINES=

. nullib.cfg 2>/dev/null || { echo " nullib.cfg: no such file";  exit 1; }
. lib.sh
. dot/install.sh
. kernel/install.sh
. scripts/install.sh

for i in $INSTALL_ROUTINES; do
	$i
done

echo
echo " All done"

