FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
	file://0001-Add-rzg3e-smarc-multi-os-dtsi-for-supporting-OpenAMP.patch \
	file://0002-Set-GTM-as-critical-clock-to-support-RTOS.patch \
	file://0003-Change-linux-ostm-to-2-and-3.patch \
"
SRC_URI:append = "${@'file://0007-arm64-dts-renesas-r9a09g047-opp-1800000000.patch \
	' if 'RZ_CA55_CPU_CLOCKUP' in d.getVar('MACHINE_FEATURES').split() else ''}"

SRC_URI:append = "${@'file://0004-Add-rproc-node-for-CM33.patch \
	file://0005-Add-bindings.patch \
	file://0006-Add-remoteproc-driver.patch \
	' if 'RZ_REMOTEPROC' in d.getVar('MACHINE_FEATURES').split() else ''}"

SRC_URI:append = "${@'file://0008-Fix-overwrite-PD_AWO-ports-when-resume-from-S2R-if-AWO-enabled.patch \
	' if 'RZ_CM33_COLDBOOT' in d.getVar('MACHINE_FEATURES').split() else ''}"

# Kernel confguration update
SRC_URI:append = " file://uio.cfg"
SRC_URI:append = " ${@'file://remoteproc.cfg' if 'RZ_REMOTEPROC' in d.getVar('MACHINE_FEATURES').split() else ''}"
