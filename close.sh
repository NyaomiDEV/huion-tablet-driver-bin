#!/bin/sh

# Adapted and simplified from the official deb release
# Might need to run as root if for whatever reason the driver is run as root

if pidof huionCore >/dev/null; then
	killall huionCore
fi

if pidof huiontablet >/dev/null; then
	killall huiontablet
fi
