# seriously. dont use it

#!/bin/bash

# VARIABLES
# Home directory name
homedir='/home/andy'

pacman -Syu

# install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# install WM and dependencies

pacman -Sq --noconfirm xorg xorg-xinit nitrogen picom i3-gaps i3blocks i3lock i3status
yay -S bumblebee-status

# drivers
pacman -Sq --noconfirm nvidia nvidia-utils

# OR
# pacman -Sq --noconfirm xf86-video-qxl

# OR
# pacman -Sq --noconfirm xf86-video-amdgpu

# install tools necessary for base use

pacman -Sq --noconfirm terminator pcmanfm lxappearance firefox git arandr dmenu

cp /etc/X11/xinit/xinitrc ${homedir}/.xinitrc

sed '50,$d' ${homedir}/.xinitrc > ${homedir}/temp
cat ${homedir}/temp > ${homedir}/.xinitrc
rm ${homedir}/temp


# Use this line if in a vm
# printf '\nxrandr --output Virtual1 --mode 1920x1080\n' >> ${homedir}/.xinitrc
printf 'picom -f &\n' >> ${homedir}/.xinitrc
printf 'nitrogen --restore &\n' >> ${homedir}/.xinitrc
printf 'exec i3' >> ${homedir}/.xinitrc


### At this point, I git clone the entire repository again to guarantee that
### this command works even if people have moved things around.
git clone https://github.com/akaminer11/System-configs temp/

mkdir -p ${homedir}/.config/i3
mv temp/i3/config ${homedir}/.config/i3


mkdir ${homedir}/.config/picom
# Uncomment this and comment the one below it if in a virual machine
# and you need to disable vsync
# mv temp/picom/picom_no_vsync.conf ${homedir}/.config/picom/picom.conf
mv temp/picom/picom.conf ${homedir}/.config/picom

###############################################################################
#                   Window Manager Installed

chmod +x temp/scripts/bashrc-setup.sh
temp/scripts/bashrc-setup.sh

setpriv startx --rgid 1000 --ruid 1000
