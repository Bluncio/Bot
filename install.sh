#!/bin/bash
apt install wget -y
clear

echo "[PL] VPS BOT DISCORD CREATOR (discord: blomi24)"

echo Tạo VPS Hosting miễn phí của riêng bạn!

read -p "Czy na pewno chcesz kontynuować? Zgadzasz się na tworzenie czy nie? (t/n): " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Tt]$ ]]; then
    echo "Instalacja przerwana."
    exit 1
fi

clear

echo "Zainstaluj python3-pip i okno dokowane."
sudo apt update
sudo apt install -y python3 python3-pip docker.io
echo "Zainstalowano pomyślnie"

clear

echo "Zainstaluj niezbędne pliki"
wget https://raw.githubusercontent.com/AlmostCloud/bot-freevps/refs/heads/main/Dockerfile1
wget https://raw.githubusercontent.com/AlmostCloud/bot-freevps/refs/heads/main/Dockerfile2
wget https://download944.mediafire.com/xelp9ytk3flgjYxjc8nIAxsk9mw-ke1SOTNYCAkmD-RUosiMYQ25a0jceaFKW8T2JcKb5wAd6tmjOoqcNF7K2iLL_qd7aAbL1dVyn6lqJ2quXfyO4HKweTtL8J2qrd48ayWN6RAaJaoBChm97LVTBdtTIewDE7F_3WKUgu_sD9wupA/7f6pad8wl9ahek5/main.py
echo "Zainstalowano pomyślnie"

clear

echo "Zainstaluj właśnie pobrane pliki"
docker build -t ubuntu-22.04-with-tmate -f Dockerfile1 . && docker build -t debian-with-tmate -f Dockerfile2 .
pip install docker discord

clear

echo "Wprowadź token bota niezgody"
read -r TOKEN
echo "Aktualizowanie pliku main.py za pomocą dostarczonego tokena bota Discord..."
sed -i "s/TOKEN = ''/TOKEN = '$TOKEN'/" main.py

clear

echo "Zacznijmy botować"
echo "python3 main.py"
python3 main.py
