class dhcrelay::install (
  $ensure
) {

  package { 'dhcp':
    ensure => $ensure
  }
}
