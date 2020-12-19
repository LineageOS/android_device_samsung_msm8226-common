#!/bin/bash
#
<<<<<<< HEAD
# Copyright (C) 2017-2018 The LineageOS Project
=======
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
>>>>>>> 525d9f4c... pro1: Switch to standalone extract utils
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

<<<<<<< HEAD

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

# Override anything that may come from the calling environment
CM_ROOT="$MY_DIR"/../../..
BOARD=msm8226
DEVICE_COMMON=${BOARD}-common
INITIAL_COPYRIGHT_YEAR=2017
VENDOR=samsung

HELPER="$CM_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
=======
export DEVICE=pro1
export VENDOR=fxtec

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
>>>>>>> 525d9f4c... pro1: Switch to standalone extract utils
    exit 1
fi
. "$HELPER"

<<<<<<< HEAD
# Initialize the helper for common device
setup_vendor "$DEVICE_COMMON" "$VENDOR" "$CM_ROOT" true

# Copyright headers
write_headers $BOARD TARGET_BOARD_PLATFORM
=======
# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false

# Warning headers and guards
write_headers "pro1"
>>>>>>> 525d9f4c... pro1: Switch to standalone extract utils

write_makefiles "$MY_DIR"/common-proprietary-files.txt

write_footers
