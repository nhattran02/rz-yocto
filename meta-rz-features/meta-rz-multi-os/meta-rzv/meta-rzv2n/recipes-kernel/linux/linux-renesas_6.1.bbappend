FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

ENABLE_REMOTEPROC = "${@'1' if 'RZ_REMOTEPROC' in d.getVar('MACHINE_FEATURES').split() else '0'}"

SRC_URI:append = " \
	file://0000-change-ostm-using-for-Linux.patch \
	file://0001-Add-r9a09g056n44-evk-multi-os-dtsi-suppoting-OpenAMP.patch \
	file://0002-Set-OSTM-for-MCPU-and-RCPU.patch \
	file://0007-Fix-overwrite-PD_AWO-ports-when-resume-from-S2R-if-AWO-enabled.patch \
"

SRC_URI:append = "${@'file://0003-arm64-dts-renesas-rzv2n-evk-Add-rproc-node.patch \
	file://0004-Add-bindings-for-RZ-remoteproc-driver.patch \
	file://0005-Add-RZ-remoteproc-driver.patch' if d.getVar('ENABLE_REMOTEPROC') == '1' else ''}"

SRC_URI:append = "${@'file://0006-arm64-dts-renesas-r9a09g056-opp-1800000000.patch \
	' if 'RZ_CA55_CPU_CLOCKUP' in d.getVar('MACHINE_FEATURES').split() else ''}"

# Kernel confguration update
SRC_URI:append = " file://uio.cfg"
SRC_URI:append = " ${@'file://remoteproc.cfg' if d.getVar('ENABLE_REMOTEPROC') == '1' else ''}"
