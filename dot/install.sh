INSTALL_ROUTINES="$INSTALL_ROUTINES install_dot_files"

function install_dot_files()
{
	cd dot

	echo
	echo ' Installing dot files...'
	echo

	for i in `find . -type f | sed 's#^./##'`; do
		[ $i = "install.sh" ] && continue

		nice_cp $i $NULLIB_DOT_DIR/.$i
	done

	cd ..
}
