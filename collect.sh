#!/bin/sh

## Configs
mkdir -p ./configs

# i3
cp -r ~/.config/i3 ./configs

# ZSH
cp -r ~/.config/zsh ./configs
cp ~/.profile ./configs

# Terminator
cp -r ~/.config/terminator ./configs

# Vim
mkdir -p ./configs/nvim
cp ~/.config/nvim/init.vim ./configs/nvim
cp /usr/share/nvim/runtime/bundle/onedark.vim/autoload/onedarker.vim ./configs/nvim/onedarker.vim

# Utop
cp ~/.utoprc ./configs

# Polybar
cp -r ~/.config/polybar ./configs

# Rofi
cp -r ~/.config/rofi ./configs

# GEF
cp ~/.gef.rc ./configs

# xinit
cp ~/.xinitrc ./configs

# radare2
cp ~/.radare2rc ./configs

# GDB
cp ~/.gdbinit ./configs
cp ~/.gdbinit-gef.py ./configs

## Scripts
mkdir -p ./scripts

# i3
cp -Tr ~/.i3/scripts ./scripts/i3

# Polybar
cp -Tr ~/.polybar/scripts ./scripts/polybar

# Firewall
cp -Tr ~/firewall ./scripts/firewall

# ~/bin
cp -Tr ~/bin ./scripts/home-bin

# /var/myscripts
cp -Tr /var/myscripts ./scripts/var-myscripts

## Services
mkdir -p services

cp /etc/systemd/system/backlight_perms.service ./services
cp /etc/systemd/system/disable_lid_wake.service ./services
cp /etc/systemd/system/kbdrate.service ./services
cp /etc/systemd/system/numlock.service ./services
cp /etc/systemd/system/parcellite.service ./services
cp /etc/systemd/system/resume@vinnie.service ./services
cp /etc/systemd/system/suspend@vinnie.service ./services
cp /etc/systemd/system/vpnup@vinnie.service ./services


echo -e "\u001b[33mIMPORTANT: MAKE SURE NO PASSWORDS OR SECRET KEYS ARE PUBLISHED!!\u001b[0m"
