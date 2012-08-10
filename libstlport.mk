# Add a couple include paths to use stlport.

ifdef LOCAL_NDK_VERSION
stlport_NDK_VERSION_ROOT := $(HISTORICAL_NDK_VERSIONS_ROOT)/$(LOCAL_NDK_VERSION)/platforms/android-$(LOCAL_SDK_VERSION)/arch-$(TARGET_ARCH)
LOCAL_C_INCLUDES := \
	$(stlport_NDK_VERSION_ROOT) \
	external/stlport/stlport \
	$(LOCAL_C_INCLUDES)

LOCAL_CFLAGS += -DBUILD_WITH_NDK=1
else
# Make sure bionic is first so we can include system headers.
LOCAL_C_INCLUDES := \
	bionic \
	external/stlport/stlport \
	$(LOCAL_C_INCLUDES)
endif
