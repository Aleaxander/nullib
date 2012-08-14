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
