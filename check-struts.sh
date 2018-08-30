#!/bin/bash
#
# Auth: a.pitcher
# check_struts: Struts lib version checker 

struts_mlocate_true=struts_mlocate_$(hostname).txt
struts_lsof_true=struts_lsof_$(hostname).txt
TMP_result_true=struts_lsof_$(hostname).txt

print_version(){

if [ ! -z "$2" ]
then
        echo "$1: $2"
else
        echo "$1: unknown"
fi
}

struts_lsof() {

lsof | grep struts | awk '{print $10}' > $struts_lsof_true

}

struts_mlocate(){

locate struts | grep jar > $struts_mlocate_true

}

struts_version () {

struts_lsof
struts_mlocate
if cat $struts_mlocate_true $struts_lsof_true | sort | uniq | grep jar > $TMP_result_true
then
echo -e "Libs path and versions loaded on the system:"
for libs in $(cat $TMP_result_true)
    do
          version=$(unzip -p $libs META-INF/MANIFEST.MF | grep -F Specification-Version 2>/dev/null | awk '{print $2}')
          print_version $libs $version
    done
else
    echo -e "No struts lib found"
rm -rf $TMP_result_true
fi
}
struts_version

