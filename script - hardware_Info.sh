#!/bin/bash
echo "Running ....."
sudo lshw -html > ~/hardware_info.html
echo "... Done"
echo "Open ~/hardware_info.html with your browser"
echo ""
exit 0
