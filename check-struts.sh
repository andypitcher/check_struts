#!/bin/bash
#
# Auth: a.pitcher
# check_struts: Struts lib version checker 

struts_mlocate_true=struts_mlocate_$(hostname).txt
struts_lsof_true=struts_lsof_$(hostname).txt
TMP_result_true=struts_lsof_$(hostname).txt

print_version(){
#Check if $version is empty: return unknown
if [ ! -z "$2" ]
then
        echo "$1: $2"
else
        echo "$1: unknown"
fi
}

explode_lib(){

for libs in $(cat $1)
    do
          version=$(unzip -p $libs META-INF/MANIFEST.MF | grep 'Specification-Version\|Bundle-Version' | awk -F':' '{print $2}' | uniq)
          print_version $libs $version
	  ((var++))
    done
echo $var

}

struts_lsof() {

lsof | grep struts | awk '{print $10}' | grep 'jar$' | uniq > $struts_lsof_true

}

struts_mlocate(){

locate struts | grep 'jar$' | uniq > $struts_mlocate_true

}

struts_version () {

if struts_lsof
then
	echo -e "Libs path and versions loaded on the system:"
	explode_lib $struts_lsof_true
elif struts_mlocate
then
	echo -e "Libs path and versions installed on the system:"
	explode_lib $struts_mlocate_true
else
    echo -e "No struts lib found"
rm -rf $TMP_result_true
fi

}
struts_version
