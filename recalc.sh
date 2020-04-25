rawdisk="RDE-Ubuntu-18.04-Azure.img"
vhddisk="RDE-Ubuntu-18.04-Azure.vhd"

MB=$((1024*1024))
size=$(qemu-img info -f raw --output json "$rawdisk" | \
gawk 'match($0, /"virtual-size": ([0-9]+),/, val) {print val[1]}')

rounded_size=$(((($size+$MB-1)/$MB)*$MB))

echo "Rounded Size = $rounded_size"

qemu-img resize -f raw RDE-Ubuntu-18.04-Azure.img $rounded_size
