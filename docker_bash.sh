#!/bin/bash

# Docker'ı sil
if command -v docker &> /dev/null; then
    echo "Docker kaldiriliyor."
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
    echo "Docker Kaldirildi."
fi

# Docker'ı yeniden yükle
echo "Docker yeniden kuruluyor..."
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "Docker başariyla kuruldu."

# Sudo yetkisi verir
sudo usermod -aG docker $USER

echo "Docker kullanicisi gruplara eklendi. Değişikliklerin geçerli olmasi için lütfen oturumu kapatip tekrar açin."

#docker test 'hello word' container

sleep 2
read -p 'Docker kurulumunu test etmek ister misiniz? E / H ' installingResult
if [[ $installingResult == "E"  ||  $installingResult == "e" ]]
then
    echo -e "\n######" DOCKER  test ediliyor "######"
    sudo docker run hello-world
    echo -e "\n######" DOCKER test basarili. "######"
else
    echo -e "\n######" DOCKER  test edilmedi. "######"
fi

sleep 3
echo -e "\n######  BİTTİ ######"
