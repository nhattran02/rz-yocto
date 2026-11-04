# audio.sh is sourced from /etc/profile on every login and calls amixer.
# On boards without a sound card this floods the console with ALSA errors.
# - skip the whole script when no ALSA card is present
# - run amixer in quiet mode so it does not dump control values either
do_install:append() {
    sed -i \
        -e '1a [ -e /proc/asound/card0 ] || return 0' \
        -e 's/\bamixer /amixer -q /' \
        ${D}${sysconfdir}/profile.d/audio.sh
}
