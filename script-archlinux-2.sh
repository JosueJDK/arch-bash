echo "Seleccion zona horaria:"
ln -sf /usr/share/zoneinfo/America/Panama /etc/localtime
locale-gen

echo "Agregando lenguaje: "
echo LANG=es_PE.UTF-8 > /etc/locale.conf
cat /etc/locale.conf

echo "Agregando distribucion de teclado: "
echo KEYMAP=us > /etc/vconsole.conf
cat /etc/vconsole.conf

echo "Configurando RED: "
echo arch-pc > /etc/hostname
cat /etc/hostname

echo -e "# Static table lookup for hostnames.\n# See hosts(5) for details.\n\n127.0.0.1      localhost\n::1            localhost" > /etc/hosts
cat /etc/hosts

echo "Introduce la password ROOT:"
passwd

echo "Busque #%wheel ALL=(ALL) ALL y descomentelo: "
nano /etc/sudoers

echo "Introduce tu nombre de usuario: "
read USER_NAME
useradd -mG wheel $USER_NAME

echo "Introduce tu contraseña: "
passwd $USER_NAME

echo "Introduce tu contraseña Configurando grub: "
pacman -S grub os-prober efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg