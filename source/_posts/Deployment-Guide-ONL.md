---
title: Deployment Guide - Open Network Linux, ONL
date: 2017-03-05 19:31:30
updated: 2017-03-05 19:31:30
tags:
- onl
- deployment
- onie
---

{% img https://opennetlinux.org/opennetlinux.png 300 400 %}

## Getting Started

The all of process has 5 steps:

1. Check the [ONL compatible switch][2]
2. Choose the [ONL installer version][3]
  - Accton/Edgecore have difference CPU type
    - Intel - x86
    - FreeScale - powerpc, ppc 
3. Install ONL into Edgecore switch via ONIE
4. Login ONL
5. Do anything you want to on ONL

## Preinstall ONL

- We suggest you that choose ONL version [`2016.12.22.18.28.604af0c9b3dc9504870c30273ab22f2fb62746c3`][6] and choose `Debian 8`
  - For PowerPC based, use [ONL-2.0.0-ONL-OS-DEB8-2016-12-22.1828-604af0c-PPC-INSTALLED-INSTALLER][7]
  - For x86 based, use [ONL-2.0.0-ONL-OS-DEB8-2016-12-22.1828-604af0c-AMD64-INSTALLED-INSTALLER][8]

- Download ONL installer images into USB or follow the [Quick Start Guide - ONIE][5]

<!--more-->

## Enter ONIE (Rescue Mode)

- If the bootloader is GRUB
  - Select `ONIE -> ONIE: Rescue`
- If the bootloader is U-Boot
  - You will see `Hit any key to stop autoboot`
  - `Press any key` 
  - Enter `run onie_rescue` to enter ONIE rescue mode.

## Install ONL (Example: Accton/Edgecore AS5712-54X)

- Install via HTTP
```bash
ifconfig eth0 <IP>/24
route add default gw <Gateway>
echo "nameserver 8.8.8.8" > /etc/resolv.conf
onie-nos-install http://opennetlinux.org/binaries/2016.12.22.18.28.604a
f0c9b3dc9504870c30273ab22f2fb62746c3/ONL-2.0.0-ONL-OS-DEB8-2016-12-22.1828-604af
0c-AMD64-INSTALLED-INSTALLER
```

- Install via USB
```bash
mkdir /tmp/onie-image
mount /dev/<USB Devices> /tmp/onie-image
cd /tmp/onie-image
onie-nos-install ONL-2.0.0-ONL-OS-DEB8-2016-12-22.1828-604af
0c-AMD64-INSTALLED-INSTALLER
```

## Default Username and Password in ONL

`root/onl`

## Example
- Output with AS5712-54X and ONIE rescure mode
```bash
GRUB loading.                                               Version   : 2015.11.00.05
Build Date: 2016-04-14T19:55+0800
               Info: Mounting kernel filesystems... done.
scsi 6:0:0:0: Direct-Access              USB DISK 2.0     PMAP PQ: 0 ANSI: 6
sd 6:0:0:0: [sda] 15466496 512-byte logical blocks: (7.91 GB/7.37 GiB)
sd 6:0:0:0: [sda] Write Protect is off
sd 6:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn''t support DPO or FUA
sd 6:0:0:0: [sda] Attached SCSI disk
Info: Mounting ONIE-BOOT on /mnt/onie-boot ...
Info: Using eth0 MAC address: c4:39:3a:f4:4b:f3
Info: eth0:  Checking link... up.E: Rescue Mode ...
Info: Trying DHCPv4 on interface: eth0
random: nonblocking pool is initialized
Warning: Unable to configure interface using DHCPv4: eth0
ONIE: Using default IPv4 addr: eth0: 192.168.3.10/24
ONIE: Using link-local IPv4 addr: eth0: 169.254.187.20/16
Starting: dropbear ssh daemon... done.
Starting: telnetd... done.
discover: Rescue mode detected.  Installer disabled.

Please press Enter to activate this console.
To check the install status inspect /var/log/onie.log.
Try this:  tail -f /var/log/onie.log

** Rescue Mode Enabled **

ONIE:/ # # Install via HTTP
ONIE:/ # ifconfig eth0 192.168.11.9/24
ONIE:/ # route add default gw 192.168.11.254
ONIE:/ # echo "nameserver 8.8.8.8" > /etc/resolv.conf
ONIE:/ # ping www.google.com
PING www.google.com (216.58.200.36): 56 data bytes
64 bytes from 216.58.200.36: seq=0 ttl=53 time=7.485 ms
--- www.google.com ping statistics ---
1 packets transmitted, 1 packets received, 0% packet loss
round-trip min/avg/max = 7.485/7.485/7.485 ms
ONIE:/ # 
ONIE:/ # onie-nos-install http://opennetlinux.org/binaries/2016.12.22.18.28.604a
f0c9b3dc9504870c30273ab22f2fb62746c3/ONL-2.0.0-ONL-OS-DEB8-2016-12-22.1828-604af
0c-AMD64-INSTALLED-INSTALLER

ONIE:/ # # Install via USB
ONIE:/ # mkdir /tmp/onie-image
ONIE:/ # mount /dev/sdb1 /tmp/onie-image
ONIE:/ # cd /tmp/onie-image
ONIE:/tmp/onie-image # onie-nos-install ONL-2.0.0-ONL-OS-DEB8-2016-12-22.1828-604af
0c-AMD64-INSTALLED-INSTALLER

ONIE: Executing installer: ONL-2.0.0-ONL-OS-DEB8-2016-12-22.1828-604af0c-AMD64-INSTALLED-INSTALLER         [4/2367]
installer: computing checksum of original archive
installer: checksum is OK
installer: extracting pad
...(Skip)
```

- Booting Output with AS5712-54X and ONL
```bash

2017-03-05 12:38:43.418 INFO     onie-upgrade: ************************************************************
2017-03-05 12:38:43.418 INFO     onie-upgrade: * ONIE Upgrade Check
2017-03-05 12:38:43.418 INFO     onie-upgrade: ************************************************************
2017-03-05 12:38:43.418 INFO     onie-upgrade:
2017-03-05 12:38:43.418 INFO     onie-upgrade:
2017-03-05 12:38:43.418 INFO     onie-upgrade: No ONIE updater available for the current platform.
2017-03-05 12:38:43.419 INFO     onie-upgrade:
2017-03-05 12:38:43.419 INFO     onie-upgrade: ************************************************************
2017-03-05 12:38:43.853 INFO firmware-upgrade: ************************************************************
2017-03-05 12:38:43.853 INFO firmware-upgrade: * Firmware Upgrade Check
2017-03-05 12:38:43.853 INFO firmware-upgrade: ************************************************************
2017-03-05 12:38:43.853 INFO firmware-upgrade:
2017-03-05 12:38:43.854 INFO firmware-upgrade:
2017-03-05 12:38:43.854 INFO firmware-upgrade: No Firmware updater available for the current platform.
2017-03-05 12:38:43.854 INFO firmware-upgrade:
2017-03-05 12:38:43.854 INFO firmware-upgrade: ************************************************************
2017-03-05 12:38:44.329 INFO   loader-upgrade: ************************************************************
2017-03-05 12:38:44.330 INFO   loader-upgrade: * Loader Upgrade Check
2017-03-05 12:38:44.330 INFO   loader-upgrade: ************************************************************
2017-03-05 12:38:44.330 INFO   loader-upgrade:
2017-03-05 12:38:44.353 INFO   loader-upgrade: Current Loader Version: ONL-2.0.0,2016-12-22.18:28-604af0c
2017-03-05 12:38:44.353 INFO   loader-upgrade:    Next Loader Version: ONL-2.0.0,2016-12-22.18:28-604af0c
2017-03-05 12:38:44.353 INFO   loader-upgrade:
2017-03-05 12:38:44.354 INFO   loader-upgrade: Loader version ONL-2.0.0,2016-12-22.18:28-604af0c is current.
2017-03-05 12:38:44.354 INFO   loader-upgrade:
2017-03-05 12:38:44.354 INFO   loader-upgrade: ************************************************************
Using makefile-style concurrent boot in runlevel S.
Starting the hotplug events dispsystemd-udevd[1080]: starting version 215
atcher: udevd.
Synthesizing the initial hotplug events...done.
Waiting for /dev to be fully populated...done.
Setting kernel variables ...done.
Setting up resolvconf...done.
Configuring network interfaces...done.
INIT: Entering runlevel: 2
Using makefile-style concurrent boot in runlevel 2.
Starting enhanced syslogd: rsyslogd.
Starting ONLP SNMP Agent: onlp-snmpd.
Starting ONLP Platform Agent: onlpd.
Starting Fault Agent: faultd.
Starting OpenBSD Secure Shell server: sshd.
Starting SNMP services::  snmpdWarning: Could not probe for any interfaces
Stopping watchdog keepalive daemon....
Starting watchdog daemon....

Open Network Linux OS ONL-2.0.0, 2016-12-22.18:28-604af0c

localhost login: root
Password: onl
Linux localhost 3.2.65-1+deb7u2-OpenNetworkLinux #2 SMP Thu Dec 22 19:17:39 UTC 2016 x86_64
root@localhost:~#
```

## Call for Support

If you still meet a problem, please follow the link [Call for Support - ONIE][9]

## Reference
- [ONL Deployment Guide][1]
- [ONL Hardware Support][2]
- [ONL Binaries][3]
- [Hardware Switch Installation Guide - OpenCORD][4]
- [Quick Start Guide - ONIE][5]
- [Call for Support - ONIE][9]
- [Output about Install ONL on AS5712-54X - pichuang][10]

[1]: https://opennetlinux.org/docs/deploy
[2]: http://opennetlinux.org/hcl
[3]: http://opennetlinux.org/binaries
[4]: https://wiki.opencord.org/display/CORD/Hardware+Switch+Installation+Guide
[5]: https://github.com/opencomputeproject/onie/wiki/Quick-Start-Guide
[6]: http://opennetlinux.org/binaries/2016.12.22.18.28.604af0c9b3dc9504870c30273ab22f2fb62746c3
[7]: http://opennetlinux.org/binaries/2016.12.22.18.28.604af0c9b3dc9504870c30273ab22f2fb62746c3/ONL-2.0.0-ONL-OS-DEB8-2016-12-22.1828-604af0c-PPC-INSTALLED-INSTALLER
[8]: http://opennetlinux.org/binaries/2016.12.22.18.28.604af0c9b3dc9504870c30273ab22f2fb62746c3/ONL-2.0.0-ONL-OS-DEB8-2016-12-22.1828-604af0c-AMD64-INSTALLED-INSTALLER
[9]: https://edge-core.github.io/2017/02/09/Call-for-Support-ONIE/
[10]: https://gist.github.com/pichuang/9954b7de0b8cdd66f91f933898fccf33