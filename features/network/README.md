# Feature: network

Feature gives the ability to configure network interfaces in initrd.

## Boot parameters

- `ip={on|any|dhcp|dhcp4|dhcp6}` get configuration from DHCP server for all interfaces.
  - `{dhcp4}` get only IPv4 configuration;
  - `{dhcp6}` get only IPv6 configuration;
  - `{dhcp}` try them both.
- `ip=<interface>:<autoconf>[:[<mtu>][:<macaddr>]]` describes the configuration for a specific interface. Optionally if the device with `<macaddr>` has a different name, then the name will be changed to the specified `<interface>`.
- `ip=<ipaddr>:[<peer>]:<gw>:<netmask>:<hostname>:<interface>:<autoconf>[:[<mtu>][:<macaddr>]]` describes the network configuration explicitly. If you want do define a IPv6 address, put it in brackets (e.g. `[2001:DB8::1]`). The `<peer>` is optional and is the address of the remote endpoint for pointopoint interfaces and it may be followed by a slash and a decimal number, encoding the network prefix length. Optionally if the device with `<macaddr>` has a different name, then the name will be changed to the specified `<interface>`.
- `ip=<ipaddr>:[<peer>]:<gw>:<netmask>:<hostname>:<interface>:<autoconf>[:[<dns1>][:<dns2>]]` another way to describe the network configuration explicitly.
- `route=<net>/<netmask>:<gateway>[:<interface>]` adds a static route with route options, which are separated by a colon. IPv6 addresses have to be put in brackets. Example:
```
    route=192.168.200.0/24:192.168.100.222:eth0
    route=192.168.200.0/24:192.168.100.222
    route=192.168.200.0/24::eth0
    route=[2001:DB8:3::/8]:[2001:DB8:2::1]:eth0
```
- `nameserver=<IP>` specifies nameserver(s) to use. These servers will be listed before the DNS servers from the `ip` parameter.

IPv6 addresses must be in square brackets(`[...]`).
These parameters can be specified multiple times.

## Configuration

Inside the initramfs image, the configuration is located in the `/etc/network` directory.