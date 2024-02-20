## Manual setup

#### PREPARE ENVIRONMENT

**Move to `tmp` directory**

```shell
cd /tmp/
```

**Export `Python` environment**

```shell
export PYTHONWARNINGS=ignore
```

**Build temporary working directory**

```shell
mkdir -p /tmp/snoopgod/
```

**Configure APT sources**

```shell
add-apt-repository -y main
add-apt-repository -y restricted
add-apt-repository -y universe
add-apt-repository -y multiverse
```

**Keep system safe**

```shell
apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
apt-get -y remove && apt-get -y autoremove
apt-get -y clean && apt-get -y autoclean
```

**Disable error reporting**

```shell
sed -i "s/enabled=1/enabled=0/" /etc/default/apport
```

**Remove unwanted packages**

```shell
apt-get -y purge --auto-remove elisa gstreamer1.0-vaapi kcalc kmahjongg kmines konversation kpat krdc ktorrent ksudoku kwalletmanager libreoffice* muon skanlite thunderbird transmission xterm
```

**Configure Linux generic kernel**

```shell
apt-get -y install linux-generic
```

* * *

#### INSTALL LIBRARIES

**Install system libraries**

```shell
apt-get -y install libbz2-dev libc6-x32 libcurl4-openssl-dev libffi-dev libfmt-dev libfuse2 libgdbm-dev libglib2.0-dev libglib2.0-dev-bin libgmp-dev libgspell-1-dev libgtkmm-3.0-dev libgtksourceviewmm-3.0-dev libncurses5-dev libnotify-bin libnss3-dev libreadline-dev libsodium-dev libspdlog-dev libsqlite3-dev libssl-dev libtool libuchardet-dev libxml2 libxml++2.6-dev libxml2-dev libxslt1-dev zlib1g-dev
```

**Install `Python`**

```shell
apt-get -y install python3-flask python3-future python3-geoip python3-httplib2 python3-nmap python3-numpy python3-paramiko python3-pip python3-psutil python3-pycurl python3-pyqt5 python3-requests python3-scapy python3-scipy python3-setuptools python3-urllib3 python3-virtualenv python3-wheel
ln -s /usr/bin/python3 /usr/bin/python
```

**Install `Qt6`**

```shell
apt-get -y install qt6-base-dev qtcreator
```

**Install `Ruby`**

```shell
apt-get -y install ruby ruby-dev
```

**Install `Perl`**

```shell
apt-get -y install perl perl-tk
```

**Install `7zip`**

```shell
apt-get -y install file-roller p7zip p7zip-full p7zip-rar
```

**Install `Fonts`**

```shell
apt-get -y install fonts-dejavu
```

* * *

#### INSTALL NATIVE PACKAGES

**Install common packages**

```shell
apt-get -y install abootimg android-sdk apache2 apt-transport-https apt-utils atftp autoconf autopsy baobab binutils binwalk build-essential cabextract cherrytree chirp cmake curl cutycapt debootstrap default-jdk default-jre dirmngr dkms dos2unix dpkg-sig easytag fuse3 fwbuilder g++ gcc gconf2 ghex git gnome-disk-utility gnuradio gpg gqrx-sdr gr-air-modes gr-iqbal gr-osmosdr gss-ntlmssp hackrf hexedit htop httrack inspectrum jq kate kde-spectacle keepassxc locate macchanger make mtools natpmpc net-tools ninja-build openvpn pkg-config proxychains qemu rake rename reprepro rhythmbox screen screenfetch secure-delete simplescreenrecorder sqlitebrowser socat software-properties-common software-properties-gtk squashfs-tools synaptic swaks terminator tor torsocks trash-cli tree wireguard wget xorriso
```

**Install cracking tools**

```shell
apt-get -y install bruteforce-luks bruteforce-salted-openssl bruteforce-wallet brutespray ccrypt cewl changeme cmospwd crack crunch fcrackzip gtkhash hashcat hashdeep hashid hashrat hydra john medusa nasty ncrack ophcrack patator princeprocessor sucrack
```

**Install exploitation tools**

```shell
apt-get -y install websploit yersinia weevely
```

**Install forensics tools**

```shell
apt-get -y install aesfix aeskeyfind afflib-tools chntpw dc3dd dcfldd de4dot dislocker ext3grep ext4magic extundelete fatcat flashrom foremost galleta guymager mac-robber magicrescue myrescue openocd o-saft outguess p0f parted pasco pdfcrack xmount
```

**Install hardening tools**

```shell
apt-get -y install apktool arduino lynis
```

**Install information gathering tools**

```shell
apt-get -y install arp-scan braa dmitry dnsenum dnsmap dnsrecon dnstracer dnswalk exifprobe exiv2 ike-scan masscan metacam missidentify nikto nmap nmapsi4 parsero recon-ng smbmap sntop sslsplit traceroute whois
```

**Install networking tools**

```shell
apt-get -y install arpwatch axel cntlm cryptcat darkstat dns2tcp dnstwist dsniff ethtool firewalk ifenslave inetsim miredo nbtscan netcat netdiscover netmask netsed onesixtyone pnscan proxytunnel
```

**Install reverse engineering tools**

```shell
apt-get -y install edb-debugger valgrind yara
```

**Install scripts and utilities**

```shell
apt-get -y install polenum
```

**Install sniffing & spoofing tools**

```shell
apt-get -y install bettercap chaosreader ettercap-common ettercap-graphical wireshark
chmod +x /usr/bin/dumpcap
```

**Install stress testing tools**

```shell
apt-get -y install arping dhcpig fping goldeneye hping3 slowhttptest t50 termineter
```

**Install vulnerability analysis tools**

```shell
apt-get -y install afl++ dirsearch doona pocsuite3 pompem sqlmap wapiti
```

**Install web applications tools**

```shell
apt-get -y install dirb ffuf gobuster wfuzz wafw00f whatweb wig
gem install wpscan
```

**Install wireless tools**

```shell
apt-get -y install aircrack-ng bully cowpatty iw mdk3 mdk4 mfcuk mfoc multimon-ng pixiewps reaver wifite
```

**Keep system safe**

```shell
apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
apt-get -y remove && apt-get -y autoremove
apt-get -y clean && apt-get -y autoclean
```

* * *

#### INSTALL EXTRAS PACKAGES

**Install `Beef-XSS`**

```shell
gem install bundler
mkdir -p /opt/snoopgod/exploitation
git clone https://github.com/beefproject/beef /opt/snoopgod/exploitation/beef
cd /opt/snoopgod/exploitation/beef/
./install && cd /tmp/
```

**Install `Burpsuite`**

```shell
wget -O "/tmp/jdk-17_linux-x64_bin.deb" "https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb"
wget -O "/tmp/jdk-21_linux-x64_bin.deb" "https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb"
dpkg -i /tmp/jdk-17_linux-x64_bin.deb && dpkg -i /tmp/jdk-21_linux-x64_bin.deb
apt-get -y install openjdk-17-jdk openjdk-17-jre openjdk-21-jdk openjdk-21-jre
wget -O "/tmp/burpsuite.sh" "https://portswigger-cdn.net/burp/releases/download?product=community&type=Linux"
wget -O "/tmp/burpsuite.txt" "https://raw.githubusercontent.com/snoopgodlinux/system/main/tmp/burpsuite.txt"
chmod +x /tmp/burpsuite.sh && cat "/tmp/burpsuite.txt" | /tmp/burpsuite.sh
```

**Install `Chrome`**

```shell
wget -O "/tmp/google-chrome.deb" "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
dpkg -i /tmp/google-chrome.deb
```

**Install `Maltego`**

```shell
wget -O "/tmp/Maltego.v4.6.0.deb" "https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.6.0.deb"
dpkg -i /tmp/Maltego.v4.6.0.deb
```

**Install `Metasploit`**

```shell
wget -O "/tmp/msfinstall" "https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb"
chmod +x /tmp/msfinstall && /tmp/msfinstall
cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d
apt-get -y update
```

**Install `TorBrowser`**

```shell
wget -O "/tmp/tor-browser-linux-x86_64-13.0.9.tar.xz" "https://www.torproject.org/dist/torbrowser/13.0.9/tor-browser-linux-x86_64-13.0.9.tar.xz"
tar -xvf /tmp/tor-browser-linux-x86_64-13.0.9.tar.xz -C /etc/skel/
mv /etc/skel/tor-browser /etc/skel/.torbrowser
rm -f /etc/skel/.torbrowser/start-tor-browser.desktop
```

**Install `Zaproxy`**

```shell
wget -O "/tmp/zaproxy.sh" "https://github.com/zaproxy/zaproxy/releases/download/v2.14.0/ZAP_2_14_0_unix.sh"
wget -O "/tmp/zaproxy.txt" "https://raw.githubusercontent.com/snoopgodlinux/system/main/tmp/zaproxy.txt"
chmod +x /tmp/zaproxy.sh && cat "/tmp/zaproxy.txt" | /tmp/zaproxy.sh
```

* * *

#### INSTALL EXTRAS PACKAGES

**Build Deb packages**

```shell
wget -O "/tmp/packages-main.zip" "https://codeload.github.com/snoopgodlinux/packages/zip/refs/heads/main"
unzip /tmp/packages-main.zip -d /tmp/snoopgod/
mv /tmp/snoopgod/packages-main/ /tmp/snoopgod/packages/
cd /tmp/snoopgod/packages/
chmod +x deb.sh && ./deb.sh
cd build && dpkg -i *.deb && cd /tmp/
```

**Keep system safe**

```shell
apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
apt-get -y remove && apt-get -y autoremove
apt-get -y clean && apt-get -y autoclean
```

* * *

#### SETUP SYSTEM

**Retrieve system repository**

```shell
wget -O "/tmp/system-main.zip" "https://codeload.github.com/snoopgodlinux/system/zip/refs/heads/main"
unzip /tmp/system-main.zip -d /tmp/snoopgod/
mv /tmp/snoopgod/system-main/ /tmp/snoopgod/system/
```

**Create Skeleton config folder**

```shell
mkdir -p /etc/skel/.config
```

**Create Skeleton local folder**

```shell
mkdir -p /etc/skel/.local
```

**Setup user `bashrc`**

```shell
rm -f /etc/skel/.bashrc
cp /tmp/snoopgod/system/etc/skel/bashrc.txt /etc/skel/.bashrc
```

**Setup root `bashrc`**

```shell
rm -f /root/.bashrc
cp /tmp/snoopgod/system/root/bashrc.txt /root/.bashrc
```

**Copy config directory**

```shell
cp -r /tmp/snoopgod/system/etc/skel/.config/* /etc/skel/.config/
```

**Copy local directory**

```shell
cp -r /tmp/snoopgod/system/etc/skel/.local/* /etc/skel/.local/
```

**Edit system conf**

```shell
sed -i "s/#DefaultTimeoutStartSec=90s/DefaultTimeoutStartSec=5s/" /etc/systemd/system.conf
sed -i "s/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=5s/" /etc/systemd/system.conf
```

**Configure utilities**

```shell
cp /tmp/snoopgod/system/usr/local/bin/snoopgod /usr/local/bin/
chmod +x /usr/local/bin/snoopgod
cp -r /tmp/snoopgod/system/usr/share/snoopgod /usr/share/
chmod +x /usr/share/snoopgod/usr/bin/updater
chmod +x /usr/share/snoopgod/usr/bin/upgrader
chmod +x /usr/share/snoopgod/usr/bin/ucleaner
chmod +x /usr/share/snoopgod/usr/bin/rcleaner
```

**Configure `plymouth`**

```shell
rm -f /usr/share/plymouth/ubuntu-logo.png
cp /tmp/snoopgod/system/usr/share/plymouth/ubuntu-logo.png /usr/share/plymouth/
rm -rf /usr/share/plymouth/themes/spinner/
cp -r /tmp/snoopgod/system/usr/share/plymouth/themes/spinner /usr/share/plymouth/themes/
update-alternatives --install "/usr/share/plymouth/themes/default.plymouth" "default.plymouth" "/usr/share/plymouth/themes/spinner/spinner.plymouth" 200
update-initramfs -u -k all
```

**Copy `ubiquity`**

```shell
rm -rf /usr/lib/ubiquity/
cp -r /tmp/snoopgod/system/usr/lib/ubiquity/ /usr/lib/
rm -rf /usr/share/ubiquity/qt/images/
cp -r /tmp/snoopgod/system/usr/share/ubiquity/qt/images /usr/share/ubiquity/qt/
rm -f /usr/share/ubiquity/qt/breadcrumb_current.qss
cp /tmp/snoopgod/system/usr/share/ubiquity/qt/breadcrumb_current.qss /usr/share/ubiquity/qt/
rm -f /usr/share/ubiquity/qt/style.qss
cp /tmp/snoopgod/system/usr/share/ubiquity/qt/style.qss /usr/share/ubiquity/qt/
```

**Copy `ubiquity-slideshow`**

```shell
rm -rf /usr/share/ubiquity-slideshow/
cp -r /tmp/snoopgod/system/usr/share/ubiquity-slideshow /usr/share/
```

**Copy the SnoopGod logo**

```shell
cp -r /tmp/snoopgod/system/usr/share/logos /usr/share
```

**Copy `sddm` theme**

```shell
cp -r /tmp/snoopgod/system/usr/share/sddm/* /usr/share/sddm/
```

**Copy `sddm` configuration**

```shell
cp -r /tmp/snoopgod/system/etc/sddm.conf.d/ /etc/
```

**Import icons**

```shell
cp -r /tmp/snoopgod/system/usr/share/icons/* /usr/share/icons/
```

**Import applications desktop**

```shell
cp /tmp/snoopgod/system/usr/share/applications/* /usr/share/applications/
```

**Change Screenfetch**

```shell
rm -f /usr/bin/screenfetch
cp /tmp/snoopgod/system/usr/bin/screenfetch /usr/bin/
chmod +x /usr/bin/screenfetch
```

**Copy `lsb-release` configuration**

```shell
rm -f /etc/lsb-release
cp /tmp/snoopgod/system/etc/lsb-release /etc/
```

**Copy wallpapers**

```shell
rm -rf /usr/share/wallpapers/Next/
cp -r /tmp/snoopgod/system/usr/share/wallpapers/* /usr/share/wallpapers/
```

**Copy `proxychains` configuration**

```shell
rm -f /etc/proxychains.conf
cp /tmp/snoopgod/system/etc/proxychains.conf /etc/
rm -f /usr/bin/proxychains
cp /tmp/snoopgod/system/usr/bin/proxychains /usr/bin/
```

**Remove launchers**

```shell
rm -rf /usr/share/applications/kde4
rm -f /usr/share/applications/arduino.desktop
rm -f /usr/share/applications/edb.desktop
rm -f /usr/share/applications/ettercap.desktop
rm -f /usr/share/applications/gtkhash.desktop
rm -f /usr/share/applications/guymager.desktop
rm -f /usr/share/applications/lstopo.desktop
rm -f /usr/share/applications/lynis.desktop
rm -f /usr/share/applications/ophcrack.desktop
rm -f /usr/share/applications/org.kde.plasma.emojier.desktop
rm -f /usr/share/applications/org.wireshark.Wireshark.desktop
rm -f /usr/share/applications/texdoctk.desktop
rm -f /usr/share/applications/ubiquity.desktop
rm -f /usr/share/applications/*-BurpSuiteCommunity.desktop
rm -f /usr/share/applications/*-zap.sh.desktop
```

* * *

#### EDIT KDE CONFIG FILES

**Export `offscreen` environment**

```shell
export QT_QPA_PLATFORM=offscreen
```

**Execute Plasma customization functions**

```shell
plasma-apply-desktoptheme breeze-dark >/dev/null 2>&1
plasma-apply-colorscheme BreezeDark >/dev/null 2>&1
plasma-apply-colorscheme --accent-color gainsboro >/dev/null 2>&1
plasma-apply-lookandfeel -a org.kde.breezedark.desktop >/dev/null 2>&1
```

**Move KDE configuration files to Skeleton folder**

```shell
mv $HOME/.config/gtkrc /etc/skel/.config/
mv $HOME/.config/gtkrc-2.0 /etc/skel/.config/
mv $HOME/.config/kdedefaults/* /etc/skel/.config/kdedefaults/
mv $HOME/.config/kdeglobals /etc/skel/.config/
mv $HOME/.config/plasmarc /etc/skel/.config/
mv $HOME/.config/Trolltech.conf /etc/skel/.config/
mv $HOME/.kde/ /etc/skel/
```
**dolphinrc**

```shell
kwriteconfig5 --file /etc/skel/.config/dolphinrc --group "PlacesPanel" --key "IconSize" "32"
```

**konsolerc**

```shell
kwriteconfig5 --file /etc/skel/.config/konsolerc --group "MainWindow" --key "MenuBar" "Disabled"
```

**kwinrc**

```shell
kwriteconfig5 --file /etc/skel/.config/kwinrc --group "Windows" --key "BorderlessMaximizedWindows" "true"
```

**kwalletrc**

```shell
kwriteconfig5 --file /etc/skel/.config/kwalletrc --group "Wallet" --key "Enabled" "false"
```

* * *

#### CLEAN SYSTEM

**Clean `tmp` directory**

```shell
rm -rf /tmp/*
```

**Clean `bash` history**

```shell
rm -f ~/.bash_history
rm -f /root/.bash_history
rm -f /root/.wget-hsts
history -c && history -w
```
