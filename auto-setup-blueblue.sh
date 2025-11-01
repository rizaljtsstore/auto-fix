#!/bin/bash
# ==============================================
# Auto Setup Blueblue (Slim Version)
# Untuk Debian 12/13 - by rumahjitra
# ==============================================

clear
echo -e "\e[1;36m=====================================\e[0m"
echo -e "\e[1;37m     AUTO SETUP BLUEBLUE (SLIM)      \e[0m"
echo -e "\e[1;36m=====================================\e[0m"
echo ""

# --- Minta Domain Dari User ---
read -p "Masukkan domain anda (contoh: ssh.domainku.com): " user_domain
if [[ -z "$user_domain" ]]; then
    echo "❌ Domain tidak boleh kosong!"
    exit 1
fi
echo "✅ Domain diset ke: $user_domain"

# --- Pastikan keperluan asas ---
apt update -y
apt install -y bzip2 gzip coreutils screen wget curl nano zip unzip git

# --- Muat turun skrip asal dari NevermoreSSH ---
cd /root
wget -q https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/setup.sh -O setup.sh
chmod +x setup.sh

# --- Tambah domain ke setup.sh sebelum run ---
sed -i "s/read -p 'Masukkan domain.*//'g" setup.sh
sed -i "/# Config domain/a DOMAIN=\"$user_domain\"" setup.sh

# --- Jalankan dalam screen supaya auto continue ---
screen -S blueblue ./setup.sh
