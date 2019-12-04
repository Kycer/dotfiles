#!/bin/bash

# 添加源
echo -e "Server = http://mirrors.aliyun.com/archlinux/\$repo/os/\$arch\nServer = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch\nServer = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist &&
echo -e "[archlinuxcn]\nServer = https://repo.archlinuxcn.org/\$arch" >>  /etc/pacman.conf &&

pacman -Syy && pacman -S archlinuxcn-keyring
sudo pacman -S python gvfs gvfs-mtp yay git aria2  w3m ranger unzip-iconv feh i3-gaps-next-git i3blocks v2ray htop visual-studio-code-bin  fcitx-im fcitx-configtool fcitx-libpinyin fcitx-cloudpinyin neofetch dunst fish picom pulseaudio rofi xf86-video-ati xorg-server xorg-xprop xorg-xrandr xorg-xrdb xorg-xinit arc-gtk-theme flat-remix-git lxappearance-gtk3 pcmanfm ttf-dejavu wqy-zenhei nerd-fonts-complete ttf-monaco adobe-source-han-sans-cn-fonts chromium
