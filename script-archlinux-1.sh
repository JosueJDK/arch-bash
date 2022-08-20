echo "Actulizando teclado ES"
sleep 3
loadkeys es

echo "Indique el disco a particionar: "
sleep 3
fdisk -l
sleep 3

echo "Example (sda/sdb / sdc): "
read DISK_DEV
sleep 3

echo "Particione el disco: "
sleep 3
cfdisk /dev/$DISK_DEV

echo "Formateando unidad (/efi): "
sleep 3
mkfs.fat -F 32 /dev/${DISK_DEV}1
sleep 3

echo "Formateando unidad (/)"
sleep 3
mkfs.ext4 /dev/${DISK_DEV}3
sleep 3

echo "Formateando unidad (/swap)"
sleep 3
mkswap /dev/${DISK_DEV}2
swapon /dev/${DISK_DEV}2
sleep 3

echo "Montando (/mnt)"
mount /dev/${DISK_DEV}3 /mnt
sleep 3

echo "Creando particion /mnt/boot"
mkdir /mnt/boot
sleep 3

echo "Montando (/mnt/boot)"
mount /dev/${DISK_DEV}1 /mnt/boot
sleep 3

echo "Instalando sistema base: "
pacstrap /mnt base base-devel linux linux-firmware nano sudo networkmanager
sleep 3

echo "Configuración del sistema.."
sleep 3

echo "Fstab:"
sleep 3
genfstab -U /mnt >> /mnt/etc/fstab
sleep 3

echo "Chroot:"
sleep 3
arch-chroot /mnt
sleep 3