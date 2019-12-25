#include $(all-subdir-makefiles)

LOCAL_PATH := $(call my-dir)

#ifeq ($(BOARD_GPS_LIBRARIES), libgps)

#ifneq ($(TARGET_PRODUCT),sim)
# HAL module implemenation, not prelinked and stored in
# # hw/<GPS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false
#LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
#LOCAL_MODULE_RELATIVE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
#LOCAL_MULTILIB := both
LOCAL_MODULE_RELATIVE_PATH := hw
#LOCAL_MULTILIB := TARGET_PREFER_64_BIT
LOCAL_CFLAGS := -DHAVE_GPS_HARDWARE
LOCAL_SHARED_LIBRARIES := liblog libcutils libhardware libc libutils

LOCAL_MODULE := gps.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := debug eng optional

LOCAL_SRC_FILES := gps_zkw.c
include $(BUILD_SHARED_LIBRARY)
#endif
#adb push  $(TARGET_OUT_SHARED_LIBRARIES)/hw/gps.default /system/lib/hw/
#endif
