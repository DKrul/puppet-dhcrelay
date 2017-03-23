class dhcrelay::config (
  $interfaces,
  $dhcpserver
) {

  file { '/usr/lib/systemd/system/dhcrelay.service':
    ensure  => present,
    content => template('dhcrelay/etc/systemd/system/dhcrelay.service.erb'),
    notify  => Service['dhcrelay'],
    require => Package['dhcp']
  }
  exec { "systemd_reload_${title}":
    command     => '/usr/bin/systemctl daemon-reload',
    subscribe   => File['/usr/lib/systemd/system/dhcrelay.service'],
    refreshonly => true,
  }
}
