include device/linaro/dragonboard/BoardConfigCommon.mk

# Primary Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_VARIANT := kryo385
TARGET_CPU_ABI := arm64-v8a

# Secondary Arch
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_VARIANT := kryo385
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi

# Board Information
TARGET_BOOTLOADER_BOARD_NAME := rb5
TARGET_BOARD_PLATFORM := rb5

TARGET_NO_KERNEL := false
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096

BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_CMDLINE := earlycon firmware_class.path=/vendor/firmware/
BOARD_KERNEL_CMDLINE += init=/init printk.devkmsg=on
BOARD_KERNEL_CMDLINE += pcie_pme=nomsi #For WiFi to work
BOARD_KERNEL_CMDLINE += deferred_probe_timeout=30
BOARD_KERNEL_CMDLINE += qcom_geni_serial.con_enabled=1
BOARD_KERNEL_CMDLINE += console=ttyMSM0
BOARD_BOOTCONFIG += androidboot.hardware=rb5 androidboot.boot_devices=soc@0/1d84000.ufshc
BOARD_BOOTCONFIG += androidboot.verifiedbootstate=orange

# Image Configuration
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296 #96M
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296 #96M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 21474836480
BOARD_FLASH_BLOCK_SIZE := 131072

# Super/Dynamic partition
BOARD_SUPER_PARTITION_SIZE := 12437225472
BOARD_DB_DYNAMIC_PARTITIONS_SIZE := 12433031168 # Reserve 4M for DAP metadata
BOARD_SUPER_PARTITION_METADATA_DEVICE := super
BOARD_SUPER_IMAGE_IN_UPDATE_PACKAGE := true
# dlkm partition
include device/linaro/dragonboard/shared/utils/dlkm_loader/BoardConfig.mk
BOARD_SEPOLICY_DIRS += device/linaro/dragonboard/shared/utils/dlkm_loader/sepolicy/

# Graphics
include device/linaro/dragonboard/shared/graphics/drm_hwcomposer/BoardConfig.mk
include device/linaro/dragonboard/shared/graphics/mesa/BoardConfig.mk
BOARD_SEPOLICY_DIRS += device/linaro/dragonboard/shared/graphics/minigbm_msm/sepolicy/
