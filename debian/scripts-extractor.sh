#/bin/bash

DESTDIR=$1
inputfile=$2

endline=$(grep -n '^install()' "$inputfile" | cut -d ':' -f 1 | head -1)

source <(
    head -n +$[$endline -1] "$inputfile" | \
        sed \
            -e 's@\(/lib/systemd/\)@$DESTDIR\1@' \
            -e '/ln -sf/s/COREDIR/COREDIR_ORG/'
)
COREDIR_ORG="$COREDIR"
COREDIR="$DESTDIR/$COREDIR"
add_pm_script "systemd"
add_systemd_service "$VERSION"

find "$DESTDIR" -name \*.service |\
    xargs \
        sed -i "s@ExecStartPre=/bin/sh -c 'modprobe evdi || (dkms install evdi/.* && modprobe evdi)'@ExecStartPre=modprobe evdi@"
