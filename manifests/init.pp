class dhcrelay (
  $interfaces     = undef,
  $dhcpserver     = undef,
  $package_ensure = present,
  $service_ensure = running,
  $service_enable = true
) {

  if ! $interfaces {
    fail "Class ${title} included but no interfaces defined. Can't do anything without them!"
  }

  if ! $dhcpserver {
    fail "Class ${title} included but no dhcpserver defined. Can't do anything without them!"
  }

  assert_type(Array, $interfaces) | $expected, $actual | { fail "Parameter ${title}::interfaces should be '${expected}', not '${actual}'." }
  class { 'dhcrelay::install':
    ensure => $package_ensure
  } ->

  class { 'dhcrelay::config':
    interfaces => $interfaces,
    dhcpserver => $dhcpserver
  } ->

  class { 'dhcrelay::service':
    ensure => $service_ensure,
    enable => $service_enable
  }

}
