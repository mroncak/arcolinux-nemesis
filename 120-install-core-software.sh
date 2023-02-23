#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

#echo "Deleting current /etc/pacman.d/mirrorlist and replacing with"
#echo
#echo "Server = http://mirror.rackspace.com/archlinux/\$repo/os/\$arch
#Server = https://mirror.rackspace.com/archlinux/\$repo/os/\$arch
#Server = https://mirrors.kernel.org/archlinux/\$repo/os/\$arch
#Server = https://mirror.osbeck.com/archlinux/\$repo/os/\$arch
#Server = http://mirror.osbeck.com/archlinux/\$repo/os/\$arch
#Server = https://geo.mirror.pkgbuild.com/\$repo/os/\$arch" | sudo tee /etc/pacman.d/mirrorlist
#echo
#tput setaf 2
#echo "########################################################################"
#echo "Arch Linux Servers have been written to /etc/pacman.d/mirrorlist"
#echo "Use nmirrorlist to inspect"
#echo "########################################################################"
#tput sgr0
#echo

func_install() {
    if pacman -Qi $1 &> /dev/null; then
        tput setaf 2
        echo "###############################################################################"
        echo "################## The package "$1" is already installed"
        echo "###############################################################################"
        echo
        tput sgr0
    else
        tput setaf 3
        echo "###############################################################################"
        echo "##################  Installing package "  $1
        echo "###############################################################################"
        echo
        tput sgr0
        sudo pacman -S --noconfirm --needed $1
    fi
}

sudo pacman -Syy

echo
tput setaf 2
echo "################################################################"
echo "################### Core software"
echo "################################################################"
tput sgr0
echo

list=(
onlyoffice-bin
virt-manager
qemu-desktop
qemu-emulators-full
iptables-nft
firewalld
ntfs-3g
brave-bin
terminator
freerdp
remmina
keepassxc
mpv
nextcloud-client
openfortivpn
timeshift
timeshift-autosnap
transmission-gtk
ranger
kdeconnect
pasystray
ttf-ubuntu-mono-nerd
powerline-fonts
intel-media-driver
gnome-calculator
gnome-firmware
icedtea-web
zoom
adobe-source-sans-fonts
aic94xx-firmware
arandr
arc-gtk-theme
archiso
avahi
awesome-terminal-fonts
baobab
bash-completion
bat
bibata-cursor-theme-bin
catfish
chromium
cpuid
curl
dconf-editor
dmenu
downgrade
duf
evince
expac
feh
file-roller
firefox
fish
flameshot-git
font-manager
galculator
gimp
git
gitahead-bin
gitfiend
gnome-disk-utility
gparted
grub-customizer
gtop
gvfs-smb
hardcode-fixer-git
hardinfo-gtk3
hddtemp
htop
hw-probe
inkscape
insync
kvantum
linux-firmware-qlogic
logrotate
lolcat
lshw
man-db
man-pages
mlocate
meld
mintstick-git
most
neofetch
network-manager-applet
networkmanager-openvpn
nitrogen
nomacs
noto-fonts
ntp
nss-mdns
numlockx
oh-my-zsh-git
openresolv
paru-bin
pavucontrol
playerctl
polkit-gnome
gnome-keyring
python-pylint
python-pywal
pv
rate-mirrors-bin
ripgrep
rsync
scrot
sardi-icons
sparklines-git
speedtest-cli-git
spotify
squashfs-tools
sublime-text-4
surfn-icons-git
system-config-printer
the_platinum_searcher-bin
the_silver_searcher
time
tree
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-hack
ttf-inconsolata
ttf-liberation
ttf-roboto
ttf-roboto-mono
ttf-ubuntu-font-family
upd72020x-fw
variety
visual-studio-code-bin
wd719x-firmware
wget
wttr
xcolor
xdg-user-dirs
xorg-xkill
yay-bin
zsh
zsh-completions
zsh-syntax-highlighting
gzip
p7zip
unace
unrar
unzip
)


count=0

for name in "${list[@]}" ; do
    count=$[count+1]
    tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
    func_install $name
done

if [ ! -f /usr/share/xsessions/plasma.desktop ]; then
  sudo pacman -S --noconfirm --needed qt5ct
fi

sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service
sudo systemctl enable firewalld.service
sudo systemctl enable libvirtd.service

yay -S --noconfirm --needed ferdium-bin
yay -S --noconfirm --needed microsoft-edge-stable-bin
yay -S --noconfirm --needed gnome-network-displays

###############################################################################################


# when on Arch Linux

if grep -q "Arch Linux" /etc/os-release; then
  echo
  tput setaf 2
  echo "################################################################"
  echo "############### Installing software for Arch Linux - Any desktop"
  echo "################################################################"
  tput sgr0
  echo

  echo
  echo "################################################################"
  echo "Getting latest /etc/nsswitch.conf from ArcoLinux"
  echo "################################################################"
  echo
  sudo cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
  sudo wget https://raw.githubusercontent.com/arcolinux/arcolinuxl-iso/master/archiso/airootfs/etc/nsswitch.conf -O $workdir/etc/nsswitch.conf

fi

# when on xfce

if [ -f /usr/share/xsessions/xfce.desktop ]; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Installing software for Xfce"
  echo "################################################################"
  tput sgr0
  echo

  sudo pacman -S --noconfirm --needed menulibre
  sudo pacman -S --noconfirm --needed mugshot
  sudo pacman -S --noconfirm --needed prot16-xfce4-terminal
  sudo pacman -S --noconfirm --needed tempus-themes-xfce4-terminal-git
  sudo pacman -S --noconfirm --needed xfce4-terminal-base16-colors-git

fi

echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
