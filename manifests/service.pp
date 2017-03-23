class dhcrelay::service (
  $enable,
  $ensure,
) {
  service { 'dhcrelay':
    enable => $enable,
    ensure => $ensure,
  }
}
