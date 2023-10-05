$(call inherit-product, device/linaro/dragonboard/full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/drm_hwcomposer/device.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/minigbm_msm/device.mk)
$(call inherit-product, device/linaro/dragonboard/qrd8650/device.mk)

# Target is using software rendering
TARGET_USES_SWR := true

# Product overrides
PRODUCT_NAME := qrd8650
PRODUCT_DEVICE := qrd8650
PRODUCT_BRAND := Android
