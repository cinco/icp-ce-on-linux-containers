resource "lxd_profile" "icp_ce_mgmt" {
  name      = "${var.env_prefix}-${var.icp_ce_mgmt_profile_name}"
  description = "Demo ICP CE Profile for Management node"
  config {
     #limits.cpu = "${var.mgmt_cpu}"
     #user.user-data = "${file("./user-data/cloud-config-icp.yaml")}"
   }

   device {
     name = "${var.net_device_name}"
     type = "${var.net_device_type}"

     properties {
       parent="${var.net_device_parent[0]}"
       nictype="${var.net_device_nic_type}"
       ipv4.address = "${cidrhost(var.ipv4_address_cidr_profile[0],var.mgmt_host_num)}"
     }
   }
}

### Define the output to use in root main.tf
output "icp_ce_mgmt_profile_name_output" {
  value = "${lxd_profile.icp_ce_mgmt.name}"
}
