FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

python () {
    if 'RZ_CM33_COLDBOOT' in d.getVar('MACHINE_FEATURES').split():
        d.appendVar('EXTRA_OEMAKE', ' ENABLE_RZG3E_CM33_BOOT=1')

    if 'RZ_CM33_FIRMWARE_LOAD' in d.getVar('MACHINE_FEATURES').split():
        d.appendVar('EXTRA_OEMAKE', ' ENABLE_CM33_FIRMWARE_LOAD=1')

    if 'RZ_CA55_CPU_CLOCKUP' in d.getVar('MACHINE_FEATURES').split():
        d.appendVar('EXTRA_OEMAKE', ' ENABLE_CA55_CLOCKUP=1')
}

SRC_URI:append = " \
        file://0001-cm33coldboot-support.patch \
        file://0002-cm33-firmware-load.patch \
        file://0003-ca55-cpu-clockup.patch \
        file://0004-enable-s2r-on-cm33coldboot.patch \
        file://0005-fix-random-stuck-issue-in-ddr_retention_entry.patch \
        file://0006-add-sw_spinlock-to-sync-with-the-other-remote-core.patch \
        file://0007-fix-not-S2R_VBAT-when-apply-S2R_AWO-patch.patch \
        file://0008-fix-DDR-retention-behaviors-with-clockup-feature.patch \
"
