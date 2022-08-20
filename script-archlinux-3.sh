echo "Activar red: "
sleep 5
systemctl enable NetworkManager
systemctl start NetworkManager
sleep 5

echo "Instalar dependencias para entorno de escritorio: "
sleep 5
pacman -S xorg-server xorg-apps xdg-user-dirs lightdm lightdm-gtk-greeter git python-pip git alacritty firefox rofi
sleep 5
xdg-user-dirs-update
sleep 5

echo "Instalando yay"
sleep 5
git clone https://aur.archlinux.org/yay.git
sleep 5

cd yay
sleep 5
makepkg -sri
sleep 5

echo "Instalando Cambiar entorno de lightdm: "
sleep 5
yay lightdm
sleep 5

echo "Instalando qtile: "
sleep 5
sudo pacman -S qtile pacman-contrib
sleep 5
sudo pip install psutil
sleep 5

systemctl enable lightdm
sleep 5
systemctl start lightdm