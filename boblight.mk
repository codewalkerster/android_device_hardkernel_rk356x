#
# Copyright (c) 2023 Hardkernel
#
PRODUCT_PACKAGES += \
    libboblight \
    boblightd \
    boblight.conf \
    ws2801.conf

PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/files/boblight:$(TARGET_COPY_OUT_VENDOR)/bin/boblight
