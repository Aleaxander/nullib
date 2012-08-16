INSTALL_ROUTINES="$INSTALL_ROUTINES execute_scripts"

function execute_scripts()
{
	cd scripts

	echo " Executing scripts ... "
	for i in *; do
		[ $i = "install.sh" ] && continue
		[ ! -x $i ] && echo " Script $i pass" && continue
		./$i
	done
	cd ..
}
