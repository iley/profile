LOCALRC=$PROFILE/local/`hostname`
if [ -e $LOCALRC ]
then
	source $LOCALRC
fi
