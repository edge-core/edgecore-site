---
title: Call for Support - ONIE
date: 2017-02-09 14:00:30
updated: 2017-02-09 14:00:30
tags:
- onie
- support
---

{% blockquote Open Network Install Environment, ONIE http://onie.org/ %}
ONIE is an Open Compute Project open source initiative contributed by Cumulus Networks that defines an open “install environment” for bare metal network switches.
{% endblockquote %}

## ONIE Technical Support with Edgecore Networks

ONIE provide the command which help customer send the support bundle to vendor. The command name is `onie-support`. It can dump useful information of ONIE for troubleshooting and analysis Edgecore switch platform.

`onie-support` have more features in last updated. We suggest you download the new one from ONIE master branch. Please follow the steps below.

## How to support?

<!--more-->

1. Download [`onie-support` source](https://raw.githubusercontent.com/opencomputeproject/onie/master/rootconf/default/bin/onie-support)

2. Put the file into ONIE via any methods (tftp/ftp/http/USB) 
  - Noted: command `wget` in ONIE does NOT support https

3. Excute script for dump informations
```bash
sh onie-support /tmp
```
4. Find tarball in /tmp/onie-support-${onie_machine}.tar.bz2
```bash
ONIE:/ # onie-support /tmp
Success: Support tarball created: /tmp/onie-support-accton_as7712_32x.tar.bz2
```

5. Please send tarball file to Edgecore Networks

## Example

```bash
ONIE:/tmp # onie-sysinfo
x86_64-accton_as7712_32x-r0
ONIE:/tmp # ls
onie-support
ONIE:/tmp # sh onie-support /tmp
Success: Support tarball created: /tmp/onie-support-accton_as7712_32x.tar.bz2
```

## References
- [Open Compute Project - OCP](http://opencompute.org/)
- [Open Network Install Environment - ONIE](http://onie.org/)
- [Cumulus Networks](https://cumulusnetworks.com/)
