#!/bin/bash

## Intro: Bash script about netrw/fdisk based disk partition table manipulation,
##        with X session {{{1
## /usr/local/bin/valeparted
## Title: valeparted.sh {{{1
## Author: Mario Fantini marfant7@gmail.com {{{1

## Copyright (C) 2022.02.27 {{{1 
## Creative Commons by-nc-sa-eu
## https://martlux.ns0.it:4000/cluster/securing/martalux

## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You have received a copy of the GNU General Public License
## along with this program in README/COPYING. 
## Aka see <https://www.gnu.org/licenses/>.

## Help: Vale-netrw

echo $USER > /tmp/valeparted-curuser

curuser="$(cat /tmp/valeparted-curuser)"


# read -p "testing device = /dev/$partizione" EnterNull

fileName="$(cat /tmp/valeparted-fileName)"

# read -p "testing filename = $fileName" EnterNull

clear 

echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "


## Ora solo in read-only perché non ho capito come si fa con mkisof o xorriso a scrivere
## una iso in scrittura


if [ -f /tmp/valeparted-letturaEtScrittura ]; then

scelta=1

else

if [ -f /tmp/valeparted-solaLettura ]; then

scelta=2

else



read -p "mart: Digita il numero associato alla tua risposta e premi Enter.

1. Vuoi creare un file ISO scrivibile sempre.


2.  Vuoi creare un file ISO scrivibile solo in tale sessione, in futuro avrà 
permessi solo in lettura; si comporterà come un CD-ROM.

:" scelta

fi

fi


clear

echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "


sleep 1

echo " "
echo " "
echo " "

sleep 0.5

if [ -f /tmp/valeparted-sourceDevice ]; then

sourceDevice="$(cat /tmp/valeparted-sourceDevice)"

else
read -p "Digita il device/partizione sorgente da cui generare il file ISO.

e.g.

device ottico:
/dev/cdrom


device hd 

partizione:
/dev/sdc1

potresti anche avere un device anziché una partizione:
/dev/sdc

:" sourceDevice

fi

### e.g. creare una iso da CD-ROM, ma vale per qualsiasi device.

## dd if=/dev/cdrom of=/directory/example.iso


read -p "mart: Ti renderò il device $sourceDevice in
$fileName.iso

Alla fine della sessione, montare per leggere il file ISO,
eseguendo tale istanza:
sudo mount -o loop $fileName.iso /mnt/valepartedMnt

smontare, eseguendo:
sudo umount /mnt/valepartedMnt

Puoi scegliere qualsiasi cartella di /mnt per montare/smontare,
l importante è le proprietà e i permessi siano ben impostati.

Premi Enter per continuare" EnterNull

dd if=$sourceDevice of=$fileName.iso

sleep 1
sudo chown $curuser:$curuser $fileName.iso

sudo chmod uga+rw $fileName.iso

rm -fr /tmp/valeNetrw*


exit


