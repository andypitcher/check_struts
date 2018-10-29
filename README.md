# check_struts

This project has been created following 2017 [Equifax exploit]( https://thehackernews.com/2017/09/equifax-apache-struts.html)

The check_struts.sh script aim at retrieving any Apache struts libraries version and location found and/or loaded on the system.
It can be run directly on a server, or with the provided Ansible playbook.


## Possible Outputs:

- *"Libs path and versions loaded on the system:"*  

   The libraries found are currently running on the system, and could be accessible.

- *"Libs path and versions installed on the system:"* 

   The librairies are present on the filesystem, but not running.
   
 ## Example with Ansible Playbook:
 
 ```
 ➜  ansible-playbook git:(master) ✗ ansible-playbook play.yml -i inventory

PLAY [Check Struts] ***********************************************************************************************************************************************************************************************

TASK [ensure a list of packages installed] ************************************************************************************************************************************************************************
ok: [servername]

TASK [Upload script check-struts.sh] ******************************************************************************************************************************************************************************
ok: [servername]

TASK [Check if struts presence/version] ***************************************************************************************************************************************************************************
ok: [servername]

TASK [debug] ******************************************************************************************************************************************************************************************************
skipping: [servername]

TASK [Remove check-struts.sh] *************************************************************************************************************************************************************************************
ok: [servername]

PLAY RECAP ********************************************************************************************************************************************************************************************************
servername                 : ok=4    changed=0    unreachable=0    failed=0   

```   

[Apache Struts full CVEs](https://www.cvedetails.com/vulnerability-list/vendor_id-45/product_id-6117/Apache-Struts.html)
