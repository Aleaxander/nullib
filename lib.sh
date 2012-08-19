# This file incudes some common routines

#
# fill up the real user info based on the nullib.cfg
#
function update_user_info()
{
	sed  "s/NULLIB_LINUX_USER_NAME/$NULLIB_LINUX_USER_NAME/g" -i $1

	sed  "s/NULLIB_EMAIL_USER_NAME/$NULLIB_EMAIL_USER_NAME/g" -i $1
	sed  "s/NULLIB_EMAIL_ADDRESS/$NULLIB_EMAIL_ADDRESS/g" -i $1
}


#
# just like cp binary, except it does in a much nicer way
#
function nice_cp()
{
	local DIR=`dirname $2`
	local tmp=`mktemp`
	local src=$1
	local dst=$2

	# 1. create correspoing dir if not exist
	[ ! -d $DIR ] && mkdir -p $DIR

	# 2. cp the source file to a temp file and update those NULLIB_XXX stuff
	cp $src $tmp
	update_user_info $tmp

	# 3. If dst does not exist, copy it directly
	[ ! -e "$dst" ] && {
		cp $tmp $dst
		echo " [DONE] $dst"
		rm $tmp
		return
	}

	# 4. Or, check the src and dst same or not. No matter in which case, do NO copy
	local sum1=`sha1sum $tmp | awk '{ print $1 }'`
	local sum2=`sha1sum $dst | awk '{ print $1 }'`

	[ $sum1 = $sum2 ] && echo " [SAME][PASS] $dst " || echo " [DIFF][PASS] $dst"

	rm $tmp
}
