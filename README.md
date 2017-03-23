# DHCP relay Puppet Module

#### Table of Contents

1. [Description](#description)
2. [Configuration](#configuration)
3. [Installation](#installation)

## Description

Puppet module for managing and configuring a DHCP-relay server.


## Configuration

Minimal config:
```ruby
class { 'dhcrelay':
  interfaces => [ 'eth0', 'eth1'],
  dhcpserver => '10.0.0.1'
}
```

Other config options:
```ruby
class {'dhcrelay':
  package_ensure => absent,  #defaults to present
  service_ensure => stopped, #defaults to running
  service_enable => false    #defaults to true
}
```

Values can also be defined in hiera:
```ruby
dhcrelay::interfaces:
  - eth0
  - eth1
dhcrelay::dhcpserver: '10.0.0.1'
dhcrelay::package_ensure: absent
dhcrelay::service_ensure: stopped
dhcrelay::service_enable: false
```

## Installation

With a puppet file:
```
mod 'Fabian1976-dhcrelay',
  :git => 'https://github.com/Fabian1976/puppet-dhcrelay.git',
  :ref => '1.0.0'
```
or just clone this repo directly to your modules folder.
