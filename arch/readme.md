	# setup

## useful packages for setup
```
sudo pacman -S neofetch
sudo pacman -S ghostwriter
sudo pacman -S code
sudo pacman -S vim

# fix ghostwriter segfault

echo "[Preview]
lastUsedExporter=cmark-gfm" > ~/.config/kde.org/ghostwriter.conf
```

## backups
### system settings
```
sudo pacman -S timeshift
sudo nano cat /etc/timeshift/timeshift.json
```

## mirrors
Find and configure the 10 closest mirrors and immediately update the system. 

```
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo pacman-mirrors --fasttrack --country United_States --proto https && sudo pacman -Syu
```


# customization

## desktop environment
```
# sudo pacman -S --needed xorg sddm

pacman -S --needed plasma kde-applications
# select sddm
# sudo systemctl enable ssdm
# sudo systemctl enable NetworkManager
```

## hibernation

*This method assumes you already have a swap partition at least the size of your RAM (ideally 1.5x RAM). If not, consider using a swap file and check out [Arch Wiki - Hibernation](https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Hibernation). Note that it's possible for hibernation to work even if your swap space is smaller than your RAM considering your memory usage is little.*

To enable hibernation, you need to configure initramfs and to point the kernel to your swap partition.

Grab swap info: 
```
swapon

# example result:
# NAME           TYPE       SIZE USED PRIO
# /dev/nvme0n1p1 partition 34.2G   0B   -2
```

Copy the UUID key/value pair (without quotes) from the following:
```
sudo blkid

# example result:
# /dev/nvme0n1p1: LABEL="swap" UUID="f91799cd-c8ed-423d-8123-967955e5c867" TYPE="swap" PARTUUID="51d5e152-4a3e-437d-8e87-2f00a9f782ed"

# copy UUID=f91799cd-c8ed-423d-8123-967955e5c867
```

Open `/etc/default/grub` in any editor and modify the following line `GRUB_CMDLINE_LINUX_DEFAULT="... resume=UUID=<UUID>"`. Then regenerate your GRUB configuration.

```
sudo vim /etc/default/grub

# edit the following line
# GRUB_CMDLINE_LINUX_DEFAULT="... resume=UUID=<UUID>

# regenerate grub config
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

Next, we need to configure initramfs. To do so, add the resume hook to `/etc/mkinitcpio.conf`. If `resume` already exists, you do not need to do anything more for this step. Otherwise, regenerate the configuration and reboot the system.

```
sudo vim /etc/mkinitcpio.conf

# edit the following line
# HOOKS="... resume"  

sudo mkinitcpio -P
reboot
```

Check out this super cool guide: [How To Enable Hibernation in Manjaro](https://www.vegard.net/manjaro-enable-hibernate/)

# software

Find VSCode installation [here](https://code.visualstudio.com/docs/setup/linux)

## package list

### xclip
Copying to the sytem clipboard via command line
```
sudo pacman -S xclip
```

### node
Development with JavaScript
```
sudo pacman -S nvm

# set up $HOME/.nvm and the nvm command
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc

nvm ls-remote
nvm install <version>
```

### keyd
Create keyboard macros (or pair with Piper to create more complex mouse macros)
```
sudo pacman -S keyd
```

### piper
Create mouse macros
```
sudo pacman -S piper
```

### qemu/kvm
Virtual machines galore!
```
lscpu | grep -i virt

# which kvm modules are installed
zgrep CONFIG_KVM /proc/config.gz

sudo pacman -S qemu-full qemu-img libvirt virt-install virt-manager virt-viewer \
edk2-ovmf dnsmasq swtpm guestfs-tools libosinfo tuned

# libvirtd modular services
for drv in qemu interface network nodedev nwfilter secret storage; do
    sudo systemctl enable virt${drv}d.service;
    sudo systemctl enable virt${drv}d{,-ro,-admin}.socket;
done

# shutdown -r 0

```
View https://gist.github.com/tatumroaquin/c6464e1ccaef40fd098a4f31db61ab22 for more.

### docker

Run a headless container. For example, you can run Kali linux executables without installing unecessary files.

```
sudo pacman -S docker
sudo systemctl start docker

# For example, installing Kali with network enabled for net tools
docker run -it --cap-add NET_ADMIN kalilinux/kali-rolling
apt update & apt -y install kali-linux-headless


```

# additional sources
## helpful repos
1. https://github.com/4rt3ry/resources
2. https://github.com/4rt3ry/linux-setup

## git setup
As far as I know, [git-credential-manager](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md#debian-package) does not support Arch Linux systems
```
ssh-keygen -t rsa -b 4096 -c "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/ssh_key_file
```
