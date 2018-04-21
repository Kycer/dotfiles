Arch linux 安装和配置
===================
- - -
> 磁盘分区与挂载
```bash
# 查看分区挂载情况
lsblk 
# parted 划分  删除：rm
parted /dev/sda
mktable  # 磁盘格式填写ESP
mkpart esp fat32 1MiB 513MiB #建立esp分区
mkpart primary linux-swap 513M  8G # swap
mkpart primary ext4 8G 20.5G # /
mkpart primary ext4 20.5G 100% # home
# 格式化分区 
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4
# 格式化swap分区并启用：
mkswap /dev/sda2
swapon /dev/sda2
# 挂载分区：
mount /dev/sda3 /mnt
mkdir -p /mnt/boot/EFI
mount /dev/sda1 /mnt/boot/EFI
mkdir /mnt/home
mount /dev/sda4 /mnt/home
```
> 连接网络并设置软件源：
```bash
# 配置网络
dhcpcd
ping -c 4 www.baidu.com
# 配置源
nano /etc/pacman.d/mirrorlist
Server = http://mirrors.163.com/archlinux/$repo/os/$arch
Server = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
pacman -Syy
```
> 安装基本系统并生成fstab：
```bash
pacstrap /mnt base
genfstab -U -p /mnt >> /mnt/etc/fstab
cp /mnt/etc/fstab /mnt/etc/fstab.bak #备份fstab
```
> 配置基础系统：
```bash
arch-chroot /mnt /bin/bash
# 设置Locale：
nano /etc/locale.gen  # 去掉前面的  *
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
# 生成locale讯息：
locale-gen
#创建locale.conf：
echo LANG=en_US.UTF-8 > /etc/locale.conf 
#设置时区和设置硬件时间：
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
hwclock --systohc --utc 
#设置主机名：
echo archlinux > /etc/hostname 
nano /etc/hosts
#开机启动dhcpcd
systemctl enable dhcpcd 
#设置Root密码：
passwd
#添加用户 useradd -m -g "初始组" -G "附加组" -s "登陆shell" "用户"
useradd -m -g users -s /bin/bash name
```

> 引导启动
- systemd-boot启动
```bash
#安装
bootctl --path=/boot/EFI install
bootctl --path=/boot/EFI update
#配置 loader.conf 
nano /boot/loader/loader.conf 
timeout 30            #本行是开机时，系统选单的等待时间；
default arch        #本行是指定运行哪个启动配置文件。
#配置arch.conf
cp /usr/share/systemd/bootctl/arch.conf /boot/loader/entries/arch.conf
nano /boot/loader/entries/arch.conf
#获取 PARTUUID
blkid -s PARTUUID -o value /dev/sda6
#具体内容
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=PARTUUID=09a7b897-1a0d-4518-b2d8-19da8e89068d rw
```
- 使用GRUB
```bash
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=arch_grub --recheck 
grub-mkconfig -o /boot/grub/grub.cfg
```

> 退出
```bash
exit # 退回安装环境
umount -R /mnt/boot
umount -R /mnt
reboot
```
> 安装后配置
```bash
 # 安装基本软件
pacman -S alsa-utils xf86-video-ati xorg-server ttf-dejavu wqy-zenhei fcitx-im tar git sudo  --needed base-devel feh compton rofi wireless_tools
# 在 /etc/pacman.conf 安装 archlinuxcn-keyring 包以导入 GPG key
[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
#安装yaourt
pacman -Syu yaourt
# 安装i3wm桌面
yaourt -S i3wm-git polybar
```