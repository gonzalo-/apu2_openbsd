#
# Makefile pr0n.
#
# by gonzalo@x61.sh
#
#

apu2:
	@echo ""
	@echo "[+] Downloading files from https://github.com/gonzalo-/apu2_openbsd"
	@echo ""
	@cd /tmp
	@ftp -V https://raw.githubusercontent.com/gonzalo-/apu2_openbsd/master/boot.conf
	@ftp -V https://raw.githubusercontent.com/gonzalo-/apu2_openbsd/master/hostname.{em0,em1,em2,bridge0,vether0}
	@ftp -V https://raw.githubusercontent.com/gonzalo-/apu2_openbsd/master/dhcpd.conf
	@ftp -V https://raw.githubusercontent.com/gonzalo-/apu2_openbsd/master/dhclient.conf
	@ftp -V https://raw.githubusercontent.com/gonzalo-/apu2_openbsd/master/pf.conf
	@ftp -V https://raw.githubusercontent.com/gonzalo-/apu2_openbsd/master/httpd.conf
	@ftp -V https://raw.githubusercontent.com/gonzalo-/apu2_openbsd/master/relayd.conf
	@ftp -V https://raw.githubusercontent.com/gonzalo-/apu2_openbsd/master/sysctl.conf
	@echo ""
	@echo "[+] Installing files..."
	@echo ""
	@install -m 0640 -g wheel -o root /tmp/hostname.{em0,em1,em2,bridge0,vether0} /etc
	@install -m 0600 -g wheel -o root /tmp/{pf,relayd,httpd}.conf /etc
	@install -m 0644 -g wheel -o root /tmp/sysctl.conf /etc
	@install -m 0644 -g wheel -o root /tmp/dhcpd.conf /etc
	@install -m 0644 -g wheel -o root /tmp/dhclient.conf /etc
	@install -m 0644 -g wheel -o root /tmp/boot.conf /
	@rm /tmp/hostname.{em0,em1,em2,bridge0,vether0} /tmp/boot.conf
	@rm /tmp/{pf,relayd,httpd}.conf /tmp/sysctl.conf /tmp/dhcpd.conf /tmp/dhclient.conf
	@rcctl enable dhcpd && rcctl set dhcpd flags vether0 em1 em2
	@rcctl enable ntpd && rcctl set ntpd flags -s
	@echo ""
	@echo "[+] All done, you can reboot now."
	@echo ""
