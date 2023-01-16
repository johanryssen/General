#!/bin/bash
# Clean OS for use as a template
subscription-manager unregister
subscription-manager clean
systemctl stop rsyslog
service auditd stop
systemctl stop systemd-journald
rm -rf /var/cache/dnf/*
find /var/log -type f -exec rm -f {} \;
updatedb
sync
rm -f /etc/udev/rules.d/70-*
rm -f /etc/ssh/ssh_host_*
rm -r /root/.bash_history
for i in $(ls -1 /home) ; do rm -rf /home/$i/.bash_history ; done
exit 0