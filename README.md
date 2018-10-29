# check_struts

This script aim at retrieving any Apache struts libraries version and location found and/or loaded on the system.
It can be run directly on a server, or with the provided Ansible playbook.

Based on recent exploit such as: https://thehackernews.com/2018/08/apache-struts-vulnerability.html
Struts CVE: https://www.cvedetails.com/vulnerability-list/vendor_id-45/product_id-6117/Apache-Struts.html


## Possible Outputs:

- *"Libs path and versions loaded on the system:"*  

   The libraries found are currently running on the system, and could be accessible.

- *"Libs path and versions installed on the system:"* 

   The librairies are present on the filesystem, but not running.


