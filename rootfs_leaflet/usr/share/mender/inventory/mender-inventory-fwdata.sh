#!/bin/bash

echo LBS_Version=`sudo apt-cache policy leafletbs-app | grep -F "Installed: "| grep -o "[0-9].*"`

#get Leaflet.conf Data
cat /usr/etc/LeafletBaseSoftware/Leaflet.conf | grep Location=*

#get Ip
IP=`cat /usr/etc/LeafletBaseSoftware/Leaflet.conf | grep -F "IP" |grep  -o -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}"`
Port=`cat /usr/etc/LeafletBaseSoftware/Leaflet.conf | grep -F "Port" | grep  -o -E "[0-9]{4}"`

echo LBS_Ip=${IP}:${Port}
