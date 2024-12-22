# setup

## packages
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
sudo apt install timeshift
sudo nano cat /etc/timeshift/timeshift.json
```

## mirrors
Find and configure the 10 closest mirrors and immediately update the system. 

```
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo pacman-mirrors --fasttrack --country United_States --proto https && sudo pacman -Syu
```


# customization

## Desktop environment
```
# sudo pacman -S --needed xorg sddm

pacman -S --needed plasma kde-applications
# select sddm
# sudo systemctl enable ssdm
# sudo systemctl enable NetworkManager
```

# software

Find VSCode installation [here](https://code.visualstudio.com/docs/setup/linux)

### package list

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