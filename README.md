# packer-builds

Packer templates for vSphere

The .pkrvars.hcl files are untracked due to sensitive information contained within, so drop a vars.auto.pkrvars.hcl file into the directory with the build file.

The pkrvars file will need the following fields:

```hcl
vsphere_server = ""
vsphere_user = ""
vsphere_password = ""
datacenter = ""
vsphere_cluster = ""
datastore = ""
network_name = ""
folder = ""
```