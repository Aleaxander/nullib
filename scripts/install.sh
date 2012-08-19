INSTALL_ROUTINES="$INSTALL_ROUTINES execute_scripts"

function execute_scripts()
{
	cd scripts

	echo
	echo " Executing scripts ... "
	echo

	for i in *; do
		[ $i = "install.sh" ] && continue
		[ ! -x $i ] && echo " [PASS] $i" && continue

		echo " [RUN] $i"
		./$i
		echo " [DONE]"
		echo
	done
	cd ..
}
