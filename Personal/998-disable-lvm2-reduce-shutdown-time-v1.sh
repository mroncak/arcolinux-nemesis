#!/bin/bash
set -e
##################################################################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxb.com
# Website	:	https://www.arcolinuxiso.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

FIND="use_lvmetad = 1"
REPLACE="use_lvmetad = 0"

find /etc/lvm/lvm.conf -type f -exec sudo sed -i "s/$FIND/$REPLACE/g" {} \;

sudo systemctl stop lvm2-lvmetad.socket lvm2-lvmetad.service
sudo systemctl disable lvm2-lvmetad.socket lvm2-lvmetad.service

sudo systemctl mask lvm2-monitor

echo "################################################################"
echo "####                      reboot to 0 seconds             ######"
echo "################################################################"
