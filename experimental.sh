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
	sed -i 's/enabled=1/enabled=0/' /etc/default/apport
}

## --------------- ##
## INSTALL DESKTOP ##
## --------------- ##

## Install KDE PLasma
## ------------------
function kdeplasma()
{
	apt -y install kde-plasma-desktop
	echo 'InputMethod=""' > /etc/sddm.conf
}

## Install Bootable Utilities
## --------------------------
function bootutilities()
{
	apt -y install casper plymouth plymouth-theme-spinner ubiquity ubiquity-casper ubiquity-frontend-kde ubiquity-slideshow-kubuntu
}


## Configure Grub
## --------------
function grubconfig()
{
	sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=""/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/' /etc/default/grub
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
	kdeplasma
	bootutilities
	grubconfig
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
