include device/linaro/dragonboard/BoardConfigCommon.mk

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv9-a
TARGET_CPU_VARIANT := kryo385
TARGET_CPU_ABI := arm64-v8a

# Board Information
TARGET_BOOTLOADER_BOARD_NAME := qrd8650
TARGET_BOARD_PLATFORM := qrd8650

TARGET_NO_KERNEL := false
BOARD_BOOT_HEADER_VERSION := 3
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE += earlycon clk_ignore_unused pd_ignore_unused
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware/
BOARD_KERNEL_CMDLINE += init=/init printk.devkmsg=on
BOARD_KERNEL_CMDLINE += deferred_probe_timeout=30
BOARD_KERNEL_CMDLINE += qcom_geni_serial.con_enabled=1
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += androidboot.hardware=qrd8650 androidboot.boot_devices=soc@0/1d84000.ufs
BOARD_KERNEL_CMDLINE += androidboot.verifiedbootstate=orange --

# Image Configuration
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296 #96M
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296 #96M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 21474836480 #20G
BOARD_FLASH_BLOCK_SIZE := 4096
# Super partition
BOARD_SUPER_PARTITION_SIZE := 6218612736
BOARD_DB_DYNAMIC_PARTITIONS_SIZE := 6214418432 # Reserve 4M for DAP metadata
BOARD_SUPER_PARTITION_METADATA_DEVICE := super
BOARD_SUPER_IMAGE_IN_UPDATE_PACKAGE := true
# dlkm partition
include device/linaro/dragonboard/shared/utils/dlkm_loader/BoardConfig.mk
BOARD_SEPOLICY_DIRS += device/linaro/dragonboard/shared/utils/dlkm_loader/sepolicy/

# Graphics
include device/linaro/dragonboard/shared/graphics/drm_hwcomposer/BoardConfig.mk
BOARD_SEPOLICY_DIRS += \
    device/linaro/dragonboard/shared/graphics/minigbm_msm/sepolicy \
    device/linaro/dragonboard/shared/graphics/swangle/sepolicy
