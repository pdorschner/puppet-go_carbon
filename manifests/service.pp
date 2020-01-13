# == Class: go_carbon::service
#
# This class handles the service of the go-carbon.
#
#

class go_carbon::service {
  $service_ensure = $go_carbon::service_ensure
  $service_enable = $go_carbon::service_enable

  service { $go_carbon::package_name :
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
