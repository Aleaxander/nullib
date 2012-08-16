#!/bin/bash

#
# The general install routine
#

INSTALL_ROUTINES=

. nullib.cfg
. lib.sh
. dot/install.sh
. kernel/install.sh
. scripts/install.sh

for i in $INSTALL_ROUTINES; do
	$i
done

echo
echo " All done"

