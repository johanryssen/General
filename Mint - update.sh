#!/bin/bash
#
echo ""
echo "--- Clean and Update ---"
sudo apt clean all
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install -f
echo ""
echo "--- Done ---"
