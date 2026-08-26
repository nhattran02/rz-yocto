FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

python () {
    features = d.getVar('MACHINE_FEATURES').split()

    if 'RZ_CM33_FIRMWARE_LOAD' in features:
        d.appendVar('EXTRA_OEMAKE', ' PLAT_M33_BOOT_SUPPORT=1')
    if 'RZ_CM33_COLDBOOT' in features:
        d.appendVar('EXTRA_OEMAKE', ' ENABLE_RZG3S_CM33_COLDBOOT=1')
    if 'RZ_AWO_SUPPORT' in features:
        d.appendVar('EXTRA_FLAGS_smarc-rzg3s', ' PLAT_SYSTEM_SUSPEND=awo')
}

SRC_URI += " \
    file://0000-disable-TFA-AWO-M33boot-synchronous.patch \
    file://0001-cm33coldboot-support.patch \
"
