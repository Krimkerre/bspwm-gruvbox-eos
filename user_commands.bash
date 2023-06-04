#!/usr/bin/env bash

# KrimDots
# Tryout for loading custom script in EndeavourOS Installer

# Skeleton script by: joekamprad [joekamprad //a_t// endeavouros.com]
# Brightness/volume control script by Nmoleo: https://gitlab.com/Nmoleo/i3-volume-brightness-indicator
# Original dots by Sinomor: https://github.com/Sinomor/dots



##########
## Dots ##
cd /home/$USER
su $USER
git clone https://github.com/Krimkerre/bspwm-gruvbox-eos.git
cd bspwm-gruvbox-eos
sudo mkdir /usr/share/backgrounds
sudo mv -R wall.jpg /usr/share/backgrounds/wall.jpg
sudo mv -R themes /usr/share/
sudo mv -R icons /usr/share/
cp -R .config ~/
cp -R .fonts ~/
cp -R .local ~/
cp -R telegram ~/
cp .Xresources ~/
cp .bashrc ~/
cp .xinitrc ~/
chmod -R +x ~/.config/bspwm/scripts
chmod -R +x ~/.config/bspwm/rofi/scripts


##############
## Packages ##

sudo pacman -S --needed --noconfirm - < user_packages.txt

sudo cp -R bspwm.desktop /usr/share/xsessions/bspwm.desktop


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
cd ..
rm -rf bspwm-gruvbox-eos


#########################
