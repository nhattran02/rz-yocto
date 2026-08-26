FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://0001-disable-reserved-area-check.patch \
    file://0002-raise-config-lmb-max-region-to-16.patch \
"
