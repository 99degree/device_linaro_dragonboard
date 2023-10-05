#
# Copyright (C) 2011 The Android Open-Source Project
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

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

include $(LOCAL_PATH)/../vendor-package-ver.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# dlkm_loader
include device/linaro/dragonboard/shared/utils/dlkm_loader/device.mk
PRODUCT_COPY_FILES += \
    device/linaro/dragonboard/shared/utils/dlkm_loader/dlkm_loader.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/dlkm_loader.rc

# Build generic Audio HAL
#PRODUCT_PACKAGES += audio.primary.qrd8650

# BootControl HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

# Set BT address
PRODUCT_PACKAGES += bdaddr

# Install bdaddr script
PRODUCT_COPY_FILES += \
    device/linaro/dragonboard/shared/utils/bdaddr/set_bdaddr.sh:$(TARGET_COPY_OUT_VENDOR)/bin/set_bdaddr.sh

# Install scripts to set vendor.* properties
PRODUCT_COPY_FILES += \
    device/linaro/dragonboard/shared/utils/set_hw.sh:$(TARGET_COPY_OUT_VENDOR)/bin/set_hw.sh \
    device/linaro/dragonboard/shared/utils/set_udc.sh:$(TARGET_COPY_OUT_VENDOR)/bin/set_udc.sh

# Install scripts to set Ethernet MAC address
PRODUCT_COPY_FILES += \
    device/linaro/dragonboard/shared/utils/ethaddr/ethaddr.rc:/system/etc/init/ethaddr.rc \
    device/linaro/dragonboard/shared/utils/ethaddr/set_ethaddr.sh:/system/bin/set_ethaddr.sh

PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.manufacturer=Qualcomm \
    ro.soc.model=SM8650

PRODUCT_VENDOR_PROPERTIES += \
    vendor.minigbm.debug=nocompression

# TODO(b/65201432): Swiftshader needs to create executable memory.
PRODUCT_REQUIRES_INSECURE_EXECMEM_FOR_SWIFTSHADER := true

# ANGLE provides an OpenGL implementation built on top of Vulkan.
PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.egl=angle \
    debug.hwui.renderer=skiagl \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=400 \
    ro.opengles.version=196608

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2022-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml

# Vulkan
TARGET_VULKAN_SUPPORT := true
TARGET_USES_VULKAN := true

PRODUCT_PACKAGES += vulkan.pastel

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.vulkan=pastel

# Copy firmware files
$(call inherit-product-if-exists, vendor/linaro/qrd8650/device.mk)

TARGET_DTB := sm8650-qrd.dtb
TARGET_HARDWARE := qrd8650
TARGET_KERNEL_USE ?= 6.6

include device/linaro/dragonboard/device-common.mk

PRODUCT_COPY_FILES += $(TARGET_KERNEL_DIR)/sm8650-qrd.dtb:dtb.img
