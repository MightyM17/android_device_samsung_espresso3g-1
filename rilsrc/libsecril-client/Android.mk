# Copyright 2006 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES:= \
    secril-client.cpp

LOCAL_CFLAGS := -Wall -Werror

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libhardware_legacy

LOCAL_MODULE:= libsecril-client

include $(BUILD_SHARED_LIBRARY)
