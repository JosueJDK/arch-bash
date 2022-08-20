echo "Seleccion zona horaria:"
sleep 3
ln -sf /usr/share/zoneinfo/America/Panama /etc/localtime
sleep 3
locale-gen
sleep 3

echo "Agregando lenguaje: "
sleep 3

echo LANG=es_PE.UTF-8 > /etc/locale.conf
sleep 3
cat /etc/locale.conf
sleep 3

echo "Agregando distribucion de teclado: "
sleep 3
echo KEYMAP=us > /etc/vconsole.conf
sleep 3
cat /etc/vconsole.conf
sleep 3

echo "Configurando RED: "
sleep 3
echo arch-pc > /etc/hostname
sleep 3
cat /etc/hostname
sleep 3

echo -e "# Static table lookup for hostnames.\n# See hosts(5) for details.\n\n127.0.0.1      localhost\n::1            localhost" > /etc/hosts
sleep 3
cat /etc/hosts
sleep 3

echo "Introduce la password ROOT:"
sleep 3
passwd
sleep 3

echo "Busque #%wheel ALL=(ALL) ALL y descomentelo: "
sleep 3
nano /etc/sudoers
sleep 3

echo "Introduce tu nombre de usuario: "
sleep 3
read USER_NAME
useradd -mG wheel $USER_NAME
sleep 3

echo "Introduce tu contraseña: "
sleep 3
passwd $USER_NAME
sleep 3

echo "Introduce tu contraseña Configurando grub: "
sleep 3
pacman -S grub os-prober efibootmgr
sleep 3
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
sleep 3
grub-mkconfig -o /boot/grub/grub.cfg
sleep 3