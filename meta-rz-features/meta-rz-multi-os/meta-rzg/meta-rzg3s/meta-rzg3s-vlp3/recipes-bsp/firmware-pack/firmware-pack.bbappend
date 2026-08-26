DEPENDS = " \
        trusted-firmware-a u-boot \
"
DEPENDS_append = " bptool-native fiptool-native"

S = "${WORKDIR}/${BPN}-${PV}"

do_compile_append () {
	if echo "${MACHINE_FEATURES}" | grep -q "RZ_CM33_COLDBOOT"; then
		bptool ${RECIPE_SYSROOT}/boot/bl2-${MACHINE}.bin ${S}/bp.bin 0xA3000 spi
		cat ${RECIPE_SYSROOT}/boot/bl2-${MACHINE}.bin > ${S}/bl2_no_bp_spi.bin
		objcopy -I binary -O srec --adjust-vma=0xA1E00 --srec-forceS3 ${S}/bl2_no_bp_spi.bin ${S}/bl2_no_bp_spi.srec
	fi
}

do_deploy_append() {
	if echo "${MACHINE_FEATURES}" | grep -q "RZ_CM33_COLDBOOT"; then
		install -m 0644  ${S}/bl2_no_bp_spi.srec ${DEPLOYDIR}/bl2_no_bp_spi-${MACHINE}.srec
	fi
}
