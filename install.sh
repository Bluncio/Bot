#!/bin/bash

clear

echo "🅰🅻🅼🅾🆂🆃 🅲🅻🅾🆄🅳"

echo Tạo VPS Hosting miễn phí của riêng bạn!

read -p "Bạn có chắc chắn muốn tiếp tục không? Đồng ý cho tạo hay không? (y/n): " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation aborted."
    exit 1
fi

clear

echo "Cài đặt python3-pip và docker."
sudo apt update
sudo apt install -y python3 python3-pip docker.io
echo "Cài đặt thành công"

clear

echo "Cài đặt các file cần thiết"
wget https://raw.githubusercontent.com/AlmostCloud/bot-freevps/refs/heads/main/Dockerfile1
wget https://raw.githubusercontent.com/AlmostCloud/bot-freevps/refs/heads/main/Dockerfile2
wget https://raw.githubusercontent.com/AlmostCloud/bot-freevps/refs/heads/main/main.py
echo "Cài đặt thành công"

clear

echo "Cài đặt các file vừa tải"
docker build -t ubuntu-22.04-with-tmate -f Dockerfile1 . && docker build -t debian-with-tmate -f Dockerfile2 .

clear

echo "Nhập token bot discord"
read -r TOKEN
echo "Updating main.py with the provided Discord token..."
sed -i "s/TOKEN = ''/TOKEN = '$TOKEN'/" main.py

clear

echo "Hãy bắt đầu bot thôi nào"
echo "python3 main.py"
python3 main.py
