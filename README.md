# setup

## packages
```
sudo apt install neofetch
sudo apt install ghostwriter

sudo apt install nvidia-driver

# desktop environment
sudo apt install tasksel

# vlc player
sudo apt install libavcodec-extra vlc
```

## nvidia graphics
Check [here](https://wiki.debian.org/NvidiaGraphicsDrivers) for more accurate setup directions.
```
# graphics info
sudo lshw -C display

sudo apt install linux-headers-amd64
sudo nano /etc/apt/sources.list
#...
deb <mirror> sid main contrib non-free non-free-firmware
#eof
sudo apt install nvidia-driver firmware-misc-nonfree
```

### support for 32-bit games
Check [#Installing_32-bit_libraries_on_a_64-bit_system](https://wiki.debian.org/NvidiaGraphicsDrivers#Installing_32-bit_libraries_on_a_64-bit_system) for more details
```
# enable 32 bit architecture
sudo dpkg --add-architecture i386 && sudo apt update
# install 32 bit nvidia graphics
sudo apt install nvidia-driver-libs:i386
```

## backports
Basically newer, but unstable releases
```
sudo nano /etc/apt/sources.list.d/backports.list
#
deb http://deb.debian.org/debian bookworm-backports main
#eof
```
### Installing a backport package
```
sudo apt install -t <package>
```

## security setup

```
sudo apt update
sudo apt-get update
sudo reboot

sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow http
sudo ufw allow https
sudo ufw enable

# view ufw policies
sudo grep -i '^default_' /etc/default/ufw

```

### optional
```
sudo nano /eetc/default/ufw
#
IPV6=yes
# eof

sudo ufw allow ssh
sudo ufw allow <port>/tcp
sudo ufw allow proto tcp from <from> to <to> port <port>
```

## backups
### system settings
```
sudo apt install timeshift
sudo nano cat /etc/timeshift/timeshift.json
```

## mirrors
```
sudo nano /etc/apt/sources.list
sudo apt install netselect-apt
sudo netselect-apt testing # get 10 close mirror servers

# after changing mirror
sudo apt upgrade -y
```

### user files
lmao good luck


# customization

## Desktop environment
```
sudo apt install kde-plasma-desktop
sudo apt install task-kde-desktop
# select sddm
```

# software

Find VSCode installation [here](https://code.visualstudio.com/docs/setup/linux)

### package list

# additional sources
## helpful repos
1. https://github.com/4rt3ry/resources
2. https://github.com/4rt3ry/linux-setup