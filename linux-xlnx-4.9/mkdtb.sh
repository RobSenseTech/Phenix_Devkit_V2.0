#!/bin/bash
DTS_NAME=phenixpro-devkit.dts   #zynq-zed.dts #zynq-zybo.dts 
./scripts/dtc/dtc -I dts -O dtb -o arch/arm/boot/devicetree.dtb arch/arm/boot/dts/$DTS_NAME
