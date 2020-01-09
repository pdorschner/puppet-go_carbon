# == Class: go_carbon::install
#
# This class handles the installation of the go-carbon.
#
#

class go_carbon::install {
  $package_name     = $go_carbon::package_name
  $version          = $go_carbon::version
  $package_url      = $go_carbon::package_url
  $arch             = $facts['os']['architecture']
  $manage_package   = $go_carbon::manage_package
  $download_package = $go_carbon::download_package

  ## These variables only needed for Debian
  $download_path    = $go_carbon::download_path
  $full_packagename = "${package_name}_${version}_${arch}.deb"
  ##

  if $download_package {
    $package_source   = inline_template($package_url)
    $package_provider = $go_carbon::package_provider
  } else {
    $package_source   = undef
    $package_provider = undef
  }

  # On debian it's mandatory to install wget
  if $manage_package {
    if $facts['os']['family'] == 'Debian' {
      exec { 'retrieve_go_carbon' :
        command => "/usr/bin/wget -q ${package_source} -O ${download_path}/${full_packagename}",
        creates => "${download_path}/${full_packagename}",
      }

      file { "${download_path}/${full_packagename}" :
        ensure  => file,
        require => Exec['retrieve_go_carbon'],
      }

      package { $package_name :
        ensure   => installed,
        provider => $package_provider,
        source   => "${download_path}/${full_packagename}",
        require  => File["${download_path}/${full_packagename}"],
      }
    }
    else{
      package { $package_name :
        ensure   => installed,
        provider => $package_provider,
        source   => $package_source,
      }
    }
  }
}
