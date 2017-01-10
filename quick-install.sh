#!/usr/bin/env bash
set -e
set -x

which git >/dev/null 2>&1 || ( printf "git missing, please install it before re-running this script." && exit 1 )
which rm >/dev/null 2>&1 || ( printf "That is odd, rm is missing. rm is part of the GNU coreutils package so it definitely should be installed!" && exit 1 )
which docker >/dev/null 2>&1 || ( printf "docker missing, please install it before re-running this script." && exit 1 )
which xhost >/dev/null 2>&1 || ( printf "xhost missing, please install it before re-running this script." && exit 1 )

git clone https://github.com/fusion809/runescape-launcher /tmp/runescape-launcher

# Placing the executable script at /usr/local/bin
if [[ -f /usr/local/bin/runescape-launcher ]]; then
  printf "/usr/local/bin/runescape-launcher exists! Deleting it and replacing it with that of this installer."
  sudo rm /usr/local/bin/runescape-launcher
fi

if ! [[ -d /usr/local/bin ]]; then
  sudo mkdir -p /usr/local/bin
fi

sudo cp /tmp/runescape-launcher/runescape-launcher /usr/local/bin

# Moving a desktop configuration file to /usr/local/share/applications

if [[ -f /usr/local/share/applications/runescape-launcher.desktop ]]; then
  printf "/usr/local/share/applications/runescape-launcher.desktop exists! Deleting it and replacing it with that of this installer."
  sudo rm /usr/local/share/applications/runescape-launcher.desktop
fi

if ! [[ -d /usr/local/share/applications ]]; then
  sudo mkdir -p /usr/local/share/applications
fi

sudo cp /tmp/runescape-launcher/runescape-launcher.desktop /usr/local/share/applications
