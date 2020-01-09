# == Class: go_carbon::service
#
# This class handles the service of the go-carbon.
#
#

class go_carbon::service {
  $ensure = $go_carbon::ensure
  $enable = $go_carbon::enable
}
