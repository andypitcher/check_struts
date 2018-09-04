# check_struts
INFO:
NEW:
locate administrator/manifests/files/joomla.xml | xargs grep -H '<version>' | sed -e 's/<[^>]*>//g' -e 's/ //g'
locate wp-includes/version.php | xargs grep '$wp_version =' | sed -e 's/;//g' -e s+\'++g -e 's/$wp_version =//g'
locate modules/system/system.info | xargs grep "^version" | sed -e s+\'++g -e 's/version://g'
