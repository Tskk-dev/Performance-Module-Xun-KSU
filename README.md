# Xun Performance

A simple KernelSU performance module for devices using the Qualcomm **SM6225 (Snapdragon 680 / Khaje)** platform.

The module applies the highest available stock CPU and GPU frequencies and sets the device display to **90 Hz**. It is designed to improve performance consistency in games and other demanding applications without modifying the device's thermal protection.

## Features

* Sets CPU policies to the `performance` governor
* Applies the maximum available stock CPU frequency
* Locks the Adreno 610 GPU to its highest stock power level
* Sets the GPU frequency to **1114.8 MHz**
* Sets the display minimum and peak refresh rate to **90 Hz**
* Applies a 90 Hz preferred display mode
* Does not disable or modify thermal protection
* Designed for KernelSU

## Device

Tested on:
- Redmi Pad SE 11 (Xun)

## Installation

1. Download the latest `xun_performance.zip` release.
2. Open KernelSU.
3. Go to **Modules**.
4. Install the ZIP.
5. Reboot the device.

The module applies its settings automatically after Android finishes booting.

## Disclaimer

Use this module at your own risk. Performance settings can increase power consumption, heat, and battery drain. Although the module does not disable thermal protection, sustained high performance may still cause the device to become hot.

Made for experimentation and performance tuning on SM6225 / Khaje devices.
