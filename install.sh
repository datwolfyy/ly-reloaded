#!/bin/sh

install -dZ ${DESTDIR}/etc/ly
install -DZ bin/ly -t ${DESTDIR}/usr/bin
install -DZ res/xsetup.sh -t ${DESTDIR}/etc/ly
install -DZ res/wsetup.sh -t ${DESTDIR}/etc/ly
install -DZ res/config.ini -t ${DESTDIR}/etc/ly
install -dZ ${DESTDIR}/etc/ly/lang
install -DZ res/lang/* -t ${DESTDIR}/etc/ly/lang
install -DZ res/ly.service -t ${DESTDIR}/usr/lib/systemd/system
