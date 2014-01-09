# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false
#BOARD_USE_YUV422I_DEFAULT_COLORFORMAT := true

# inherit from the proprietary version
-include vendor/motorola/shadow/BoardConfigVendor.mk

# use pre-kernel.35 vold usb mounting
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_USE_FROYO_LIBCAMERA := true

# use charge_counter for battery
BOARD_USE_BATTERY_CHARGE_COUNTER := true

TARGET_ARCH := arm

TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := false
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a8
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIANT_FPU := neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8
ARCH_ARM_HAVE_TLS_REGISTER := false

# Conserve memory in the Dalvik heap
# Details: https://github.com/CyanogenMod/android_dalvik/commit/15726c81059b74bf2352db29a3decfc4ea9c1428
TARGET_ARCH_LOWMEM := true
TARGET_ARCH_HAVE_NEON := true

# this is so that we build the Shadow-specific hardware shit
BOARD_GLOBAL_CFLAGS += -DSHADOW_HARDWARE
SHADOW_HARDWARE := true

TARGET_NO_BOOTLOADER := false
TARGET_BOOTLOADER_BOARD_NAME := shadow

# Wifi related defines
USES_TI_MAC80211 := true
COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_wl12xx
PRODUCT_WIRELESS_TOOLS := true
BOARD_WLAN_DEVICE := wl12xx_mac80211
BOARD_SOFTAP_DEVICE := wl12xx_mac80211
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wl12xx_sdio.ko"
WIFI_DRIVER_MODULE_NAME := "wl12xx_sdio"

BOARD_USES_GENERIC_AUDIO := false

BOARD_KERNEL_CMDLINE := console=ttyS2,115200n8 rw mem=498M@0x80C00000 init=/init ip=off motobldlabel=none mmcparts=mmcblk1:p1(mbmloader),p2(mbm),p3(mbmbackup),p4(ebr),p5(bploader),p6(cdt.bin),p7(pds),p8(lbl),p9(lbl_backup),p10(logo.bin),p11(sp),p12(devtree),p13(devtree_backup),p14(bpsw),p15(boot),p16(recovery),p17(cdrom),p18(misc),p19(cid),p20(kpanic),p21(system),p22(cache),p23(preinstall),p24(userdata)
BOARD_KERNEL_BASE := 0x10000000

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_IT := true

BOARD_EGL_CFG := device/motorola/shadow/egl.cfg

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x003fffff
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x004fffff
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0bdfffff   # limited so we enforce room to grow
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

#TARGET_RECOVERY_UI_LIB := librecovery_ui_shadow librecovery_ui_generic

#TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_generic

TARGET_PREBUILT_KERNEL := device/motorola/shadow/kernel

#TARGET_NO_RECOVERY := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/shadow/kernel

HARDWARE_OMX := true

ifndef SHADOW_DEV_PHONE
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/motorola/shadow/releasetools/shadow_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := device/motorola/shadow/releasetools/shadow_img_from_target_files

#BOARD_HIJACK_LOG_ENABLE := true

# shadow requires the common boot hijack
TARGET_NEEDS_MOTOROLA_HIJACK := true

TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /data/.recovery_mode; sync;"
TARGET_RECOVERY_PRE_COMMAND_CLEAR_REASON := true
endif

BOARD_ALWAYS_INSECURE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_MKE2FS := device/motorola/shadow/mke2fs
BOARD_HAS_SMALL_RECOVERY := true
