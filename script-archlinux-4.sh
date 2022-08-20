echo "Clonando Qtile"
sleep 3
git clone https://github.com/JosueJDK/qtile_theme.git
sleep 3
mv qtile_theme qtile
sleep 3
cp -r qtile ~/.config
sleep 3

echo "Instalando Dependencias: "
sleep 3
sudo pacman -S pulseaudio pavucontrol udiskie ntfs-3g glib2 gvfs picom lxappearance nitrogen feh ranger neovim 
sleep 3

echo "Instalando pycritty"
sleep 3
yay -S pycritty
sleep 3

echo "Configurando terminal"
sleep 3
pycritty -o 0.0
sleep 3
pycritty -f Caskaydia
sleep 3

echo "Instalacion completada!"
