---
title: How to install OF-DPA in Edgecore Switches
date: 2017-06-21 14:00:23
updated: 2017-06-21 14:00:23
tags:
- ofdpa
- onl
- install
- how-to
---

## Introduction to Broadcom OF-DPA
Broadcom's OpenFlow Data Plane Abstraction (OF-DPA) is an application software component that implements an adaptation layer between OpenFlow and the Broadcom Silicon SDK. OF-DPA enables scalable implementation of OpenFlow 1.3.4 on Broadcom switch devices.

## Support Platform
- [ONL-enabled Edgecore switch][1]
  - Platfrom includes x86_64 / PowerPC / ARM
  - [Deployment Guide - Open Network Linux, ONL][5]

<!--more-->

## Download OF-DPA Package
We provide 2 different sources:
- Private version
  - Please contact your sales to get it
- Community version
  - [Download link][3]

## Install OF-DPA Package

1. Copy OF-DPA package to switch
```bash
scp ofdpa_3.0.4.0+accton1.7-3-1_amd64.deb root@192.168.100.137:/mnt/onl/data/
```

2. Install OF-DPA package
```bash
dpkg -i --force-overwrite /mnt/onl/data/ofdpa_3.0.4.0+accton1.7-3-1_amd64.deb
```

## Start OFAgent
```bash
launcher ofagentapp --controller=<CONTROLLER_IP>:6653 --listen=<SWITCH_MA1_IP>:6633
```
- [More OF-DPA cheat sheet][4]
- [How to enable debugging mode on OF-DPA][6]

## Stop OFAgent
```bash
pkill ofagentapp
```

## List of CLI instructions
```
root@edgecore-networks-onl:~# /usr/bin/ofdpa/examples
$ ls
client_cfg_purge             client_grouptable_dump  ofdpa_mplsl3vpn.py      ofdpa_routing.py
client_classcolortable_dump  client_meter_dump       ofdpa_mpls_lsr_ecmp.py  ofdpa_snake.py
client_debugcomp             client_oam_dump         ofdpa_mpls_lsr.py       ofdpa_srcmac_learn.py
client_debuglvl              client_port_table_dump  ofdpa_pktrx_setup.py    ofdpa_vxlan.py
client_drivport              client_queue_config     ofdpa_pktrxtx.py        ofdpa_vxlan-scale.py
client_drivshell             client_sflow            OFDPA_python.py
client_event                 client_tunnel_dump      OFDPA_python.pyc
client_flowtable_dump        ofdpa_bridging.py       _OFDPA_python.so
```
- All files are in `/usr/bin/ofdpa/examples`

## Example
```bash
root@edgecore-networks-onl:~# onl-platform-show |grep "Platform Name"
    Platform Name: x86_64-accton_as5712_54x-r0

root@edgecore-networks-onl:~# ls /mnt/onl/data/ofdpa_3.0.4.0+accton1.7-3-1_amd64.deb
/mnt/onl/data/ofdpa_3.0.4.0+accton1.7-3-1_amd64.deb

root@edgecore-networks-onl:~# dpkg -i --force-overwrite /mnt/onl/data/ofdpa_3.0.4.0+accton1.7-3-1_amd64.deb
(Reading database ... 18100 files and directories currently installed.)
Preparing to unpack .../ofdpa_3.0.4.0+accton1.7-3-1_amd64.deb ...
Unpacking ofdpa (3.0.4.0+accton1.7~3-1) over (3.0.4.0+accton1.7~3-1) ...
Setting up ofdpa (3.0.4.0+accton1.7~3-1) ...
/
Processing triggers for libc-bin (2.19-18+deb8u6) ...
```

## Reference
- [ONL Support Platform List][1]
- [Hardware Switch Installation Guide - OpenCORD][2]
- [OF-DPA Community Version - ONF Atrium][3]
- [OF-DPA with ONL Cheat Sheet][4]
- [Deployment Guide - ONL][5]

[1]: https://github.com/opencomputeproject/OpenNetworkLinux/tree/master/packages/platforms/accton
[2]: https://wiki.opencord.org/display/CORD/Hardware+Switch+Installation+Guide#HardwareSwitchInstallationGuide-C2.InstallOF-DPApackage
[3]: https://github.com/onfsdn/atrium-docs/tree/master/16A/ONOS/builds
[4]: http://blog.pichuang.com.tw/ofdpa-with-onl-cheat-sheet/
[5]: https://edge-core.github.io/Deployment-Guide-ONL/
[6]: https://edge-core.github.io/How-to-enable-debugging-mode-on-OF-DPA/