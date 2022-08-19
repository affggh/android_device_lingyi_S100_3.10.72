#!/bin/sh
MYABSPATH=$(readlink -f "$0")
 PATCHBASE=$(dirname "$MYABSPATH")
 CMBASE=$(readlink -f "$PATCHBASE/../../../../")
 
 for i in $(find "$PATCHBASE"/* -type d); do
 	PATCHNAME=$(basename "$i")
 	PATCHTARGET=$PATCHNAME
 	for i in $(seq 4); do
 		PATCHTARGET=$(echo $PATCHTARGET | sed 's/_/\//')
 		if [ -d "$CMBASE/$PATCHTARGET" ]; then break; fi
 	done
 	echo "Apply $PATCHNAME -> $PATCHTARGET"
 	cd "$CMBASE/$PATCHTARGET" || exit 1
 	git apply -v "$PATCHBASE/$PATCHNAME"/* || echo -e "\033[41m- Faild\033[0m"
 	cd "$CMBASE"
 done
