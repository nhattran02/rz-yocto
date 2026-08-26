FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

python () {
    if 'RZ_CM33_COLDBOOT' in d.getVar('MACHINE_FEATURES').split():
        d.appendVar('EXTRA_OEMAKE', ' ENABLE_RZV2H_CM33_BOOT=1')
        
    if 'RZ_SRAM_REGION_ACCESS' in d.getVar('MACHINE_FEATURES').split():
        d.appendVar('EXTRA_OEMAKE', ' ENABLE_SRAM_REGION_ACCESS_MCPU=1')
        
    if 'RZ_CM33_FIRMWARE_LOAD' in d.getVar('MACHINE_FEATURES').split():
        d.appendVar('EXTRA_OEMAKE', ' ENABLE_CM33_FIRMWARE_LOAD=1')
        
    if 'RZ_CA55_CPU_CLOCKUP' in d.getVar('MACHINE_FEATURES').split():
        d.appendVar('EXTRA_OEMAKE', ' ENABLE_CA55_CLOCKUP=1')
}

SRC_URI:append = " \
    file://0001-Change-MCPU-sram-to-unpriv.patch \
    file://0002-cm33boot-suppot.patch \
    file://0003-cm33-firmware-load.patch \
    file://0004-ca55-cpu-clockup.patch \
"
