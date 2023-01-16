#!/bin/bash
#set -e
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

func_install_qtile() {

    echo
    tput setaf 2
    echo "################################################################"
    echo "################### Install Qtile"
    echo "################################################################"
    tput sgr0
    echo

    list=(
    qtile
    powerline
    archlinux-logout-git
    edu-skel-git
    edu-system-git
    arcolinux-wallpapers-candy-git
    arcolinux-wallpapers-git
    autorandr
    dmenu
    feh
    gvfs
    lolcat
    lxappearance
    picom
    polkit-gnome
    rofi
    sxhkd
    thunar
    thunar-archive-plugin
    thunar-volman
    ttf-hack
    volumeicon
    xfce4-notifyd
    xfce4-power-manager
    xfce4-screenshooter
    xfce4-settings
    xfce4-taskmanager
    xfce4-terminal
    arcolinux-conky-collection-git
    arcolinux-variety-autostart-git
    network-manager-applet
    arcolinux-pamac-all
    )

    count=0

    for name in "${list[@]}" ; do
        count=$[count+1]
        tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
        func_install $name
    done
}

