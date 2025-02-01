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
fullName=$(cat /tmp/valentine-fullName)

dirNameIsolata="$(cat /tmp/valentine-nomeCartellaIsolata)"

# read -p "testing filename = $dirNameIsolata" EnterNull

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


## Ora solo in read-only, perché xorriso e mkisofs sono nati per il read-only;
# non ha molto senso usarli per ISO writeable, infatti le loro impostazioni per il writeable
# sono molto inficiate dai vari sistemi con cui si interfacciano.

touch /tmp/valeparted-solaLettura

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

#dirNameIsolata="$(cat /tmp/valeparted-dirNameToCopy)"

percorsoIsolato="$(cat /tmp/valentine-percorsoIsolato)"

#read -p "mart: Ti renderò ISO la directory 
#$dirNameIsolata in
#$dirNameIsolata.iso
#
#Se $dirNameIsolata fosse presente in una partizione non di sistema,
#allora dovresti montarla (rispettando il suddetto percorso)
#prima di procedere premendo Enter.
#
#montare per leggere il file ISO, eseguendo tale istanza:
#sudo mount -o loop $dirNameIsolata.iso /mnt/valepartedMnt
#
#smontare, eseguendo:
#sudo umount /mnt/valepartedMnt
#
#Puoi scegliere qualsiasi cartella di /mnt per montare/smontare,
#l importante è le proprietà e i permessi siano ben impostati.
#
#Premi Enter per continuare" EnterNull

#read -p "testing 160 d.sh
#sudo chmod -R ugao+xrw \$fullName

#sudo chmod -R ugao+xrw $fullName

#xorriso -outdev \$dirNameIsolata.iso -padding 0 -compliance no_emul_toc -map \$fullName / -chmod 0777 / --

#xorriso -outdev $dirNameIsolata.iso -padding 0 -compliance no_emul_toc -map $fullName / -chmod 0777 / --
#" EnterNull

sudo chmod -R ugao+xrw $fullName

## La sottostante istanza va bene solo per piccoli file
#xorriso -as mkisofs -o $dirNameIsolata.iso $percorsoIsolato/$dirNameIsolata
## Invece, la sottostante è valida anche per file grossi
xorriso -outdev $dirNameIsolata.iso -padding 0 -compliance no_emul_toc -map $fullName / -chmod 0777 / --


sleep 1
sudo chown $curuser:$curuser $dirNameIsolata.iso

sudo chmod uga+rw $dirNameIsolata.iso

if [ -f /tmp/valeparted-listOfDirs ]; then 

echo ""
echo ""
echo "Hai 
$(ls .)
"

else

echo ""
echo ""
echo "Hai 
$dirNameIsolata.iso"
echo ""

fi


exit



