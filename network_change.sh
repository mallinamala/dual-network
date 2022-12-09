#!/bin/bash
lastinterface=$(cat /home/pi/network/currentinterface)
echo $lastinterface
if [[ $lastinterface = "usb0" ]];then 
	wget --max-redirect 0 -otest2.txt --report-speed=bits --delete-after http://airfi.in/SampleJPGImage_1mbmb.jpg
	grep_speed=$(cat test2.txt | grep -oP '\(\K[^\)]+' | sed -n 4p)
	echo $grep_speed
	if [[ $grep_speed = *"Mb/s"* ]];then
	/sbin/ifconfig usb0 up
	echo "usb0" > /home/pi/network/currentinterface
	/sbin/ifconfig eth1 down
	echo "if block executed usb0 up"
	else
	/sbin/ifconfig eth1 up
	echo "eth1" > /home/pi/network/currentinterface
	/sbin/ifconfig usb0 down
	echo "else block execited eth1 up"
	fi
else
	wget --max-redirect 0 -otest2.txt --report-speed=bits --delete-after http://airfi.in/SampleJPGImage_1mbmb.jpg
        grep_speed=$(cat test2.txt | grep -oP '\(\K[^\)]+' | sed -n 4p)
        echo $grep_speed
	if [[ $grep_speed = *"Mb/s"* ]];then
	/sbin/ifconfig eth1 up
        echo "eth1" > /home/pi/network/currentinterface
        /sbin/ifconfig usb0 down
	echo "els2 executed"
        else
        /sbin/ifconfig usb0 up
        echo "usb0" > /home/pi/network/currentinterface
        /sbin/ifconfig eth1 down
	echo "last else execute"
	fi
fi


