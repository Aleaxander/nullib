# This file incudes some common routines

#
# just like cp binary, except it will create correspoing
# dir if not exist
function nice_cp()
{
	local DIR=`dirname $2`

	[ ! -d $DIR ] && mkdir -p $DIR

	cp $1 $2
}


#
# fill up the real user info based on the nullib.cfg
#
function update_user_info()
{
	sed  "s/NULLIB_LINUX_USER_NAME/$NULLIB_LINUX_USER_NAME/g" -i $1

	sed  "s/NULLIB_EMAIL_USER_NAME/$NULLIB_EMAIL_USER_NAME/g" -i $1
	sed  "s/NULLIB_EMAIL_ADDRESS/$NULLIB_EMAIL_ADDRESS/g" -i $1
}
