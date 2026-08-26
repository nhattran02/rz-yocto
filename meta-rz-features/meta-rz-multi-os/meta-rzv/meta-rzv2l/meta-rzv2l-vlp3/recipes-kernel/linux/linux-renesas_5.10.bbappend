FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

ENABLE_REMOTEPROC = "${@'1' if 'RZ_REMOTEPROC' in d.getVar('MACHINE_FEATURES').split() else '0'}"

# List of kernel patches
SRC_URI += " \
    file://0001-Add-rzg2l-smarc-multi-os-dtsi-for-supporting-OpenAMP.patch \
    file://0002-arm64-dts-renesas-rz-smarc-Disable-OSTM2.patch \
    file://0003-clk-renesas-rzv2l-Set-SCIF2-OSTM2-as-critical.patch \
"

SRC_URI += "${@'file://0004-clk-renesas-r9a07g054-Add-I2-clock.patch \
    file://0005-clk-renesas-r9a07g054-Add-CM33-clock-and-reset-signal.patch \
    file://0006-arm64-dts-renesas-rzv2l-smarc-Add-rproc-node.patch \
    file://0007-Add-bindings-for-RZ-remoteproc-driver.patch \
    file://0008-Add-RZ-remoteproc-driver.patch' if d.getVar('ENABLE_REMOTEPROC') == '1' else ''}"

# Kernel confguration update
SRC_URI += "file://uio.cfg"
SRC_URI += "${@'file://remoteproc.cfg' if d.getVar('ENABLE_REMOTEPROC') == '1' else ''}"
