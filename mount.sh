vgcreate CacheDisk /dev/disk/by-id/ata-GIGABYTE_i-RAM*
# 2GB for browser caches
lvcreate --name firefoxCache --size 2G --stripes 2 CacheDisk
lvcreate --name chromeCache --size 2G --stripes 2 CacheDisk
lvcreate --name chromiumCache --size 2G --stripes 2 CacheDisk
# all that's left for home cache
lvcreate --name homeCache --extents 100%FREE --stripes 2 CacheDisk

mkfs.ext4 -v /dev/CacheDisk/firefoxCache
mkfs.ext4 -v /dev/CacheDisk/chromeCache
mkfs.ext4 -v /dev/CacheDisk/chromiumCache
mkfs.ext4 -v /dev/CacheDisk/homeCache

mount --bind /dev/CacheDisk/firefoxCache /home/yan/.mozilla/firefox/
mount --bind /dev/CacheDisk/chromeCache /home/yan/.cache/chromium/
mount --bind /dev/CacheDisk/chromiumCache /home/yan/.cache/google-chrome/
mount --bind /dev/CacheDisk/homeCache /home/yan/.cache/

