#!/bin/bash
#
# Copyright (C) 2018-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
    vendor/lib/hw/audio.primary.sdm845.so)
        patchelf --replace-needed "libcutils.so" "libprocessgroup.so" "${2}"
        ;;
    vendor/lib64/hw/audio.primary.sdm845.so)
        patchelf --replace-needed "libcutils.so" "libprocessgroup.so" "${2}"
        ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=nx619j
export DEVICE_COMMON=sdm845-common
export VENDOR=nubia

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
