#!/bin/bash
echo ""
apt clean all
apt update -y
apt upgrade -y
echo ""
echo "----- add-apt-repository -----"
echo ""
sudo apt-add-repository ppa:jtaylor/keepass -y
sudo add-apt-repository ppa:oguzhaninan/stacer -y
echo ""
echo "----- Base packages -----"
echo ""
sudo apt install vim curl wget mlocate telnet dconf-editor ubuntu-restricted-extras -y
echo ""
echo "----- collectl -----"
echo "Collects data that describes the current system status"
sudo apt install colplot collectl -y
echo ""
echo "----- AlsaMixer -----"
sudo apt install alsa-base pulseaudio -y
sudo ""
sudo "Reloading Alsa"
sudo alsa force-reload
echo ""
echo "----- APT Transport for HTTPS -----"
sudo apt install apt-transport-https -y
echo ""
echo ""
echo "----- Keepass2 -----"
echo ""
# sudo apt-add-repository ppa:jtaylor/keepass -y
sudo apt-get update -y
sudo apt-get install keepass2 -y
echo "xdotool needed for auto-type"
sudo apt install xdotool -y
echo ""
echo ""
echo "----- Stacer -----"
echo ""
# sudo add-apt-repository ppa:oguzhaninan/stacer -y
sudo apt-get update -y
sudo apt-get install stacer -y
echo ""
echo ""
echo "----- BleachBit -----"
echo ""
sudo apt install bleachbit -y
echo ""
echo ""
echo "----- DropBox -----"
echo ""
sudo apt install dropbox python3-gpg -y
# -or-
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# ~/.dropbox-dist/dropboxd
echo ""
echo ""
echo "----- Tor Browser -----"
echo ""
sudo cat <<EOF | sudo tee /etc/apt/sources.list.d/tor.list
deb https://deb.torproject.org/torproject.org bionic main
deb-src https://deb.torproject.org/torproject.org bionic main
EOF
echo ""
sudo wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
echo ""
sudo gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
echo ""
echo "# Update and install Debian keyring"
echo "# and also install a Debian package that will help to keep the signing key to the latest."
echo ""
sudo apt update -y
sudo apt install deb.torproject.org-keyring -y
echo ""
sudo apt update -y
sudo apt install tor torbrowser-launcher -y
echo ""
echo ""
echo "----- Skype -----"
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skypeforlinux-64.deb
echo ""
echo ""
echo "----- VSCode -----"
sudo apt update -y
echo ""
echo "Add Visual Studio Code repository and key"
echo ""
sudo apt install apt-transport-https
sudo curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
echo ""
echo "Add APT repository to Linux Mint"
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
echo ""
echo "Install VSCode"
sudo apt update -y
sudo apt install code -y
echo ""
sudo rm -f packages.microsoft.gpg
echo ""
echo ""
echo "----- Installing SublimeText 3 -----"
echo ""
echo "1. Install the GPG key"
sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo ""
echo "2. Select the channel to use"
sudo echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo ""
echo "3. Update apt sources and install Sublime Text"
sudo apt-get update -y
sudo apt-get install sublime-text -y
echo ""
echo "4. Update & Upgrade"
sudo apt-get update -y
sudo apt-get upgrade -y
echo ""
echo ""
echo "----- KVM / Libvirt -----"
echo ""
sudo apt install -y bridge-utils cpu-checker dnsmasq dnsmasq-base ebtables ifupdown libguestfs-tools libnss-mymachines libosinfo-bin libvirt-clients libvirt-daemon libvirt-daemon-system libvirt0 mailutils nfs-common nfs-kernel-server numad ovmf python3-argcomplete qemu resolvconf sgabios sharutils-doc ssh-askpass telnet vde2 vim virt-manager virtinst zfs-initramfs zfsutils-linux
echo ""
echo "Run kvm-ok"
echo ""
sudo kvm-ok
echo ""
echo ""
echo "----- UnetBootin -----"
sudo add-apt-repository ppa:gezakovacs/ppa
sudo apt-get update -y
sudo apt-get install unetbootin -y
echo ""
echo ""
echo "----- x11vnc -----"
sudo apt install x11vnc -y
echo ""
# echo "Set VNC password:"
# x11vnc -storepasswd
echo ""
# echo "Creating startup script"
# cat <<EOF> ~/x11vnc_start.sh
# #!/bin/bash
# x11vnc -rfbauth ~/.vnc/passwd -ncache 10 &
# exit 0;
# EOF
echo ""
# chmod +x ~/x11vnc_start.sh
echo ""
#echo -e "Startup script is located here:\n"$(ls -1 ~/x11vnc_start.sh)
echo ""
echo ""
echo "----- WireShark -----"
sudo add-apt-repository ppa:wireshark-dev/stable
sudo apt-get update -y
sudo apt install wireshark -y
echo ""
echo ""
echo " ----- CITRIX -----"
echo " --- 1. Install Service Continuity on Debian packages - for Citrix ---"
sudo apt-get install libwebkit2gtk-4.0-37 gnome-keyring libsecret-1-0 -y
echo ""
echo ""
echo " --- 2. Install App Protection component on Debian packages ---"
echo ""
echo "From ver 2102, App Protection is supported on the Debian version of Citrix Workspace app"
echo "------------------------"
echo "For silent installation of the app protection component, run before installing Citrix Workspace app:"
echo ""
export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "icaclient app_protection/install_app_protection select no"
sudo debconf-show icaclient
echo ""
echo " --- 3. Install Citrix Workspace app (2021) ---"
echo " --- Download at ---"
echo "https://www.citrix.com/en-au/downloads/workspace-app/linux/workspace-app-for-linux-latest.html"
echo ""
# sudo dpkg -i icaclient_<VER>.deb
# sudo dpkg -i ctxusb_<VER>.deb
# sudo apt install -f 
echo ""
echo ""
echo "--- (old) Citrix Receiver (2018) ---"
echo "--- Download at ---"
echo "https://www.citrix.com/en-au/downloads/citrix-receiver/linux/"
echo ""
echo ""
echo ""
echo "--- Azure CLI ---"
echo ""
echo "----- Debian -----"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
echo ""
echo "--- Install AnyDesk dependency ---"
sudo apt install libgtkglext1 -y
echo ""
echo "--- Obsidian.md ---"
echo "https://obsidian.md/download"
echo ""
echo "Eg:"
echo "https://github.com/obsidianmd/obsidian-releases/releases/download/v0.14.15/obsidian_0.14.15_amd64.deb"
echo ""
echo ""
echo ""
echo ""
echo "--- Any Desk Download ---"
echo ""
echo "https://anydesk.com/en/downloads/linux"
echo ""
echo ""
echo ""
echo "--- Micorsoft Teams Download ---"
echo ""
echo "https://www.microsoft.com/en-au/microsoft-teams/download-app#desktopAppDownloadregion"
echo ""
echo ""
echo "--- Clean and Update ---"
sudo apt clean all
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install -f
echo ""
sudo updatedb
sudo mandb
echo "--- Done ---"
exit 0;
