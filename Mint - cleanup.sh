#!/bin/bash
#
echo ""
echo "--- Logrotate ---"
echo ""
sudo logrotate -f /etc/logrotate.conf
#
echo ""
echo "--- JournalCTL ---"
echo ""
sudo journalctl --rotate
sudo journalctl -m --vacuum-time=1s
sudo systemctl restart systemd-journald
#
sudo apt-get install -f
sudo apt-get autoremove -y
sudo apt-get clean all
echo ""
echo "--- /var/log ---"
echo ""
sudo rm -rf /var/log/*gz
sudo rm -rf /var/log/*xz
sudo rm -rf /var/log/*.1
sudo rm -rf /var/log/*/*gz
sudo rm -rf /var/log/*/*xz
sudo rm -rf /var/log/*/*.1
#
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*
#
sudo rm -rf /home/jo/.cache/thumbnails/*
echo ""
echo "--- updatedb and mandb ---"
sudo updatedb
echo ""
sudo mandb -q
echo ""
echo "****************************************************"
echo ""
echo "# Kernels Installed: "
echo ""
echo ""
sudo dpkg --list 'linux-image*'
echo ""
echo "****************************************************"
echo ""
echo "# Kernel being used: "
echo ""
uname -r
echo ""
echo ""
echo "****************************************************"
echo ""
echo "# Remove old kernels with: "
echo ""
echo "sudo apt-get remove linux-image-VERSION"
echo ""
echo ""
echo ""
echo "--- Done ---"
echo ""
