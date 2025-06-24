#!/bin/sh

# Add 8.8.8.8 DNS
# sudo echo "8.8.8.8" >> /etc/resolv.conf wont work
echo '8.8.8.8' | sudo tee -a /etc/resolv.conf

# pacman ParallelDownloads = 15
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 15/' /etc/pacman.conf

#Pacman.conf enable color output
sudo sed -i 's/#Color/Color/' /etc/pacman.conf

# pacman update and upgrade
sudo pacman -Sy --noconfirm archlinux-keyring
sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm git base-devel

# yay install
git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
chmod 777 -R /tmp/yay-bin
cd /tmp/yay-bin && makepkg -si --noconfirm

# Install packages using yay
# Yay is slow so we use it only for required packages
# and use pacman for the rest
yay -S --noconfirm \
        vpcs \
        dynamips \
        ubridge \
        gns3-server \
        gns3-gui

sudo pacman -Sy --noconfirm \
            libvirt \
            inetutils \
            glibc \
            xorg \
            zellij \
            docker \
            docker-compose \
            xterm

# Config zellij multiplexer
echo 'if [ -z "$ZELLIJ" ]; then zellij; fi' >> /home/vagrant/.bashrc

# Set SSH X11Forwarding
sudo sed -i 's/#X11Forwarding no/X11Forwarding yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Add vagrant user to docker group
sudo usermod -aG docker vagrant