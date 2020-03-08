
LOCAL_PATH := device/motorola/doha

# define hardware platform
PRODUCT_PLATFORM := trinket

#TEST
# A/B support
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    bootctrl.trinket

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.trinket \
    libgptutils \
    libz \
    libcutils


# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service
