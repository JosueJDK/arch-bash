echo "Activar red: "
sleep 3
systemctl enable NetworkManager
systemctl start NetworkManager
sleep 3

echo "Instalar dependencias para entorno de escritorio: "
sleep 3
pacman -S xorg-server xorg-apps xdg-user-dirs lightdm lightdm-gtk-greeter git python-pip git alacritty firefox rofi
sleep 3
xdg-user-dirs-update
sleep 3

echo "Instalando yay"
sleep 3
git clone https://aur.archlinux.org/yay.git
sleep 3

cd yay
sleep 3
makepkg -sri
sleep 3

echo "Instalando Cambiar entorno de lightdm: "
sleep 3
yay lightdm
sleep 3

echo "Instalando qtile: "
sleep 3
sudo pacman -S qtile pacman-contrib
sleep 3
sudo pip install psutil
sleep 3

systemctl enable lightdm
sleep 3
systemctl start lightdm