// variables.pkr.hcl

// This file is associated with the ubuntu 22.04 build process.
// Modification may be required to make these variables compatible with other build pipelines.

variable "vsphere_server" {
    type = string
    default = ""
    sensitive = false
}

variable "vsphere_user" {
    type = string
    default = ""
    sensitive = false
}

variable "vsphere_password" {
    type = string
    default = ""
    sensitive = true
}

variable "vsphere_cluster" {
    type = string
    default = ""
    sensitive = false
}

variable "datastore" {
    type = string
    default = ""
    sensitive = false
}

variable "network_name" {
    type = string
    default = ""
    sensitive = false
}

variable "datacenter" {
  	type = string
	default = ""
	sensitive = false
}