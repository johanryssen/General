#!/bin/bash
echo ""
echo "--- Software Update ---"
sudo softwareupdate -i -a
echo ""
echo "--- BREW update & upgrade ---"
brew update ; brew upgrade
echo ""
echo "--- PORT selfupdate & upgrade outdated ---"
sudo port selfupdate ; sudo port upgrade outdated
echo ""
echo "--- Delete Caches ---"
sudo rm -rf /Users/johanryssen/Library/Caches/*
echo ""
sudo /usr/libexec/locate.updatedb
exit 0
