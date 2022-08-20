echo "Actulizando teclado ES"
loadkeys es

echo "Indique el disco a particionar: "
fdisk -l
read DISK_DEV

echo "Particione el disco: "
cfdisk /dev/$DISK_DEV

echo "Formateando unidad (/efi): "
mkfs.fat -F 32 /dev/${DISK_DEV}1

echo "Formateando unidad (/)"
mkfs.ext4 /dev/${DISK_DEV}3

echo "Formateando unidad (/swap)"
mkswap /dev/${DISK_DEV}2
swapon /dev/${DISK_DEV}2

echo "Montando (/mnt)"
mount /dev/${DISK_DEV}3 /mnt

echo "Creando particion /mnt/boot"
mkdir /mnt/boot

echo "Montando (/mnt/boot)"
mount /dev/${DISK_DEV}1 /mnt/boot

echo "Instalando sistema base: "
pacstrap /mnt base base-devel linux linux-firmware nano sudo networkmanager

echo "Configuración del sistema.."

echo "Fstab:"
genfstab -U /mnt >> /mnt/etc/fstab

echo "Chroot:"
arch-chroot /mnt