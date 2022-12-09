#!/bin/bash
sudo /sbin/ifconfig usb0 down &
echo "eth1"  > /home/pi/network/currentinterface &
bash /home/pi/network/network_check.sh &
exit 0
