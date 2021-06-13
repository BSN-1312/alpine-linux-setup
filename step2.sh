#!/bin/ash

apk add curl socat nmap net-tools build-base setxkbmap sudo xrandr bash termite zsh dbus dbus-x11
setup-xorg-base xfce4 xfce4-terminal lightdm dbus-x11
apk add lightdm-gtk-greeter i3wm i3status libxcb-dev dmenu
apk add mesa-gl glib feh firefox-esr accountsservice openvpn
apk add docker docker-compose

# add user
adduser fleety
mkdir -p /home/fleety/wallpaper


# user setup fleety
cp ./fleety/wallpaper/compass.jpg /home/ibuetler/wallpaper/compass.jpg
cp ./fleety/.profile /home/fleety/.profile
mkdir -p /home/fleety/.scripts
cp ./fleety/login-script.sh /home/fleety/.scripts/login-script.sh
chown -R fleety:fleety /home/fleety

# add ibuetler to sudoers
cat ./fleety/sudoers >> /etc/sudoers

# greeter background
echo "background=/home/fleety/wallpaper/compass.jpg" >> /etc/lightdm/lightdm-gtk-greeter.conf

# set background image in accountsservice
cp ./fleety/fleety /var/lib/AccountsService/users
chown root:root /var/lib/AccountsService/users/fleety

# add user to docker
addgroup fleety docker

# give fleety write access to /opt dir
chown ibuetler:ibuetler /opt

# mkdir /opt/docker
mkdir -p /opt/docker
cp ./docker/* /opt/docker/
chown fleety:fleety /opt/docker


