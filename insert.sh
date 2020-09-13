#!/bin/bash

yay -S dunst neofetch picom polybar ranger rofirofi i3blocks i3-gaps-next-git

# dunst
dunst_dri="$HOME/.config/dunst"
if [ ! -d "$dunst_dri" ]; then
    mkdir $dunst_dri
fi
ln -sf $HOME/.dotfiles/config/dunst/dunstrc $dunst_dri/dunstrc
killall dunst

# neofetch
neofetch_dri="$HOME/.config/neofetch"
if [ ! -d "$neofetch_dri" ]; then
    mkdir $neofetch_dri
fi
ln -sf $HOME/.dotfiles/config/neofetch/config.conf $neofetch_dri/config.conf

# picom
picom_dri="$HOME/.config/picom"
if [ ! -d "$picom_dri" ]; then
    mkdir $picom_dri
fi
ln -sf $HOME/.dotfiles/config/picom/picom.conf $picom_dri/picom.conf
killall picom &&
picom -b --experimental-backends

# polybar
polybar_dri="$HOME/.config/polybar"
if [ ! -d "$polybar_dri" ]; then
    mkdir $polybar_dri
fi
ln -sf $HOME/.dotfiles/config/polybar/config $polybar_dri/config

# ranger
ranger_dri="$HOME/.config/ranger"
if [ -d "$ranger_dri" ]; then
    rm -rf $ranger_dri
fi
ln -sf $HOME/.dotfiles/config/ranger $ranger_dri

# rofi
rofi_dri="$HOME/.config/rofi"
if [ ! -d "$rofi_dri" ]; then
    mkdir $rofi_dri
fi
ln -sf $HOME/.dotfiles/config/rofi/config.rasi $rofi_dri/config.rasi

# i3
i3_dri="$HOME/.config/i3"
if [ ! -d "$i3_dri" ]; then
    mkdir $i3_dri
fi
ln -sf $HOME/.dotfiles/config/i3/config $i3_dri/config

# i3blocks
i3blocks_dri="$HOME/.config/i3blocks"
if [ ! -d "$i3blocks_dri" ]; then
    mkdir $i3blocks_dri
fi
ln -sf $HOME/.dotfiles/config/i3blocks/config $i3blocks_dri/config

# bspwm
bspwm_dri="$HOME/.config/bspwm"
if [ ! -d "$bspwm_dri" ]; then
    mkdir $bspwm_dri
fi
ln -sf $HOME/.dotfiles/config/bspwm/bspwmrc $bspwm_dri/bspwmrc

# sxhkd
sxhkd_dri="$HOME/.config/sxhkd"
if [ ! -d "$sxhkd_dri" ]; then
    mkdir $sxhkd_dri
fi
ln -sf $HOME/.dotfiles/config/sxhkd/sxhkdrc $sxhkd_dri/sxhkdrc

# fontconfig
fontconfig_dri="$HOME/.config/fontconfig"
if [ ! -d "$fontconfig_dri" ]; then
    mkdir $fontconfig_dri
fi
ln -sf $HOME/.dotfiles/config/fontconfig/fonts.conf $fontconfig_dri/fonts.conf


# shell

ln -sf $HOME/.dotfiles/config/shell/.pam_environment  $HOME/.pam_environment
ln -sf $HOME/.dotfiles/config/shell/.xinitrc  $HOME/.xinitrc
ln -sf $HOME/.dotfiles/config/shell/.xprofile  $HOME/.xprofile
ln -sf $HOME/.dotfiles/config/shell/.Xresources  $HOME/.Xresources
xrdb $HOME/.Xresources
cp $HOME/.dotfiles/config/shell/.bashrc $HOME/.bashrc
source $HOME/.bashrc
cp $HOME/.dotfiles/config/shell/.zshrc  $HOME/.zshrc
source $HOME/.zshrc
