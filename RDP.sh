#! /bin/bash
printf "Cài đặt RDP Đợi 1 lát nhé! ... " >&2
{
sudo useradd -m a4fsite
sudo adduser a4fsite sudo
echo 'a4fsite:1234' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser a4fsite chrome-remote-desktop
} &> /dev/null &&
printf "\nThiết lập xong " >&2 ||
printf "\nXảy ra lỗi " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Sao chép lệnh cài đặt RDP và\n'
read -p "Dán vào đây: " CRP
su - a4fsite -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nNâng cấp hoàn tất " >&2
else
    printf "\n\nXảy ra lỗi " >&2
fi
