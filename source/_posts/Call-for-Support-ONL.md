---
title: Call for Support - ONL
date: 2017-02-26 00:00:30
updated: 2017-02-26 00:00:30
tags:
- onl
- support
---

{% blockquote Open Network Linux, ONL https://opennetlinux.org/ %}
Open Network Linux is a Linux distribution for "bare metal" switches, that is, network forwarding devices built from commodity components.
ONL uses ONIE to install onto on-board flash memory. Open Network Linux is a part of the Open Compute Project and is a component in a growing collection of open source and commercial projects.
{% endblockquote %}

## ONL Technical Support with Edgecore Networks

## How to support?

<!--more-->

1. Download [`onl-support` source](https://raw.githubusercontent.com/pichuang/OpenNetworkLinux/b529ecf4cf4b9464328ee96181aa5168f0aa2b31/packages/base/all/vendor-config-onl/src/bin/onl-support)

2. Put the file into ONL platform via `wget`
```bash
wget --no-check-certificate https://raw.githubusercontent.com/pichuang/OpenNetworkLinux/b529ecf4cf4b9464328ee96181aa5168f0aa2b31/packages/base/all/vendor-config-onl/src/bin/onl-support
```

3. Excute script for dump informations
```bash
python onl-support 
```

4. Find tarball in /root/onl-support-${onie_machine}.tar.bz2

5. Please send tarball file to Edgecore Networks

## Example

```bash
root@localhost:~# wget --no-check-certificate https://raw.githubusercontent.com/pichuang/OpenNetworkLinux/b529ecf4cf4b9464328ee96181aa5168f0aa2b31/packages/base/all/vendor-config-onl/src/bin/onl-support
root@localhost:~# python onl-support
Dump Information...
Processing...
Support tarball created: /root/onl-support-x86-64-accton-as6712-32x-r0.tar.gz
```

## References
- [Open Compute Project - OCP](http://opencompute.org/)
- [Open Network Linux](https://opennetlinux.org/)
- [Big Switch Networks - Open Network Linux Expansion](http://www.bigswitch.com/blog/2016/11/21/open-network-linux-expansion)
