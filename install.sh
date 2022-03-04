#!/bin/bash

if [ $# -lt 1 ] ; then
	echo -e "\nNeed target directory\n"
	echo -e "(e.g. $(basename $0) /usr/local/bin)\n"
	exit 1
fi

TARGET=$1

if [ ! -d $TARGET ] ; then
	echo -e "\nDirectory $TARGET missing...\n"
	exit 1
fi

cd $(dirname $0)

installit()
{
	sudo /bin/cp -av $1 $TARGET
}

installit clearcache
installit updatesrpms
installit hardreboot
installit updateyumlist

