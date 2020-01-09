# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include go_carbon::config

class go_carbon::config {
  $user     = $go_carbon::user
  $conf_dir = $go_carbon::conf_dir

  file { "${conf_dir}/go-carbon.conf":
    ensure  => file,
    content => template('go_carbon/go-carbon.conf.erb')
  }

  file { "${conf_dir}/storage-aggregation.conf":
    ensure  => file,
    content => template('go_carbon/storage-aggregation.conf.erb')
  }

  #file { "${conf_dir}/storage-schemas.conf":
  #  ensure  => file,
  #  content => template('go_carbon/storage-schemas.conf.erb')
  #}
}
