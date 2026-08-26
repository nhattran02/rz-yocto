FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

ENABLE_REMOTEPROC = "${@'1' if 'RZ_REMOTEPROC' in d.getVar('MACHINE_FEATURES').split() else '0'}"
ENABLE_CA55_CLOCKUP = "${@'1' if 'RZ_CA55_CPU_CLOCKUP' in d.getVar('MACHINE_FEATURES').split() else '0'}"

#List of kernel patches
SRC_URI:append = " \
        file://0001-Add-r9a09g057h4-evk-multi-os-dtsi-for-supporting-OPE.patch \
        file://0002-Updated-GTM-channels-to-support-RTOS.patch \
"

SRC_URI:append = " ${@'file://0003-Add-remoteproc-node.patch \
	file://0004-Add-bindings.patch \
	file://0005-Add-remoteproc-driver.patch' if d.getVar('ENABLE_REMOTEPROC') == '1' else ''}"

# Add 1.8GHz OPP for CA55 clockup support
SRC_URI:append = " ${@'file://0006-Add-1.8GHz-OPP-for-CA55-clockup.patch' if d.getVar('ENABLE_CA55_CLOCKUP') == '1' else ''}"

# Kernel configuration update
SRC_URI:append	= " file://uio.cfg"
SRC_URI:append	= " ${@'file://remoteproc.cfg' if d.getVar('ENABLE_REMOTEPROC') == '1' else ''}"
