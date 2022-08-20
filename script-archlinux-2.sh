echo "Seleccion zona horaria:"
sleep 5
ln -sf /usr/share/zoneinfo/America/Panama /etc/localtime
sleep 5
locale-gen
sleep 5

echo "Agregando lenguaje: "
sleep 5

echo LANG=es_PE.UTF-8 > /etc/locale.conf
sleep 5
cat /etc/locale.conf
sleep 5

echo "Agregando distribucion de teclado: "
sleep 5
echo KEYMAP=us > /etc/vconsole.conf
sleep 5
cat /etc/vconsole.conf
sleep 5

echo "Configurando RED: "
sleep 5
echo arch-pc > /etc/hostname
sleep 5
cat /etc/hostname
sleep 5

echo -e "# Static table lookup for hostnames.\n# See hosts(5) for details.\n\n127.0.0.1      localhost\n::1            localhost" > /etc/hosts
sleep 5
cat /etc/hosts
sleep 5

echo "Introduce la password ROOT:"
sleep 5
passwd
sleep 5

echo "Busque #%wheel ALL=(ALL) ALL y descomentelo: "
sleep 5
nano /etc/sudoers
sleep 5

echo "Introduce tu nombre de usuario: "
sleep 5
read USER_NAME
useradd -mG wheel $USER_NAME
sleep 5

echo "Introduce tu contraseña: "
sleep 5
passwd $USER_NAME
sleep 5

echo "Introduce tu contraseña Configurando grub: "
sleep 5
pacman -S grub os-prober efibootmgr
sleep 5
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
sleep 5
grub-mkconfig -o /boot/grub/grub.cfg
sleep 5