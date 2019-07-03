#
# Copyright (C) 2019 The Android Open-Source Project
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

TARGET_CHIPSET := sdm710

LOCAL_PATH := device/google/sarbon

# A/B support
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier

PRODUCT_PACKAGES += \
    bootctrl.sdm710

AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vbmeta \
    dtbo

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm710 \
    libgptutils \
    libz \
    libcutils

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \

PRODUCT_COPY_FILES += \
    device/google/sarbon/recovery/root/init.recovery.hardware.rc:recovery/root/init.recovery.hardware.rc \
    device/google/sarbon/recovery/root/init.recovery.usb.rc:recovery/root/init.recovery.usb.rc \
    device/google/sarbon/recovery/root/plat_hwservice_contexts:recovery/root/plat_hwservice_contexts \
    device/google/sarbon/recovery/root/plat_service_contexts:recovery/root/plat_service_contexts \
    device/google/sarbon/recovery/root/vendor_hwservice_contexts:recovery/root/vendor_hwservice_contexts \
    device/google/sarbon/recovery/root/vndservice_contexts:recovery/root/vndservice_contexts \
    device/google/sarbon/recovery/root/etc/twrp.fstab:recovery/root/etc/twrp.fstab \
    device/google/sarbon/recovery/root/etc/update-payload-key.pub.pem:recovery/root/etc/update-payload-key.pub.pem \
    device/google/sarbon/recovery/root/sbin/android.hardware.boot@1.0-service:recovery/root/sbin/android.hardware.boot@1.0-service \
    device/google/sarbon/recovery/root/sbin/android.hardware.confirmationui@1.0.so:recovery/root/sbin/android.hardware.confirmationui@1.0.so \
    device/google/sarbon/recovery/root/sbin/android.hardware.keymaster@4.0-service-qti:recovery/root/sbin/android.hardware.keymaster@4.0-service-qti \
    device/google/sarbon/recovery/root/sbin/android.hardware.weaver@1.0.so:recovery/root/sbin/android.hardware.weaver@1.0.so \
    device/google/sarbon/recovery/root/sbin/android.hardware.weaver@1.0-service.citadel:recovery/root/sbin/android.hardware.weaver@1.0-service.citadel \
    device/google/sarbon/recovery/root/sbin/citadeld:recovery/root/sbin/citadeld \
    device/google/sarbon/recovery/root/sbin/ld.config.txt:recovery/root/sbin/ld.config.txt \
    device/google/sarbon/recovery/root/sbin/libdiag.so:recovery/root/sbin/libdiag.so \
    device/google/sarbon/recovery/root/sbin/libdrmfs.so:recovery/root/sbin/libdrmfs.so \
    device/google/sarbon/recovery/root/sbin/libdrmtime.so:recovery/root/sbin/libdrmtime.so \
    device/google/sarbon/recovery/root/sbin/libgptutils.so:recovery/root/sbin/libgptutils.so \
    device/google/sarbon/recovery/root/sbin/libicuuc.so:recovery/root/sbin/libicuuc.so \
    device/google/sarbon/recovery/root/sbin/libion.so:recovery/root/sbin/libion.so \
    device/google/sarbon/recovery/root/sbin/libprotobuf-cpp-full.so:recovery/root/sbin/libprotobuf-cpp-full.so \
    device/google/sarbon/recovery/root/sbin/libQSEEComAPI.so:recovery/root/sbin/libQSEEComAPI.so \
    device/google/sarbon/recovery/root/sbin/librpmb.so:recovery/root/sbin/librpmb.so \
    device/google/sarbon/recovery/root/sbin/libsecureui.so:recovery/root/sbin/libsecureui.so \
    device/google/sarbon/recovery/root/sbin/libssd.so:recovery/root/sbin/libssd.so \
    device/google/sarbon/recovery/root/sbin/libtime_genoff.so:recovery/root/sbin/libtime_genoff.so \
    device/google/sarbon/recovery/root/sbin/libxml2.so:recovery/root/sbin/libxml2.so \
    device/google/sarbon/recovery/root/sbin/prepdecrypt.sh:recovery/root/sbin/prepdecrypt.sh \
    device/google/sarbon/recovery/root/sbin/qseecomd:recovery/root/sbin/qseecomd \
    device/google/sarbon/recovery/root/sbin/update_engine_sideload:recovery/root/sbin/update_engine_sideload \
    device/google/sarbon/recovery/root/sbin/vndservicemanager:recovery/root/sbin/vndservicemanager \
    device/google/sarbon/recovery/root/system/etc/vintf/manifest.xml:recovery/root/manifest.xml \
    device/google/sarbon/recovery/root/vendor/compatibility_matrix.1.xml:recovery/root/vendor/compatibility_matrix.1.xml \
    device/google/sarbon/recovery/root/vendor/compatibility_matrix.2.xml:recovery/root/vendor/compatibility_matrix.2.xml \
    device/google/sarbon/recovery/root/vendor/compatibility_matrix.3.xml:recovery/root/vendor/compatibility_matrix.3.xml \
    device/google/sarbon/recovery/root/vendor/compatibility_matrix.device.xml:recovery/root/vendor/compatibility_matrix.device.xml \
    device/google/sarbon/recovery/root/vendor/compatibility_matrix.legacy.xml:recovery/root/vendor/compatibility_matrix.legacy.xml \
    device/google/sarbon/recovery/root/vendor/compatibility_matrix.xml:recovery/root/vendor/compatibility_matrix.xml \
    device/google/sarbon/recovery/root/vendor/etc/vintf/compatibility_matrix.xml:recovery/root/vendor/etc/vintf/compatibility_matrix.xml \
    device/google/sarbon/recovery/root/vendor/etc/vintf/manifest.xml:recovery/root/vendor/etc/vintf/manifest.xml \
    device/google/sarbon/recovery/root/vendor/lib64/android.hardware.weaver@1.0-impl.nos.so:recovery/root/vendor/lib64/android.hardware.weaver@1.0-impl.nos.so \
    device/google/sarbon/recovery/root/vendor/lib64/libkeymasterdeviceutils.so:recovery/root/vendor/lib64/libkeymasterdeviceutils.so \
    device/google/sarbon/recovery/root/vendor/lib64/libkeymasterutils.so:recovery/root/vendor/lib64/libkeymasterutils.so \
    device/google/sarbon/recovery/root/vendor/lib64/libnos.so:recovery/root/vendor/lib64/libnos.so \
    device/google/sarbon/recovery/root/vendor/lib64/libnos_citadeld_proxy.so:recovery/root/vendor/lib64/libnos_citadeld_proxy.so \
    device/google/sarbon/recovery/root/vendor/lib64/libnos_client_citadel.so:recovery/root/vendor/lib64/libnos_client_citadel.so \
    device/google/sarbon/recovery/root/vendor/lib64/libnos_datagram.so:recovery/root/vendor/lib64/libnos_datagram.so \
    device/google/sarbon/recovery/root/vendor/lib64/libnos_datagram_citadel.so:recovery/root/vendor/lib64/libnos_datagram_citadel.so \
    device/google/sarbon/recovery/root/vendor/lib64/libnosprotos.so:recovery/root/vendor/lib64/libnosprotos.so \
    device/google/sarbon/recovery/root/vendor/lib64/libnos_transport.so:recovery/root/vendor/lib64/libnos_transport.so \
    device/google/sarbon/recovery/root/vendor/lib64/libqtikeymaster4.so:recovery/root/vendor/lib64/libqtikeymaster4.so \
    device/google/sarbon/recovery/root/vendor/lib64/nos_app_weaver.so:recovery/root/vendor/lib64/nos_app_weaver.so \
    device/google/sarbon/recovery/root/vendor/lib64/hw/android.hardware.boot@1.0-impl.so:recovery/root/vendor/lib64/hw/android.hardware.boot@1.0-impl.so \
    device/google/sarbon/recovery/root/vendor/lib64/hw/bootctrl.sdm710.so:recovery/root/vendor/lib64/hw/bootctrl.sdm710.so
