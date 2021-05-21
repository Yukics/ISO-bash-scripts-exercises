#/bin/bash
#El tipo de usuario que debe ejecutar este script debe ser admin
df | grep -E '((/dev/sd)|(/dev/nvme))' | sed 's/|/ /' | awk '{print $1}' > devices.mounted
sudo parted /dev/sda
lsblk | grep disk