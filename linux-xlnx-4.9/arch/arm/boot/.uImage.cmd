cmd_arch/arm/boot/uImage := /bin/bash ./scripts/mkuboot.sh -A arm -O linux -C none  -T kernel -a 0x8000 -e 0x8000 -n 'Linux-4.9.0-xilinx-gc0e3380-dirty' -d arch/arm/boot/zImage arch/arm/boot/uImage
