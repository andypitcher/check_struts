#!/bin/bash
#check_struts: Struts lib version checker 

print_version(){

if [ ! -z "$2" ]
then
	echo "$1: $2"
else
   	echo "$1: unknown"
fi	
}

struts_version () {
TMP_result=struts_lsof_$(hostname).txt
TMP_result_true=struts_versions_$(hostname).txt
lsof | grep struts > $TMP_result
dos2unix $TMP_result &> /dev/null
if grep -q struts $TMP_result && grep -qv 'check-strut\|struts_lsof\|struts_versions' $TMP_result
then
	echo -e "Libs path and versions loaded on the system:"
       	cat $TMP_result | awk '{print $9}' | sort | uniq -d | grep struts > $TMP_result_true
       	for libs in $(cat $TMP_result_true)
            do
	     	version=$(unzip -p $libs META-INF/MANIFEST.MF | grep -F Specification-Version 2>/dev/null | awk '{print $2}')
		print_version $libs $version
            done
else
       echo -e "No struts lib found"
fi
rm -rf $TMP_result $TMP_result_true
}
struts_version
