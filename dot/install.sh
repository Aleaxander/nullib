INSTALL_ROUTINES="$INSTALL_ROUTINES install_dot_files"

function install_dot_files()
{
	cd dot

	echo " Installing dot files ..."
	for i in `find . -type f | sed 's#^./##'`; do
		[ $i = "install.sh" ] && continue

		nice_cp $i $NULLIB_DOT_DIR/.$i

		update_user_info $NULLIB_DOT_DIR/.$i
	done

	cd ..
}

