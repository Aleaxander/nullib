#!/bin/bash

#
# The general install routine
#

INSTALL_ROUTINES=

[ -z $DEST_DIR ] && DEST_DIR=~/

. nullib.cfg
. lib.sh
. dot/install.sh

for i in $INSTALL_ROUTINES; do
	$i
done

echo
echo " All done"

