#!/bin/sh

FINDNAME=$0
while [ -h $FINDNAME ] ; do FINDNAME=`ls -ld $FINDNAME | awk '{print $NF}'` ; done
BASE=`echo $FINDNAME | sed -e 's@/[^/]*$@@'`
unset FINDNAME

if [ "$BASE" = '.' ]; then
   BASE=$(echo `pwd` | sed 's/\/bin//')
else
   BASE=$(echo $BASE | sed 's/\/bin//')
fi

VERFILE=$BASE/version.txt
BACKUPDIR=~/.backup/$(cat $VERFILE)

if [ ! -d ~/.backup ]; then
    mkdir ~/.backup
fi

echo move $BASE to $BACKUPDIR

mv $BASE $BACKUPDIR

exit 0
