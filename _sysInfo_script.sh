#!/bin/bash
echo ""
echo " ----- Creating Directories -----"
mkdir -p systeminfo/Command_Output/{YUM,XFS,TUNED,SYSVIPC,SYSTEMD,SERVICES,SELINUX,SCSI,RPM,PYTHON,PROCESSOR,PROCESS,PCI,PAM,NETWORKING,MEMORY,LVM2,LOGS,LOGROTATE,LOGIN,LIBRARIES,KERNEL,HOST,HARDWARE,GRUB2,FIREWALLD,FILESYS,DRACUT,DEVICEMAPPER,DBUS,DATE,CRON,CGROUPS,BOOT,BLOCK,AUDITD,ALTERNATIVES,DOMAIN,FDISK}

mkdir -p systeminfo/etc/{udev,sudoers.d,ssh,snmp,dracut.conf.d,cron.hourly,cron.d,cron.daily,audit}

echo ""
echo ""

echo "----- Copying Files -----"

echo "--------------------- UDEV ---------------------"
cp -pr /etc/udev/* systeminfo/etc/udev/

echo "--------------------- SUDO ---------------------"
cp -pr /etc/sudoers systeminfo/etc/
cp -pr /etc/sudo.conf systeminfo/etc/
cp -pr /etc/sudoers.d/* systeminfo/etc/sudoers.d/

echo "--------------------- SSH ---------------------"
cp -pr /etc/ssh/sshd_config systeminfo/etc/ssh
cp -pr /etc/ssh/ssh_config systeminfo/etc/ssh

echo "--------------------- SNMP ---------------------"
cp -pr /etc/snmp/snmptrapd.conf systeminfo/etc/snmp/
cp -pr /etc/snmp/snmpd.conf systeminfo/etc/snmp/

echo "--------------------- LOGIN ---------------------"
cp -pr /etc/login.defs systeminfo/etc/

echo " --------------------- KRB5 ---------------------"
cp -pr /etc/krb5.conf systeminfo/etc/

echo "--------------------- DRACUT ---------------------"
cp -pr /etc/dracut.conf systeminfo/etc/
cp -pr /etc/dracut.conf.d/* systeminfo/etc/dracut.conf.d/

echo "--------------------- CRON ---------------------"
cp -pr /etc/cron.hourly/* systeminfo/etc/cron.hourly/
cp -pr /etc/cron.deny systeminfo/etc/
cp -pr /etc/crontab systeminfo/etc/
cp -pr /etc/cron.d/*  systeminfo/etc/cron.d/
cp -pr /etc/cron.daily/* systeminfo/etc/cron.daily/

echo "--------------------- AUDITD ---------------------"
cp -pr /etc/audit/* systeminfo/etc/audit/

echo "--------------------- RELEASE ---------------------"
cp -pr /etc/redhat-release systeminfo/etc/

echo "--------------------- LOGROTATE ---------------------"
cp -pr /etc/logrotate.conf systeminfo/etc/

echo "--------------------- NMSTAB ---------------------"
cp -pr /etc/nmstab systeminfo/etc/

echo ""
echo ""
echo "--------------------- /etc/ ---------------------"
tar -zcvf systeminfo/_etc.tar.gz /etc/
echo ""

echo ""
echo "----- File Copy Completed -----"
echo ""
echo "----- Running Commands -----"
echo ""
echo " --------------------- ALTERNATIVES ---------------------"
alternatives --list > systeminfo/Command_Output/ALTERNATIVES/alternatives--list
alternatives --version > systeminfo/Command_Output/ALTERNATIVES/alternatives--version
alternatives --display mta > systeminfo/Command_Output/ALTERNATIVES/alternatives--display-mta

echo " --------------------- AUDITD ---------------------"
ausearch --input-logs -m avc,user_avc -ts today > systeminfo/Command_Output/AUDITD/ausearch-today
auditctl -s > systeminfo/Command_Output/AUDITD/auditctl-s
auditctl -l > systeminfo/Command_Output/AUDITD/auditctl-l

echo " --------------------- BLOCK ---------------------"
lsblk -f -a -l > systeminfo/Command_Output/BLOCK/lsblk-f-a-l
lsblk > systeminfo/Command_Output/BLOCK/lsblk
lsblk -t > systeminfo/Command_Output/BLOCK/lsblk-t
lsblk -D > systeminfo/Command_Output/BLOCK/lsblk-D
blkid -c /dev/null > systeminfo/Command_Output/BLOCK/lsblk-c
blockdev --report > systeminfo/Command_Output/BLOCK/blockdev--report
ls -lanR /dev > systeminfo/Command_Output/BLOCK/ls-lanR_dev
ls -lanR /sys/block > systeminfo/Command_Output/BLOCK/ls-lanR_sys_block

echo " --------------------- BOOT ---------------------"
ls -lanR /boot > systeminfo/Command_Output/BOOT/ls-lanR
lsinitrd > systeminfo/Command_Output/BOOT/lsinitrd

echo " --------------------- CGROUPS ---------------------"
systemd-cgls > systeminfo/Command_Output/CGROUPS/systemd-cgls

echo " --------------------- CRON ---------------------"
crontab -l -u root > systeminfo/Command_Output/CRON/crontab-root

echo " --------------------- DATE ---------------------"
date > systeminfo/Command_Output/DATE/date
date --utc > systeminfo/Command_Output/DATE/date--utc
hwclock > systeminfo/Command_Output/DATE/hwclock

echo " --------------------- DBUS ---------------------"
busctl list --no-pager > systeminfo/Command_Output/DBUS/busctl-list
busctl status > systeminfo/Command_Output/DBUS/busctl-status

echo " --------------------- DEVICEMAPPER ---------------------"
dmsetup info -c > systeminfo/Command_Output/DEVICEMAPPER/dmsetup_info-c
dmsetup table > systeminfo/Command_Output/DEVICEMAPPER/dmsetup_table
dmsetup status > systeminfo/Command_Output/DEVICEMAPPER/dmsetup_status
dmsetup ls --tree > systeminfo/Command_Output/DEVICEMAPPER/dmsetup_ls--tree
dmstats list > systeminfo/Command_Output/DEVICEMAPPER/dmstats_list
dmstats print --allregions > systeminfo/Command_Output/DEVICEMAPPER/dmstats_print

echo " --------------------- FDISK ---------------------"
fdisk -l | grep Disk > systeminfo/Command_Output/FDISK/fdisk-l

echo " --------------------- DOMAIN ---------------------"
realm list > systeminfo/Command_Output/DOMAIN/realm_list
realm discover -v RTS.SCADA.AU > systeminfo/Command_Output/DOMAIN/realm_discover-v_RTS.SCADA.AU

echo " --------------------- DRACUT ---------------------"
dracut --list-modules  > systeminfo/Command_Output/DRACUT/dracut--list-modules
dracut --print-cmdline > systeminfo/Command_Output/DRACUT/dracut--print-cmdline

echo " --------------------- FILESYS ---------------------"
mount -l | column -t > systeminfo/Command_Output/FILESYS/mount-l
df -al -x autofs > systeminfo/Command_Output/FILESYS/df-autofs
df -hTP > systeminfo/Command_Output/FILESYS/df-hTP
findmnt > systeminfo/Command_Output/FILESYS/findmnt
lslocks > systeminfo/Command_Output/FILESYS/lslocks
ls -ltradZ /tmp > systeminfo/Command_Output/FILESYS/ls_tmp

echo " --------------------- FIREWALLD ---------------------"
firewall-cmd --state > systeminfo/Command_Output/FIREWALLD/firewall-cmd--state
firewall-cmd --list-all > systeminfo/Command_Output/FIREWALLD/firewall-cmd--list-all

echo " --------------------- GRUB2 ---------------------"
ls -lanR /boot > systeminfo/Command_Output/GRUB2/ls-lanR_boot
grub2-mkconfig > systeminfo/Command_Output/GRUB2/grub2-mkconfig

echo " --------------------- HARDWARE ---------------------"
dmidecode > systeminfo/Command_Output/HARDWARE/dmidecode

echo " --------------------- HOST ---------------------"
hostname > systeminfo/Command_Output/HOST/hostname
uptime > systeminfo/Command_Output/HOST/uptime
hostname -f > systeminfo/Command_Output/HOST/hostname-f
hostid > systeminfo/Command_Output/HOST/hostid
hostnamectl status > systeminfo/Command_Output/HOST/hostnamectl_status

echo " --------------------- KERNEL ---------------------"
uname -a > systeminfo/Command_Output/KERNEL/uname-a
lsmod > systeminfo/Command_Output/KERNEL/lsmod
ls -lt /sys/kernel/slab > systeminfo/Command_Output/KERNEL/ls-lt__sys_kernel_slab
dmesg > systeminfo/Command_Output/KERNEL/dmesg

echo " --------------------- LIBRARIES ---------------------"
ldconfig -p -N -X >  systeminfo/Command_Output/LIBRARIES/ldconfig

echo " --------------------- LOGIN ---------------------"
last > systeminfo/Command_Output/LOGIN/last
last reboot > systeminfo/Command_Output/LOGIN/last_reboot
last shutdown > systeminfo/Command_Output/LOGIN/last_shutdown
lastlog > systeminfo/Command_Output/LOGIN/lastlog

echo " --------------------- LOGS ---------------------"
journalctl --disk-usage > systeminfo/Command_Output/LOGS/journalctl--disk-usage
ls -alRh /var/log/ > systeminfo/Command_Output/LOGS/ls-alRh__var_log
journalctl --no-pager  > systeminfo/Command_Output/LOGS/journalctl--no-pager
journalctl --no-pager --catalog --boot  > systeminfo/Command_Output/LOGS/journalctl--no-pager--catalog--boot

echo " --------------------- LVM2 ---------------------"
vgdisplay -vv --config="global{locking_type=0 metadata_read_only=1}" > systeminfo/Command_Output/LVM2/vgdisplay
vgscan -vvv --config="global{locking_type=0 metadata_read_only=1}" > systeminfo/Command_Output/LVM2/vgscan
pvscan -v --config="global{locking_type=0 metadata_read_only=1}" > systeminfo/Command_Output/LVM2/pvscan
pvs -a -v -o +pv_mda_free,pv_mda_size,pv_mda_count,pv_mda_used_count,pe_start --config="global{locking_type=0 metadata_read_only=1}" > systeminfo/Command_Output/LVM2/pvs
vgs -v -o +vg_mda_count,vg_mda_free,vg_mda_size,vg_mda_used_count,vg_tags --config="global{locking_type=0 metadata_read_only=1}" > systeminfo/Command_Output/LVM2/vgs
lvs -a -o +lv_tags,devices,lv_kernel_read_ahead,lv_read_ahead,stripes,stripesize --config="global{locking_type=0 metadata_read_only=1}" > systeminfo/Command_Output/LVM2/lvs

echo " --------------------- MEMORY ---------------------"
free > systeminfo/Command_Output/MEMORY/free
free -m > systeminfo/Command_Output/MEMORY/free-m
swapon --bytes --show > systeminfo/Command_Output/MEMORY/swapon--bytes--show
swapon --summary --verbose > systeminfo/Command_Output/MEMORY/swapon--summary--verbose
lsmem -a -o RANGE,SIZE,STATE,REMOVABLE,ZONES,NODE,BLOCK > systeminfo/Command_Output/MEMORY/lsmem
slabtop -o > systeminfo/Command_Output/MEMORY/slabtop-o

echo " --------------------- NETWORKING ---------------------"
ip netns > systeminfo/Command_Output/NETWORKING/ip_netns
ip -o addr > systeminfo/Command_Output/NETWORKING/ip-o_addr
route -n > systeminfo/Command_Output/NETWORKING/route-n
netstat -W -neopa > systeminfo/Command_Output/NETWORKING/netstat-W-neopa
netstat -s > systeminfo/Command_Output/NETWORKING/netstat-s
netstat -W -agn > systeminfo/Command_Output/NETWORKING/netstat-W-agn
ip route show table all > systeminfo/Command_Output/NETWORKING/ip_route_show_table_all
ip -4 rule > systeminfo/Command_Output/NETWORKING/ip-4_rule
ip -s -d link > systeminfo/Command_Output/NETWORKING/ip-s-d_link
ip -d address > systeminfo/Command_Output/NETWORKING/ip-d_address
ifenslave -a > systeminfo/Command_Output/NETWORKING/ifenslave-a
ip mroute show > systeminfo/Command_Output/NETWORKING/ip_mroute_show
ip maddr show > systeminfo/Command_Output/NETWORKING/ip_maddr_show
ip -s -s neigh show > systeminfo/Command_Output/NETWORKING/ip-s-s_neigh_show
ip neigh show nud noarp > systeminfo/Command_Output/NETWORKING/ip_neigh_show_nud_noarp
tc -s qdisc show > systeminfo/Command_Output/NETWORKING/tc-s_qdisc_show
ss -peaonmi > systeminfo/Command_Output/NETWORKING/ss-peaonmi

echo " --------------------- PAM ---------------------"
ls -lanF /lib*/security > systeminfo/Command_Output/PAM/ls-lanF__lib_security
pam_tally2 > systeminfo/Command_Output/PAM/pam_tally2
faillock > systeminfo/Command_Output/PAM/faillock

echo " --------------------- PCI ---------------------"
lspci -nnvv > systeminfo/Command_Output/PCI/lspci-nnvv
lspci -tv >  systeminfo/Command_Output/PCI/lspci-tv

echo " --------------------- PROCESS ---------------------"
ps auxwww > systeminfo/Command_Output/PROCESS/ps_auxwww
ps auxwwwm > systeminfo/Command_Output/PROCESS/ps_auxwwwm
ps alxwww > systeminfo/Command_Output/PROCESS/ps_alxwww
ps -elfL > systeminfo/Command_Output/PROCESS/ps-elfL
ps axo pid,ppid,user,group,lwp,nlwp,start_time,comm,cgroup > systeminfo/Command_Output/PROCESS/ps_axo

echo " --------------------- PROCESSOR ---------------------"
lscpu > systeminfo/Command_Output/PROCESSOR/lscpu
cpupower info > systeminfo/Command_Output/PROCESSOR/cpupower_info
cpupower idle-info > systeminfo/Command_Output/PROCESSOR/cpupower_idle-info
cpupower frequency-info > systeminfo/Command_Output/PROCESSOR/cpupower_frequency-info

echo " --------------------- PYTHON ---------------------"
python3 -V > systeminfo/Command_Output/PYTHON/python3-V
python2 -V > systeminfo/Command_Output/PYTHON/python2-V
python -V > systeminfo/Command_Output/PYTHON/python-V

echo " --------------------- RPM ---------------------"
sh -c 'rpm --nodigest -qa' > systeminfo/Command_Output/RPM/rpm-qa

echo " --------------------- SCSI ---------------------"
lsscsi -i > systeminfo/Command_Output/SCSI/lsscsi-i
udevadm info -a /sys/class/scsi_host/host0 > systeminfo/Command_Output/SCSI/udevadm_info-a_host0
udevadm info -a /sys/class/scsi_host/host1 > systeminfo/Command_Output/SCSI/udevadm_info-a_host1
udevadm info -a /sys/class/scsi_host/host2 > systeminfo/Command_Output/SCSI/udevadm_info-a_host2

echo " --------------------- SELINUX ---------------------"
sestatus > systeminfo/Command_Output/SELINUX/sestatus
ps auxZww > systeminfo/Command_Output/SELINUX/ps_auxZww
sestatus -v > systeminfo/Command_Output/SELINUX/sestatus-v
sestatus -b > systeminfo/Command_Output/SELINUX/sestatus-b

echo " --------------------- SERVICES ---------------------"
/sbin/runlevel > systeminfo/Command_Output/SERVICES/runlevel
ls -1 /var/lock/subsys > systeminfo/Command_Output/SERVICES/ls__var_lock_subsys
/sbin/chkconfig --list > systeminfo/Command_Output/SERVICES/chkconfig--list

echo " --------------------- SYSTEMD ---------------------"
systemctl status --all > systeminfo/Command_Output/SYSTEMD/systemctl_status--all
systemctl show --all > systeminfo/Command_Output/SYSTEMD/systemctl_show--all
systemctl show service --all --no-pager > systeminfo/Command_Output/SYSTEMD/systemctl_show_service--all
systemctl list-units > systeminfo/Command_Output/SYSTEMD/systemctl_list-units
systemctl list-units --failed > systeminfo/Command_Output/SYSTEMD/systemctl_list-units--failed
systemctl list-unit-files > systeminfo/Command_Output/SYSTEMD/systemctl_list-unit-files
systemctl list-jobs > systeminfo/Command_Output/SYSTEMD/systemctl_list-jobs
systemctl list-dependencies > systeminfo/Command_Output/SYSTEMD/systemctl_list-dependencies
systemctl list-timers --all > systeminfo/Command_Output/SYSTEMD/systemctl_list-timers--all
systemctl list-machines > systeminfo/Command_Output/SYSTEMD/systemctl_list-machines
systemctl show-environment > systeminfo/Command_Output/SYSTEMD/systemctl_show-environment
systemd-delta > systeminfo/Command_Output/SYSTEMD/systemd-delta
systemd-analyze > systeminfo/Command_Output/SYSTEMD/systemd-analyze
systemd-analyze blame > systeminfo/Command_Output/SYSTEMD/systemd-analyze_blame
systemd-analyze dump > systeminfo/Command_Output/SYSTEMD/systemd-analyze_dump
journalctl --list-boots > systeminfo/Command_Output/SYSTEMD/journalctl--list-boots
ls -lR /lib/systemd > systeminfo/Command_Output/SYSTEMD/ls-lR__lib_systemd
timedatectl > systeminfo/Command_Output/SYSTEMD/timedatectl
systemd-analyze plot > systeminfo/Command_Output/SYSTEMD/systemd-analyze_plot

echo " --------------------- SYSVIPC ---------------------"
ipcs > systeminfo/Command_Output/SYSVIPC/ipcs
ipcs -u > systeminfo/Command_Output/SYSVIPC/ipcs-u

echo " --------------------- TUNED ---------------------"
tuned-adm list > systeminfo/Command_Output/TUNED/tuned-adm_list
tuned-adm active > systeminfo/Command_Output/TUNED/tuned-adm_active
tuned-adm recommend > systeminfo/Command_Output/TUNED/tuned-adm_recommend
tuned-adm verify > systeminfo/Command_Output/TUNED/tuned-adm_verify

echo " --------------------- XFS ---------------------"
xfs_info / > systeminfo/Command_Output/XFS/xfs_info_RootFS
xfs_info /boot > systeminfo/Command_Output/XFS/xfs_info_boot
xfs_admin -l -u /dev/mapper/rootvg-lv_root > systeminfo/Command_Output/XFS/xfs_admin__rootvg_lv_root
xfs_admin -l -u /dev/mapper/appvg-lv_app > systeminfo/Command_Output/XFS/xfs_admin__appvg-lv_app
xfs_admin -l -u /dev/mapper/appvg-lv_applog > systeminfo/Command_Output/XFS/xfs_admin__appvg-lv_applog
xfs_admin -l -u /dev/sda1 > systeminfo/Command_Output/XFS/xfs_admin-l-u_dev_sda1

echo " --------------------- YUM ---------------------"
# yum -C repolist > systeminfo/Command_Output/YUM/yum-C_repolist
# yum -C repolist --verbose > systeminfo/Command_Output/YUM/yum-C_repolist--verbose
# rpm -qf /usr/lib/yum-plugins/fastestmirror.py > systeminfo/Command_Output/YUM/rpm-qf_fastestmirror.py
yum history > systeminfo/Command_Output/YUM/yum_history
yum list installed > systeminfo/Command_Output/YUM/yum_list_installed
# package-cleanup --dupes > systeminfo/Command_Output/YUM/package-cleanup--dupes
# package-cleanup --problems > systeminfo/Command_Output/YUM/package-cleanup--problems

echo ""
echo " --------------------- /opt ---------------------"
ls -lsa /opt/* > systeminfo/Command_Output/_opt-Directory

echo ""
echo " --------------------- /app ---------------------"
ls -ls /app/* > systeminfo/Command_Output/_app-Directory



echo ""

exit 0