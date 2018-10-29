# check_struts

This [roject has been created following 2017 [Equifax exploit]( https://thehackernews.com/2017/09/equifax-apache-struts.html)

The check_struts.sh script aim at retrieving any Apache struts libraries version and location found and/or loaded on the system.
It can be run directly on a server, or with the provided Ansible playbook.


## Possible Outputs:

- *"Libs path and versions loaded on the system:"*  

   The libraries found are currently running on the system, and could be accessible.

- *"Libs path and versions installed on the system:"* 

   The librairies are present on the filesystem, but not running.
   

[Apache Struts full CVEs](https://www.cvedetails.com/vulnerability-list/vendor_id-45/product_id-6117/Apache-Struts.html)
