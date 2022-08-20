echo "Activar red: "
systemctl enable NetworkManager
systemctl start NetworkManager

echo "Instalar dependencias para entorno de escritorio: "
pacman -S xorg-server xorg-apps xdg-user-dirs lightdm lightdm-gtk-greeter git python-pip git alacritty firefox rofi
xdg-user-dirs-update

echo "Instalando yay"
git clone https://aur.archlinux.org/yay.git

cd yay
makepkg -sri

echo "Instalando Cambiar entorno de lightdm: "
yay lightdm

echo "Instalando qtile: "
sudo pacman -S qtile pacman-contrib
sudo pip install psutil

systemctl enable lightdm
systemctl start lightdm