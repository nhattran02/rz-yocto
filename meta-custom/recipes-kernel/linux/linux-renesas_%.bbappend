FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

KERNEL_URL = "git://git@gitlab.com/linux820939/linux-cip.git"
KERNEL_BRANCH = "g3s/rz-6.12-cip14_dev_after_merge"
KERNEL_REV = "3ad89c6f2b26c9b39ba42baf45ba9aa82695db79"

SRC_URI = "${KERNEL_URL};protocol=ssh;branch=${KERNEL_BRANCH}"
SRC_URI += "file://devtool-fragment.cfg \
            file://0001-iio-pressure-add-BMP280-driver-and-enable-it-on-RZ-G.patch"

