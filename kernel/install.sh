INSTALL_ROUTINES="$INSTALL_ROUTINES install_kernel_stuff"

function install_kernel_stuff()
{
	cd kernel

	echo " Installing kernel stuff ..."
	for i in `find . -type f | sed 's#^./##'`; do
		[ $i = "install.sh" ] && continue

		nice_cp $i $NULLIB_LINUX_KERNEL_DIR/$i

		update_user_info $NULLIB_LINUX_KERNEL_DIR/$i
	done

	cd ..

}

