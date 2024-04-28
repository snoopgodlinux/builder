#!/bin/bash
#
# [Release]: SnoopGod 24.04.1 LTS amd64
# [Website]: https://snoopgod.com/releases/?ver=24.04.1
# [License]: http://www.gnu.org/licenses/gpl-3.0.html

## ---------------- ##
## DEFINE VARIABLES ##
## ---------------- ##

## Colour output
## -------------
texterror="\033[01;31m"		# Error
textreset="\033[00m"		# Reset

## ------------------- ##
## PREPARE ENVIRONMENT ##
## ------------------- ##

## Clear screen
## ------------
function clearscreen()
{
	clear
	sleep 2s
}

## Move to `tmp` directory
## -----------------------
function changedir()
{
	cd /tmp/
}

## Configure environment
## ---------------------
function configenv()
{
	export PYTHONWARNINGS=ignore
	mkdir -p /tmp/snoopgod/
}

## Configure APT sources
## ---------------------
function aptsources()
{
	add-apt-repository -y main && add-apt-repository -y restricted && add-apt-repository -y universe && add-apt-repository -y multiverse
}

## Keep system safe
## ----------------
function keepsafe()
{
	apt -y update && apt -y upgrade && apt -y dist-upgrade
	apt -y remove && apt -y autoremove
	apt -y clean && apt -y autoclean
}

## Disable error reporting
## -----------------------
function disableapport()
{	
	sed -i "s/enabled=1/enabled=0/" /etc/default/apport
}

## Remove unwanted packages
## ------------------------
function removeunwanted()
{
	rm -rf /etc/libreoffice/registry
	apt -y purge --auto-remove elisa fcitx5* gstreamer1.0-vaapi haruna kcalc kcharselect kmahjongg kmines konversation kpat krdc \
	ktorrent ksudoku kwalletmanager libreoffice* neochat plasma-welcome skanlite skanpage thunderbird transmission xterm
	rm -rf /etc/libreoffice/
}

## Install Kernel headers and images
## ------------------------
function kernelbuild()
{
	#apt install --reinstall linux-headers-6.8-31 linux-headers-6.8.0-31-generic linux-image-6.8.0-31-generic
}

## ----------------- ##
## INSTALL LIBRARIES ##
## ----------------- ##

## Install system libraries
## ------------------------
function installlibs()
{
	apt -y install libbz2-dev libc6-x32 libcurl4-openssl-dev libffi-dev libfmt-dev libfuse2 libgdbm-dev libglib2.0-dev libglib2.0-dev-bin libgmp-dev \
	libgspell-1-dev libgtkmm-3.0-dev libgtksourceviewmm-3.0-dev libhwloc-dev libncurses5-dev libnotify-bin libnss3-dev libreadline-dev libsodium-dev \
	libspdlog-dev libsqlite3-dev libssl-dev libtool libuchardet-dev libuv1-dev libxml++2.6-dev libxml2 libxml2-dev libxslt1-dev zlib1g-dev
}

## Install `Python`
## ----------------
function installpython
{
	apt -y install python3-flask python3-future python3-geoip python3-httplib2 python3-nmap python3-numpy python3-paramiko python3-pip python3-psutil \
	python3-pycurl python3-pyqt5 python3-requests python3-scapy python3-scipy python3-setuptools python3-urllib3 python3-virtualenv python3-wheel
	ln -s /usr/bin/python3 /usr/bin/python
}

## Install `Java`
## --------------
function installjava()
{
	apt -y install default-jre default-jdk
}

## Install `Ruby`
## --------------
function installruby()
{
	apt -y install ruby ruby-dev
}

## Install `Perl`
## --------------
function installperl()
{
	apt -y install perl perl-tk
}

## Install `7zip`
## --------------
function install7zip
{
	apt -y install file-roller p7zip p7zip-full p7zip-rar
}

## Install `Fonts`
## ---------------
function installfonts
{
	apt -y install fonts-dejavu
}

## ----------------------- ##
## INSTALL NATIVE PACKAGES ##
## ----------------------- ##

## Install common packages
## -----------------------
function installcommons()
{
	apt -y install abootimg android-sdk apt-transport-https apt-utils atftp autoconf autopsy baobab binutils binwalk build-essential cabextract cherrytree \
	cmake curl cutycapt debootstrap dirmngr dkms dos2unix easytag fuse3 fwbuilder g++ gcc ghex git gnome-disk-utility gpg hexedit htop httrack inspectrum jq \
	kate kde-spectacle keepassxc locate macchanger make mtools natpmpc net-tools ninja-build openvpn pkg-config proxychains rake rename reprepro rhythmbox \
	screen screenfetch secure-delete simplescreenrecorder sqlitebrowser socat software-properties-common software-properties-gtk squashfs-tools synaptic \
	swaks terminator tor torsocks trash-cli tree wireguard wget xorriso
}

## Install cracking tools
## ----------------------
function installcracking()
{
	apt -y install bruteforce-luks bruteforce-salted-openssl bruteforce-wallet brutespray ccrypt cewl changeme cmospwd crack crunch fcrackzip gtkhash hashcat \
	hashdeep hashid hashrat hydra john medusa nasty ncrack ophcrack patator princeprocessor sucrack
}

## Install exploitation tools
## --------------------------
function installexploitation()
{
	apt -y install websploit yersinia weevely
}

## Install forensics tools
## -----------------------
function installforensics()
{
	apt -y install aesfix aeskeyfind afflib-tools chntpw dc3dd dcfldd de4dot dislocker ext3grep ext4magic extundelete fatcat flashrom foremost galleta guymager \
	mac-robber magicrescue myrescue openocd o-saft outguess p0f parted pasco pdfcrack xmount
}

## Install hardening tools
## -----------------------
function installhardening()
{
	apt -y install apktool arduino lynis
}

## Install information gathering tools
## -----------------------------------
function installgathering()
{
	apt -y install arp-scan braa dmitry dnsenum dnsmap dnsrecon dnstracer dnswalk exifprobe exiv2 fierce ike-scan masscan metacam missidentify nikto nmap nmapsi4 \
	parsero smbmap sntop sslsplit traceroute whois
}

## Install networking tools
## ------------------------
function installnetworking()
{
	apt -y install arpwatch axel cntlm darkstat dns2tcp dnstwist dsniff ethtool firewalk ifenslave inetsim miredo nbtscan netdiscover netmask netsed onesixtyone \
	pnscan proxytunnel
}

## Install reverse engineering tools
## ---------------------------------
function installreverse()
{
	apt -y install edb-debugger valgrind yara
}

## Install scripts and utilities
## -----------------------------
function installscripts()
{
	apt -y install polenum
}

## Install sniffing & spoofing tools
## ---------------------------------
function installsniffing()
{
	apt -y install bettercap chaosreader ettercap-common ettercap-graphical wireshark
	chmod +x /usr/bin/dumpcap
}

## Install stress testing tools
## ----------------------------
function installstressing()
{
	apt -y install arping dhcpig fping goldeneye hping3 slowhttptest t50 termineter
}

## Install vulnerability analysis tools
## ------------------------------------
function installvulns()
{
	apt -y install afl++ dirsearch doona pocsuite3 pompem sqlmap wapiti
}

## Install web applications tools
## ------------------------------
function installwebapps()
{
	apt -y install dirb ffuf gobuster wfuzz wafw00f whatweb wig
	gem install wpscan
}

## Install wireless tools
## ----------------------
function installwireless()
{
	apt -y install aircrack-ng bully cowpatty iw mdk3 mdk4 mfcuk mfoc multimon-ng pixiewps reaver wifite
}

## ----------------------- ##
## INSTALL EXTRAS PACKAGES ##
## ----------------------- ##

## Install `Beef-XSS`
## ------------------
function installbeefxss()
{
	gem install bundler
	mkdir -p /opt/snoopgod/exploitation
	git clone https://github.com/beefproject/beef /opt/snoopgod/exploitation/beef
	cd /opt/snoopgod/exploitation/beef/ && rm -f install 
	wget -O "/opt/snoopgod/exploitation/beef/beefproject.txt" "https://raw.githubusercontent.com/snoopgodlinux/system/main/tmp/beefproject.txt"
	mv beefproject.txt install && chmod +x install && ./install && cd /tmp/
}

## Install `Burpsuite`
## -------------------
function installburpsuite()
{
	wget -O "/tmp/burpsuite.sh" "https://portswigger-cdn.net/burp/releases/download?product=community&type=Linux"
	wget -O "/tmp/burpsuite.txt" "https://raw.githubusercontent.com/snoopgodlinux/system/main/tmp/burpsuite.txt"
	chmod +x /tmp/burpsuite.sh && cat "/tmp/burpsuite.txt" | /tmp/burpsuite.sh
}

## Install `Maltego`
## -----------------
function installmaltego()
{
	wget -O "/tmp/Maltego.v4.6.0.deb" "https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.6.0.deb"
	dpkg -i /tmp/Maltego.v4.6.0.deb
}

## Install `Metasploit`
## --------------------
function installmetasploit()
{
	wget -O "/tmp/msfinstall" "https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb"
	chmod +x /tmp/msfinstall && /tmp/msfinstall
}

## Install `ProtonVPN`
## -------------------
function installprotonvpn()
{
	wget -O "/tmp/protonvpn-stable-release_1.0.3-3_all.deb" "https://repo2.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3-3_all.deb"
	sudo dpkg -i /tmp/protonvpn-stable-release_1.0.3-3_all.deb
	apt -y update && apt -y install proton-vpn-gnome-desktop
}

## Install `TorBrowser`
## --------------------
function installtorbrowser()
{
	wget -O "/tmp/tor-browser-linux-x86_64-13.0.14.tar.xz" "https://www.torproject.org/dist/torbrowser/13.0.14/tor-browser-linux-x86_64-13.0.14.tar.xz"
	tar -xvf /tmp/tor-browser-linux-x86_64-13.0.14.tar.xz -C /etc/skel/
	mv /etc/skel/tor-browser /etc/skel/.torbrowser
	rm -f /etc/skel/.torbrowser/start-tor-browser.desktop
}

## Install `Zaproxy`
## -----------------
function installzap()
{
	wget -O "/tmp/zaproxy.sh" "https://github.com/zaproxy/zaproxy/releases/download/v2.14.0/ZAP_2_14_0_unix.sh"
	wget -O "/tmp/zaproxy.txt" "https://raw.githubusercontent.com/snoopgodlinux/system/main/tmp/zaproxy.txt"
	chmod +x /tmp/zaproxy.sh && cat "/tmp/zaproxy.txt" | /tmp/zaproxy.sh
}

## --------------------- ##
## INSTALL DEBS PACKAGES ##
## --------------------- ##

## Build Deb packages
## ------------------
function installdebs()
{
	wget -O "/tmp/packages-main.zip" "https://codeload.github.com/snoopgodlinux/packages/zip/refs/heads/main"
	unzip /tmp/packages-main.zip -d /tmp/snoopgod/
	mv /tmp/snoopgod/packages-main/ /tmp/snoopgod/packages/
	cd /tmp/snoopgod/packages/
	chmod +x deb.sh && ./deb.sh
	cd build && dpkg -i *.deb && cd /tmp/
}

## ------------- ##
## CONFIG SYSTEM ##
## ------------- ##

## Config the desktop environment
## ------------------------------
function configdesktop()
{
	# Retrieve system repository
	wget -O "/tmp/system-main.zip" "https://codeload.github.com/snoopgodlinux/system/zip/refs/heads/main"
	unzip /tmp/system-main.zip -d /tmp/snoopgod/
	mv /tmp/snoopgod/system-main/ /tmp/snoopgod/system/

	# Create Skeleton config folder
	mkdir -p /etc/skel/.config

	# Create Skeleton local folder
	mkdir -p /etc/skel/.local

	# Setup user `bashrc`
	rm -f /etc/skel/.bashrc
	cp /tmp/snoopgod/system/etc/skel/bashrc.txt /etc/skel/.bashrc

	# Setup root `bashrc`
	rm -f /root/.bashrc
	cp /tmp/snoopgod/system/root/bashrc.txt /root/.bashrc

	# Copy config directory
	cp -r /tmp/snoopgod/system/etc/skel/.config/* /etc/skel/.config/

	# Copy local directory
	#cp -r /tmp/snoopgod/system/etc/skel/.local/* /etc/skel/.local/

	# Edit system conf
	sed -i "s/#DefaultTimeoutStartSec=90s/DefaultTimeoutStartSec=5s/" /etc/systemd/system.conf
	sed -i "s/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=5s/" /etc/systemd/system.conf

	# Configure utilities
	cp /tmp/snoopgod/system/usr/local/bin/snoopgod /usr/local/bin/
	chmod +x /usr/local/bin/snoopgod
	cp -r /tmp/snoopgod/system/usr/share/snoopgod /usr/share/
	chmod +x /usr/share/snoopgod/usr/bin/updater
	chmod +x /usr/share/snoopgod/usr/bin/upgrader
	chmod +x /usr/share/snoopgod/usr/bin/ucleaner
	chmod +x /usr/share/snoopgod/usr/bin/rcleaner

	# Copy the SnoopGod logo
	cp -r /tmp/snoopgod/system/usr/share/logos /usr/share

	# Copy `sddm` theme
	cp -r /tmp/snoopgod/system/usr/share/sddm/* /usr/share/sddm/

	# Copy `sddm` configuration
	cp -r /tmp/snoopgod/system/etc/sddm.conf.d/ /etc/

	# Import icons
	cp -r /tmp/snoopgod/system/usr/share/icons/* /usr/share/icons/

	# Import applications desktop
	cp /tmp/snoopgod/system/usr/share/applications/* /usr/share/applications/

	# Change Screenfetch
	rm -f /usr/bin/screenfetch
	cp /tmp/snoopgod/system/usr/bin/screenfetch /usr/bin/
	chmod +x /usr/bin/screenfetch

	# Copy `lsb-release` configuration
	rm -f /etc/lsb-release
	cp /tmp/snoopgod/system/etc/lsb-release /etc/

	# Copy `os-release` configuration
	rm -f /etc/os-release
	rm -f /usr/lib/os-release
	cp /tmp/snoopgod/system/etc/os-release /etc/
	cp /tmp/snoopgod/system/usr/lib/os-release /usr/lib/

	# Copy wallpapers
	rm -rf /usr/share/wallpapers/Next/
	cp -r /tmp/snoopgod/system/usr/share/wallpapers/* /usr/share/wallpapers/

	# Copy `proxychains` configuration
	rm -f /etc/proxychains.conf
	cp /tmp/snoopgod/system/etc/proxychains.conf /etc/
	rm -f /usr/bin/proxychains
	cp /tmp/snoopgod/system/usr/bin/proxychains /usr/bin/
	chmod +x /usr/bin/proxychains

	# Remove launchers
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
	rm -f /usr/share/applications/ubiquity-kdeui.desktop
	rm -f /usr/share/applications/*-BurpSuiteCommunity.desktop
	rm -f /usr/share/applications/*-zap.sh.desktop
}

## Config `kde-plasma`
## -------------------
function configkde()
{
	# Export `offscreen` environment
	export QT_QPA_PLATFORM=offscreen

	# Execute Plasma customization functions
	plasma-apply-desktoptheme breeze-dark >/dev/null 2>&1
	plasma-apply-colorscheme BreezeDark >/dev/null 2>&1
	plasma-apply-colorscheme --accent-color gainsboro >/dev/null 2>&1
	plasma-apply-lookandfeel -a org.kde.breezedark.desktop >/dev/null 2>&1

	# Move KDE configuration files to Skeleton folder
	mv $HOME/.config/gtkrc /etc/skel/.config/
	mv $HOME/.config/gtkrc-2.0 /etc/skel/.config/
	mv $HOME/.config/kdedefaults/* /etc/skel/.config/kdedefaults/
	mv $HOME/.config/kdeglobals /etc/skel/.config/
	mv $HOME/.config/plasmarc /etc/skel/.config/
	mv $HOME/.config/Trolltech.conf /etc/skel/.config/

	# Dolphinrc
	kwriteconfig5 --file /etc/skel/.config/dolphinrc --group "PlacesPanel" --key "IconSize" "32"
}

## --------------- ##
## CLEAN-UP SYSTEM ##
## --------------- ##

## Clean `root` directory
## ----------------------
function cleanroot()
{
	rm -rf /root/.cache
	rm -rf /root/.config
	rm -rf /root/.local
	rm -rf /root/.ssh
	rm -rf /root/.wget-hsts
}

## Clean `tmp` directory
## ---------------------
function cleantmp()
{
	rm -rf /tmp/*
}

## Clean `bash` history
## --------------------
function cleanbash()
{
	rm -f ~/.bash_history
	rm -f /root/.bash_history
	history -c && history -w
}

## Terminate
## ---------
function terminate()
{
	echo "Process completed"
	sleep 1s
}

## -------------- ##
## EXECUTE SCRIPT ##
## -------------- ##

## Launch
## ------
function launch()
{
    # Retrieve current datetime
	flushtime=`date +%s.%N`

	# Execute Actions
	clearscreen
	changedir
	configenv
	aptsources
	keepsafe
	removeunwanted
	kernelbuild
	installlibs
	installpython
	installjava
	installruby
	installperl
	install7zip
	installfonts
	installcommons
	installcracking
	installexploitation
	installforensics
	installhardening
	installgathering
	installnetworking
	installreverse
	installscripts
	installsniffing
	installstressing
	installvulns
	installwebapps
	installwireless
	keepsafe
	installbeefxss
	installburpsuite
	installmaltego
	installmetasploit
	installprotonvpn
	installtorbrowser
	installzap
	installdebs
	keepsafe
	configdesktop
	configkde
	cleanroot
	cleantmp
	cleanbash

	# Terminate
	terminate

	# Return notice
	endtime=`date +%s.%N`
	runtime=$( echo "$endtime - $flushtime" | bc -l )
	echo "Executed within ${runtime} seconds"
}

## -------- ##
## CALLBACK ##
## -------- ##

launch
