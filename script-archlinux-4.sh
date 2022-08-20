echo "Clonando Qtile"
git clone https://github.com/JosueJDK/qtile_theme.git
mv qtile_theme qtile
cp -r qtile ~/.config

echo "Instalando Dependencias: "
sudo pacman -S pulseaudio pavucontrol udiskie ntfs-3g glib2 gvfs picom lxappearance nitrogen feh ranger neovim 

echo "Instalando pycritty"
yay -S pycritty

echo "Configurando terminal"
pycritty -o 0.0
pycritty -f Caskaydia

