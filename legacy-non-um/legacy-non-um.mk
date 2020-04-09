ifeq ($(TARGET_USES_QCOM_LEGACY_NON_UM_SEPOLICY),true)

# Board specific SELinux policy variable definitions
ifneq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_SEPOLICY_DIRS += \
    device/qcom/sepolicy/legacy-non-um/common \
    device/qcom/sepolicy/legacy-non-um/ssg \
    device/qcom/sepolicy/legacy-non-um/$(TARGET_BOARD_PLATFORM)

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
BOARD_SEPOLICY_DIRS += \
    device/qcom/sepolicy/legacy-non-um/test
endif # Userdebug or Eng
endif # !PREBUILT_VENDOR_SEPOLICY

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/qcom/sepolicy/legacy-non-um/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/qcom/sepolicy/legacy-non-um/private

# Board specific SELinux policy variable definitions for legacy devices
ifneq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_SEPOLICY_DIRS += \
    device/qcom/sepolicy/legacy-non-um/legacy-common
endif

# Add sepolicy version to support OS upgrade and backward compatibility
BOARD_SEPOLICY_VERS := $(PLATFORM_SDK_VERSION).0

endif
