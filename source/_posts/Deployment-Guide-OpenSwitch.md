---
title: Deployment Guide - OpenSwitch
date: 2017-03-10 00:15:16
updated: 2017-03-10 00:15:16
tags:
- opx
- deployment
- onie
---

<br />
{% img https://archive.openswitch.net/logo/OpenSwitchLogo4Sticker.png 300 400 %} 
<br />

## Introduction to OpenSwitch

{% blockquote OpenSwitch http://www.openswitch.net/ %}
The OpenSwitch OPX system is an innovative operating system for network systems. This information describes how it enables you to unleash new and creative ways to deploy, orchestrate, and manage your networking, servers, and storage solutions in your data centers and enterprise environments.
{% endblockquote %}

## Getting Started

1. Check Support Platform list
2. Choose the [OpenSwitch installer version][4]
3. Install OpenSwitch into Edgecore switch via ONIE
4. Login OpenSwitch
5. Do anything you want to on OpenSwitch

## Support Platform
- [Edgecore AS7712-32X][3]
- [Edgecore AS6712-32X][2]
- [Edgecore AS5712-54X][1]

## Enter ONIE (Rescue Mode)

- Connect to console port via console cable
  - 115200/8/n/1
- Power-on switch
- Select `ONIE -> ONIE: Rescue` when you see the GRUB menu

## Install OpenSwitch (Example: Edgecore AS5712-54X)

<!--more-->

- Install via USB
```bash
mkdir /tmp/onie-image
mount /dev/<USB Devices> /tmp/onie-image
cd /tmp/onie-image
onie-nos-install openswitch-onie-installer-x86_64-as5712_54x-ops-1.0.0-release+2017030612
```

## Default Username in OpenSwitch

`root`

## Quick Start
```
root@switch:~# vtysh
switch# show version
OpenSwitch 1.0.0 (Build: as5712-ops-1.0.0-release+2017030612)
switch# show ?
  aaa                Show authentication options
  access-list        Access control list (ACL)
  alias              Short names configured for a set of commands
  arp                Show IPv4 addresses from neighbor table
  autoprovisioning   Show auto provisioning status
  bgp                BGP specific commands
  broadview          BroadView information
  copp               Show COPP information
  core-dump          Display core-dump list
  date               Shows system date information
  debugging          Debugging Configuration
  dhcp-relay         Show dhcp-relay configuration
  dhcp-server        Display DHCP Server Configuration
  domain-name        Display domain name
  events             Display all log events
  hostname           Display hostname
  interface          Interface infomation
  ip                 IP information
  ipv6               IPv6 information
  lacp               Show various LACP settings
  lldp               Show various LLDP settings
  logrotate          Show logrotate config parameters
  mac-address-table  Show L2 MAC address table information
  mirror             Configure Mirroring
  ntp                Show NTP information
  qos                Show QoS Configuration
  radius-server      Show radius server configuration
  rib                Routing Information Base
  running-config     Current running configuration
  session-timeout    Idle session timeout in minutes
  sflow              SFLOW Configuration
  sftp               SSH File Transfer Protocol
  snmp               snmp configuration
  snmpv3             snmp version 3 configurations
  spanning-tree      Spanning-tree configuration
  ssh                Show SSH configuration
  startup-config     Contents of startup configuration
  system             System information
  tech               Display output of a predefined command sequence used by technical support
  tftp-server        Display TFTP Server Configuration
  version            Displays switch version
  vlan               Show VLAN configuration
  vlog               Display all vlogs
  vrf                VRF Configuration
```

## Install and Booting Output with AS5712-54X and OpenSwitch
```
ONIE: Executing installer: openswitch-onie-installer-x86_64-as5712_54x-ops-1.0.0-release+2017030612

OpenSwitch ONIE installer (version 1.0) for Accton AS5712 54x

                          .g8""8q.
                        .dP'    `YM.
                        dM'      `MM `7MMpdMAo.  .gP"Ya `7MMpMMMb.
                        MM        MM   MM   `Wb ,M'   Yb  MM    MM
   /            \       MM.      ,MP   MM    M8 8M""""""  MM    MM
  |-----    -----|      `Mb.    ,dP'   MM   ,AP YM.    ,  MM    MM
   \   \\  //   /         `"bmmd"'     MMbmmd'   `Mbmmd'.JMML  JMML.
          //                           M
         //                          .JMML.        ,,                ,,
        //               .M"""bgd                  db   mm         `7MM
   /   //  \\   \       ,MI    "Y                       MM           MM
  |-----    -----|      `MMb.  `7M'    ,A    `MF'`7MM mmMMmm ,p6"bo  MMpMMMb.
   \            /         `YMMNq.VA   ,VAA   ,V    MM   MM  6M'  OO  MM    MM
                        .     `MM VA ,V  VA ,V     MM   MM  8M       MM    MM
                        Mb     dM  VVV    VVV      MM   MM  YM.    , MM    MM
                        P"Ybmmd"    W      W     .JMML. `MbmoYMbmd'.JMML  JMML.



 --- Not previous installation found, performing a clean installation ---

 --- Creating the configuration partition (#4, label OpenSwitch Conf) ---
Warning: The kernel is still using the old partition table.
The new table will be used at the next reboot.
The operation has completed successfully.

 --- Creating the diags partition (#5, label OpenSwitch Diags) ---
Warning: The kernel is still using the old partition table.
The new table will be used at the next reboot.
The operation has completed successfully.

 --- Creating the primary partition (#6, label OpenSwitch 1) ---
Warning: The kernel is still using the old partition table.
The new table will be used at the next reboot.
The operation has completed successfully.

 --- Creating the secondary partition (#7, label OpenSwitch 2) ---
Warning: The kernel is still using the old partition table.
The new table will be used at the next reboot.
The operation has completed successfully.

 --- Formatting configuration partition in ext4 ---

 --- Formatting diagnostics partition in ext4 ---

 --- Formatting primary partition in ext4 ---

 --- Formatting secondary partition in ext4 ---

 --- Populating the root filesystem at partition OpenSwitch 1 (/dev/sda6) ---
742647 blocks

 --- Installing OpenSwitch GRUB ---
Installation finished. No error reported.
...(Skip)

OpenSwitch 1.0.0 switch ttyS1

switch login: root

                          .g8""8q.
                        .dP'    `YM.
                        dM'      `MM `7MMpdMAo.  .gP"Ya `7MMpMMMb.
                        MM        MM   MM   `Wb ,M'   Yb  MM    MM
   /            \       MM.      ,MP   MM    M8 8M""""""  MM    MM
  |-----    -----|      `Mb.    ,dP'   MM   ,AP YM.    ,  MM    MM
   \   \\  //   /         `"bmmd"'     MMbmmd'   `Mbmmd'.JMML  JMML.
          //                           M
         //                          .JMML.        ,,                ,,
        //               .M"""bgd                  db   mm         `7MM
   /   //  \\   \       ,MI    "Y                       MM           MM
  |-----    -----|      `MMb.  `7M'    ,A    `MF'`7MM mmMMmm ,p6"bo  MMpMMMb.
   \            /         `YMMNq.VA   ,VAA   ,V    MM   MM  6M'  OO  MM    MM
                        .     `MM VA ,V  VA ,V     MM   MM  8M       MM    MM
                        Mb     dM  VVV    VVV      MM   MM  YM.    , MM    MM
                        P"Ybmmd"    W      W     .JMML. `MbmoYMbmd'.JMML  JMML.

root@switch:~# vtysh
switch# show version
OpenSwitch 1.0.0 (Build: as5712-ops-1.0.0-release+2017030612)
switch#
```

## Reference
- [opx-docs - OpenSwitch Github][5]
- [Archive - OpenSwitch][4]
- [OpenSwitch Official Website][6]


[1]: https://archive.openswitch.net/artifacts/periodic/release/ops-1.0.0-release+2017030612/as5712/
[2]: https://archive.openswitch.net/artifacts/periodic/release/ops-1.0.0-release+2017030900/as6712/
[3]: https://archive.openswitch.net/artifacts/periodic/release/ops-1.0.0-release+2017030912/as7712/
[4]: https://archive.openswitch.net/artifacts/periodic/release/
[5]: https://github.com/open-switch/opx-docs/wiki
[6]: http://www.openswitch.net/