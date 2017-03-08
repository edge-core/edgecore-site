---
title: How to enable debugging mode on OF-DPA
date: 2017-03-08 09:09:26
updated: 2017-03-08 09:09:26
tags:
- ofdpa
- onl
- debug
---

## Introduction to Broadcom OF-DPA
Broadcom's OpenFlow Data Plane Abstraction (OF-DPA) is an application software component that implements an adaptation layer between OpenFlow and the Broadcom Silicon SDK. OF-DPA enables scalable implementation of OpenFlow 1.3.4 on Broadcom switch devices.

## Enable OF-DPA at debugging mode 
```bash
killall ofagentapp
launcher ofagentapp -a2 -d4 -c1 -c2 -c3 -c4 -c5 --controller=x.x.x.x ...

# Redirect output to file if you want
# launcher ofagentapp -a2 -d4 -c1 -c2 -c3 -c4 -c5 --controller=x.x.x.x ... > ofdpa_stdout_log 2> ofdpa_stderr_log 
```
- `-d, --ofdpadebuglvl=OFDPADEBUGLVL`
  - The verbosity of OF-DPA debug messages
  - Valid OF-DPA debug levels are 0 - 4. (By default is 0)
- `-a, --agentdebuglvl=AGENTDEBUGLVL`
  - The verbosity of OF Agent debug messages
  - Valid OF Agent debug levels are 0 - 2. (By default is 0)
- `-i, --dpid=DATAPATHID`
  - Specify Datapath ID (By default is 0x000000000000DA7A)
- `-l, --listen=IP:PORT`
  - Listen port
- `-t, --controller=IP:PORT`
- `-c, --ofdpadebugcomp=OFDPACOMPONENT`
  - The OF-DPA component for which debug messages are enabled
  - List of OFDPACOMPONENT
    - 1 = API
    - 2 = Mapping
    - 3 = RPC
    - 4 = OFDB
    - 5 = Datapath
    - 6 = [G8131][4]
    - 7 = [Y1731][3]

<!--more-->

## Example
```
root@onl-6712-32x:~# launcher ofagentapp -a2 -d4 -c1 -c2 -c3 -c4 -c5 --controller=192.168.1.1
Setting up OFDPA running environment
ofagentapp[1751]: Start command = ofagentapp -a2 -d4 -c1 -c2 -c3 -c4 -c5 --controller=192.168.1.1
01-01 16:26:41.462206 [ofagent] version 2.0.4.0 -- Built on Mon Jan 16 2017 at 05:17:02 UTC
Setting debug verbosity to 4.
Enabling debugging for component 1.
Enabling debugging for component 2.
Enabling debugging for component 3.
Enabling debugging for component 4.
Enabling debugging for component 5.
OF Datapath ID: 0x000000000000DA7A
01-01 16:26:41.462669 [ofstatemanager] Switch DPID set called but unchanged
Initializing the system.
driverConfigSet: Setting config variable "os" to "unix".
driverConfigSet: Setting config variable "bcm_stat_interval" to "2000000".
driverConfigSet: Setting config variable "schan_intr_enable" to "0".
driverConfigSet: Setting config variable "miim_intr_enable" to "0".
driverConfigSet: Setting config variable "l2_mem_entries" to "32768".
driverConfigSet: Setting config variable "l3_mem_entries" to "16384".
driverConfigSet: Setting config variable "bcm_num_cos" to "8".
driverConfigSet: Setting config variable "module_64ports" to "1".
driverConfigSet: Setting config variable "skip_L2_USER_ENTRY" to "1".
driverConfigSet: Setting config variable "ing_share_flex_counter_pool" to "split(vlanxlate,mplsfrrlabel,mplsswitchl
abel,mplsvclabel);share(port,vlanxlate)".
DMA pool size: 33554432
PCI unit 0: Dev 0xb850, Rev 0x03, Chip BCM56850_A2, Driver BCM56850_A0
Found board: as6712-32x
SOC unit 0 attached to PCI device BCM56850_A2
sdkCustomInit: Stop counters complete
sdkCustomInit: Stop L2X complete
sdkCustomInit: Device reset complete
sdkCustomInit: Misc init complete
sdkCustomInit: MMU init complete
kkksdkCustomInit: BCM driver layer init complete
sdkCustomInit: Linkscan ports set complete
sdkCustomInit: Stats clear complete
sdkCustomInit: Linkscan enable complete
sdkCustomInit: Counter sync complete
sdkCustomInit: Resync counters complete
driverProcessCommand: Executing platform command "echo "rc: unit $unit device $devname"".
rc: unit 0 device BCM56850_A2
driverProcessCommand: Executing platform command "port ge autoneg=on  speed=0 fullduplex=true enable=false".
driverProcessCommand: Executing platform command "port xe autoneg=off speed=0 fullduplex=true enable=false".
...(Skip)
```

## Reference
- [Hardware Switch Installation Guide - Open CORD][1]
- [OF-DPA with ONL Cheat Sheet - Phil's Blog][2]
- [OpenFlow Data Plane Abstraction - Broadcom-Switch/of-dpa][6]

[1]: https://wiki.opencord.org/display/CORD/Hardware+Switch+Installation+Guide#HardwareSwitchInstallationGuide-Debugging
[2]: http://blog.pichuang.com.tw/ofdpa-with-onl-cheat-sheet/
[3]: https://www.itu.int/rec/T-REC-Y.1731
[4]: https://www.itu.int/rec/T-REC-G.8131
[5]: http://www.edge-core.com/productsInfo.php?cls=1&cls2=7&cls3=43&id=12
[6]: https://github.com/Broadcom-Switch/of-dpa