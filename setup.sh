#!/usr/bin/env bash

# KrimDots
# Tryout for loading custom script in EndeavourOS Installer

# Skeleton script by: joekamprad [joekamprad //a_t// endeavouros.com]
# Brightness/volume control script by Nmoleo: https://gitlab.com/Nmoleo/i3-volume-brightness-indicator
# Original dots by Sinomor: https://github.com/Sinomor/dots


##############
## Packages ##

cd /home/$USER
su $USER
git clone https://github.com/Krimkerre/bspwm-gruvbox-eos.git

sudo pacman -S --needed --noconfirm - < user_packages.txt
yay -S cava --noconfirm

sudo rm -r /usr/share/xsessions/bspwm.desktop
sudo cp -R bspwm-gruvbox-eos/bspwm.desktop /usr/share/xsessions/bspwm.desktop


##########
## Dots ##

sudo mkdir /usr/share/backgrounds
sudo cp -R bspwm-gruvbox-eos/wall.jpg /usr/share/backgrounds/wall.jpg
sudo cp -R bspwm-gruvbox-eos/themes /user/share/
sudo cp -R bspwm-gruvbox-eos/icons /user/share/

cp -R bspwm-gruvbox-eos/* /home/$USER/
chmod -R +x /home/$USER/.config/bspwm/scripts
chmod -R +x /home/$USER/.config/bspwm/rofi/scripts


#############
## LightDM ##

sudo systemctl enable lightdm.service -f
sudo systemctl set-default graphical.target
sudo cp -R lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf


##############
## Touchpad ##

sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF

#########
## END ##

rm -rf bspwm-gruvbox-eos


#########################