source "vsphere-iso" "template-ubuntu2204" {
  // vSphere
  vcenter_server          = var.vsphere_server
  username                = var.vsphere_user
  password                = var.vsphere_password
  datacenter              = var.datacenter
  cluster                 = var.vsphere_cluster
  insecure_connection     = true
  folder                  = var.folder

  // Template
  create_snapshot         = true
  snapshot_name           = "clean"
  convert_to_template     = true

  // VM
  vm_name                 = "template-ubuntu-22.04"
  guest_os_type           = "ubuntu64Guest"
  vm_version              = 19 // Hardware v19 requires ESXI 7.0.2, Fusion 12.2.x, Workstation Pro/Player 16.2.x
  CPUs                    = 2
  RAM                     = 4096
  RAM_reserve_all         = true
  disk_controller_type    = ["pvscsi"]
  datastore               = var.datastore
  iso_paths               = ["[datastore1] ISO/ubuntu-22.04.1-live-server-amd64.iso"]

  storage {
    disk_size             = 16384
    disk_thin_provisioned = false
  }

  network_adapters {
    network               = var.network_name
    network_card          = "vmxnet3"
  }

  // SSH
  ssh_timeout             = "20m"
  ssh_clear_authorized_keys = true
  ssh_username            = "vmadmin"
  ssh_password            = "$6$Da/Bin6we2OOJCVD$HM00JdEP47D.cVfSYzwf71khVHPD8NqbYLGw/iXPswndEqI2TNsMELWRCt0tA2.mVMPjFZlPI0B/xOBO9OhF01"
  http_directory          = "http"
  shutdown_command        = "sudo shutdown -P now"

  // Boot
  boot_keygroup_interval = "10ms"
  boot_wait               = "5s"
  boot_command            = [
    "c<wait>",
    "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/\"",
    "<enter><wait>",
    "initrd /casper/initrd",
    "<enter><wait>",
    "boot",
    "<enter>"
  ]
}

build {
  sources  = [
    "source.vsphere-iso.template-ubuntu2204"
  ]

  provisioner "shell-local" {
    inline  = ["echo the address is: $PACKER_HTTP_ADDR and build name is: $PACKER_BUILD_NAME"]
  }
}
