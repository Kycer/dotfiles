# archlinux安装
> 磁盘分区与挂载
```elixir
# 查看分区挂载情况
lsblk 
# parted 划分
parted /dev/sda
mkpart esp fat32 1MiB 513MiB #建立esp分区
mkpart primary ext4 513M 20.5G # /
mkpart primary linux-swap 20.5G 24.5G # swap
mkpart primary ext4 24.5G 100% # home
# 再次查看分区挂载情况
lsblk 
# 格式化分区 
mkfs.fat -F 32 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda4
# 格式化swap分区并启用：
mkswap /dev/sda3
swapon /dev/sda3
# 挂载分区：
mount /dev/sda2 /mnt
mkdir /mnt/boot/EFI
mount /dev/sda1 /mnt/boot/EFI
mkdir /mnt/home
mount /dev/sda4 /mnt/home
```
> 连接网络并设置软件源：
```bash
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
_**en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8**_
locale-gen# 生成locale讯息：
echo LANG=en_US.UTF-8 > /etc/locale.conf #创建locale.conf：
nano /etc/pacman.conf  #启用pacman彩色显示 去掉Color前面的注释
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime #设置时区：
hwclock --systohc --utc #设置硬件时间：
#设置主机名：
echo archlinux > /etc/hostname 
nano /etc/hosts
systemctl enable dhcpcd #开机启动dhcpcd
#设置Root密码：
passwd
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

title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=PARTUUID=09a7b897-1a0d-4518-b2d8-19da8e89068d rw
```
- 使用GRUB
```bash
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/esp --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
```

> 退出
```bash
exit # 退回安装环境
umount -R /mnt/boot
umount -R /mnt
reboot
```