echo "Actulizando teclado ES"
sleep 5
loadkeys es

echo "Indique el disco a particionar: "
sleep 5
fdisk -l
sleep 5

echo "Example (sda/sdb / sdc): "
read DISK_DEV
sleep 5

echo "Particione el disco: "
sleep 5
cfdisk /dev/$DISK_DEV

echo "Formateando unidad (/efi): "
sleep 5
mkfs.fat -F 32 /dev/${DISK_DEV}1
sleep 5

echo "Formateando unidad (/)"
sleep 5
mkfs.ext4 /dev/${DISK_DEV}3
sleep 5

echo "Formateando unidad (/swap)"
sleep 5
mkswap /dev/${DISK_DEV}2
swapon /dev/${DISK_DEV}2
sleep 5

echo "Montando (/mnt)"
mount /dev/${DISK_DEV}3 /mnt
sleep 5

echo "Creando particion /mnt/boot"
mkdir /mnt/boot
sleep 5

echo "Montando (/mnt/boot)"
mount /dev/${DISK_DEV}1 /mnt/boot
sleep 5

echo "Instalando sistema base: "
pacstrap /mnt base base-devel linux linux-firmware nano sudo networkmanager
sleep 5

echo "Configuración del sistema.."
sleep 5

echo "Fstab:"
sleep 5
genfstab -U /mnt >> /mnt/etc/fstab
sleep 5

echo "Chroot:"
sleep 5
arch-chroot /mnt
sleep 5