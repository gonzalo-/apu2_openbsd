# OpenBSD on Apu2

The idea of this repo is to setup an [APU2](http://pcengines.ch/apu2c4.htm) with [OpenBSD](http://openbsd.org) as OS, for
a Firewall/Gateway/AP box at home (or maybe a company).

At this time you should set the right date on your APU2 with something like:

```
# date 201703300045
Thu Mar 30 00:45:00 -03 2017
```

## Makefile usage

Assuming that you already have OpenBSD installed (with compXX.tgz) on your APU2 with just an internet connection, you can do this:

```
# echo 'https://ftp5.usa.openbsd.org/pub/OpenBSD/' > /etc/installurl # Skip this if you already have a mirror.
# cd /tmp
# ftp -V https://raw.githubusercontent.com/gonzalo-/apu2_openbsd/master/Makefile
# make apu2

[+] Downloading files from https://github.com/gonzalo-/apu2_openbsd

boot.conf    100% |*****************************************************************|    30       00:00
hostname.em0 100% |*****************************************************************|    31       00:00
hostname.em1 100% |*****************************************************************|     3       00:00
hostname.em2 100% |*****************************************************************|     3       00:00
hostname.bridge0 100% |*****************************************************************|   107       00:00
hostname.vether0 100% |*****************************************************************|    39       00:00
dhcpd.conf   100% |*****************************************************************|   420       00:00
dhclient.conf 100% |********************************************************************|   216       00:00
pf.conf      100% |*****************************************************************|  1882       00:00
relayd.conf  100% |*****************************************************************|   683       00:00
sysctl.conf  100% |*****************************************************************|    25       00:00

[+] Installing files...

[+] All done, you can reboot now.
# reboot
```

## apu2.sh usage

Assuming that you already have OpenBSD installed on your APU2 with just an internet connection, you can do this:

```
# echo 'https://ftp5.usa.openbsd.org/pub/OpenBSD/' > /etc/installurl # Skip this if you already have a mirror.
# cd /tmp
# ftp -o - https://raw.githubusercontent.com/gonzalo-/apu2_openbsd/master/apu2.sh | sh -
Trying 151.101.24.133...
Requesting https://raw.githubusercontent.com/gonzalo-/apu2_openbsd/master/apu2.sh
1329 bytes received in 0.00 seconds (6.12 MB/s)

[+] Downloading files from https://github.com/gonzalo-/apu2_openbsd

boot.conf    100% |*****************************************************************|    30       00:00
hostname.em0 100% |*****************************************************************|    31       00:00
hostname.em1 100% |*****************************************************************|     3       00:00
hostname.em2 100% |*****************************************************************|     3       00:00
hostname.bridge0 100% |*****************************************************************|   107       00:00
hostname.vether0 100% |*****************************************************************|    39       00:00
dhcpd.conf   100% |*****************************************************************|   420       00:00
dhclient.conf 100% |********************************************************************|   216       00:00
pf.conf      100% |*****************************************************************|  1882       00:00
relayd.conf  100% |*****************************************************************|   683       00:00
sysctl.conf  100% |*****************************************************************|    25       00:00

[+] Installing files...


[+] All done, you can reboot now.
# reboot
```

