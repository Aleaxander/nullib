INSTALL_ROUTINES="$INSTALL_ROUTINES install_dot_files"

function install_dot_files()
{
	cd dot

	echo " Installing dot files"
	for i in `find . -type f | sed 's#^./##'`; do
		[ $i = "install.sh" ] && continue

		nice_cp $i $DEST_DIR/.$i

		sed  "s/NULLIB_EMAIL_USER_NAME/$NULLIB_EMAIL_USER_NAME/g" -i $DEST_DIR/.$i
		sed  "s/NULLIB_EMAIL_ADDRESS/$NULLIB_EMAIL_ADDRESS/g" -i $DEST_DIR/.$i

		sed  "s/NULLIB_LINUX_USER_NAME/$NULLIB_LINUX_USER_NAME/g" -i $DEST_DIR/.$i
	done

	cd ..

}

