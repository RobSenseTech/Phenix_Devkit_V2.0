Phenix Devkit Firmware V2.0

The Phenix is an intelligent control, computing and networking platform for unmanned systems. It integrates a Xilinx Zynq SoC, which packaging a dual core ARM Cortex-A9 CPU and FPGA fabric on a signal chip.

Attitude estimation, flight control, navigation are implemented by ArduPilot flight control stack([http://ardupilot.org]. So far, it only support quadcopter, we call it flying robot.

* The codebase is hosting on github: [https://github.com/RobSenseTech/PhenixPro_Devkit_V2.0.git]
* The developers' guide is presenting on: [https://guide.robsense.com/]
* and hosting on github: [https://github.com/RobSenseTech/PhenixPro-DevKit-Guide.git], so developers can contribute to edit and push modifications.
* Developers can push questions to DevKit user forum at: [http://dev.robsense.com]

Next will show you a simple way to build software for PhenixPro Devkit V2.0

* u-boot

Get u-boot source code from github:
git clone https://github.com/RobSenseTech/PhenixPro_Devkit_V2.0
cd PhenixPro_Devkit_V2.0/uboot-xlnx

Make the configuration effective:
make phenixpro_devkit_config

Complie u-booot:
make ARCH=arm CROSS_COMPILE=arm-xilinx-linux-gnueabi- -j8
Last step, rename u-boot to u-boot.elf.And you can use it to create BOOT.bin by SDK.

* Linux Kernel

Enter the linux kernel directory:
cd PhenixPro_Devkit_V2.0/linux-xlnx-4.9

Compile kernel:
cp arch/arm/boot/phenixpro-devkit-config/devkit-config .config

make ARCH=arm CROSS_COMPILE=arm-xilinx-linux-gnueabi- menuconfig
  Device Drivers  --->
    [*]Pulse-Width Modulation (PWM) Support  --->
    <*>   Xilinx PWM support

make ARCH=arm UIMAGE_LOADADDR=0x8000 CROSS_COMPILE=arm-xilinx-linux-gnueabi- uImage -j8

Linux Devicetree
Generate dtb file with command
cd PhenixPro_Devkit_V2.0/linux-xlnx-4.9
./mkdtb.sh

Linux Filesystem
Get Linux Filesystem from github:
https://github.com/RobSenseTech/PhenixPro_Devkit_Platform

generate Linux Filesystem with command
cd PhenixPro_Devkit_Platform/filesystem/ramdisk/
./mkramfs.sh rootfs
