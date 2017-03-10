---
title: How to uninstall NOS on Edgecore Switches with ONIE
date: 2017-03-10 11:05:59
updated: 2017-03-10 11:05:59
tags:
- onie
- uninstall
- how-to
---

## Objective

The post shows the procedure to uninstall Network OS and into ONIE environment

## Setup
1. Power on the switch 
2. Connect to the switch via console port
3. Login to the switch

## Steps with x86

<!--more-->

1. Reboot Network OS
2. Look for the prompt on GRUB menu, and select `ONIE`
```
                     GNU GRUB  version 2.02~beta2+e4a1fe391

 +----------------------------------------------------------------------------+
 | OpenSwitch Primary Image (as5712-ops-1.0.0-release+2017030612)             |
 | OpenSwitch Secondary Image (Version information not available)             |
 | OpenSwitch Development -- NFS root                                         |
 |*ONIE                                                                       |
 | DIAG: Accton Diagnostic                                                    |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 +----------------------------------------------------------------------------+

      Use the ^ and v keys to select which entry is highlighted.
      Press enter to boot the selected OS, `e' to edit the commands
      before booting or `c' for a command-line.
```

3. Choose `Uninstall OS`
```
                     GNU GRUB  version 2.02~beta2+e4a1fe391

 +----------------------------------------------------------------------------+
 | ONIE: Install OS                                                           |
 | ONIE: Rescue                                                               |
 |*ONIE: Uninstall OS                                                         |
 | ONIE: Update ONIE                                                          |
 | ONIE: Embed ONIE                                                           |
 | DIAG: Accton Diagnostic (as5712_54x)                                       |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 +----------------------------------------------------------------------------+

      Use the ^ and v keys to select which entry is highlighted.
      Press enter to boot the selected OS, `e' to edit the commands
      before booting or `c' for a command-line.
```

4. The uninstall procedure is long and takes 30 mins
```
Info: Mounting kernel filesystems... done.
scsi 6:0:0:0: Direct-Access              USB DISK 2.0     PMAP PQ: 0 ANSI: 6
sd 6:0:0:0: [sda] 15466496 512-byte logical blocks: (7.91 GB/7.37 GiB)
sd 6:0:0:0: [sda] Write Protect is off
sd 6:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
sd 6:0:0:0: [sda] Attached SCSI disk
Info: Mounting ONIE-BOOT on /mnt/onie-boot ...
Info: Using eth0 MAC address: xx:xx:xx:xx:xx:xx
Info: eth0:  Checking link... up.
Info: Trying DHCPv4 on interface: eth0
ONIE: OS Uninstall Mode ...
random: nonblocking pool is initialized
Warning: Unable to configure interface using DHCPv4: eth0
ONIE: Using default IPv4 addr: eth0: 192.168.3.10/24
ONIE: Using link-local IPv4 addr: eth0: 169.254.226.25/16
Starting: dropbear ssh daemon... done.
Starting: telnetd... done.
discover: Uninstall mode detected.  Running uninstaller.
Erasing internal mass storage device: /dev/sda4 (128MB)
  Percent complete: 100%
Erase complete.
Deleting partition 4 from /dev/sda
Erasing internal mass storage device: /dev/sda5 (1024MB)
  Percent complete: 100%
Erase complete.
Deleting partition 5 from /dev/sda
Erasing internal mass storage device: /dev/sda6 (2048MB)
  Percent complete: 100%
...(Skip)
```

5. Edgecore switch will reboot once completed, and ONIE will be loaded.
```
                     GNU GRUB  version 2.02~beta2+e4a1fe391

 +----------------------------------------------------------------------------+
 |*ONIE: Install OS                                                           |
 | ONIE: Rescue                                                               |
 | ONIE: Uninstall OS                                                         |
 | ONIE: Update ONIE                                                          |
 | ONIE: Embed ONIE                                                           |
 | DIAG: Accton Diagnostic (as5712_54x)                                       |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 |                                                                            |
 +----------------------------------------------------------------------------+

      Use the ^ and v keys to select which entry is highlighted.
      Press enter to boot the selected OS, `e' to edit the commands
      before booting or `c' for a command-line.
```

## Steps with U-Boot
1. Reboot Network OS
2. `Press any key` when you see the following prompt:
```
Hit any key to stop autoboot:
```

3. Type the command for uninstall NOS
```
LOADER=> run onie_uninstall
```

## Reference
- [x86 NOS Uninstall - ONIE Wiki][1]
- [u-boot NOS Uninstall - ONIE Wiki][2]
- [NOS Uninstallation - ONIE Wiki][3]

[1]: https://github.com/opencomputeproject/onie/wiki/Design-Spec-x86-NOS-Interface#x86-nos-uninstall
[2]: https://github.com/opencomputeproject/onie/wiki/Design-Spec-U-Boot-NOS-Interface#u-boot-platform-nos-uninstall
[3]: https://github.com/opencomputeproject/onie/wiki/Testing-Overview#nos-uninstallation