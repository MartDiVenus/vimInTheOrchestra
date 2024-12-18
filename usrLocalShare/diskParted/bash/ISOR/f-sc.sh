#!/bin/bash

## Intro: Bash script about netrw/fdisk based disk partition table manipulation,
##        with X session {{{1
## /usr/local/bin/valeparted
## Title: valeparted.sh {{{1
## Author: Mario Fantini ing.mariofantini@gmail.com {{{1

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

sudo partprobe 2> /dev/null

lsblk > /tmp/umount-back

cat /tmp/umount-back | awk '$1 > 0 {print $1 $7}' > /tmp/mountpoint
rm /tmp/umount-back

sed '/^NAMEMOUNTPOINT/d' /tmp/mountpoint > /tmp/mountpoint-1
rm /tmp/mountpoint 

sed '/radice/d' /tmp/mountpoint-1 > /tmp/mountpoint-001

sed '/^loop/d' /tmp/mountpoint-1 > /tmp/mountpoint0001

comm -3 /tmp/mountpoint-001 /tmp/mountpoint0001 > /tmp/FisicaOlive

rm /tmp/mountpoint-1 /tmp/mountpoint-001 /tmp/mountpoint0001

stat --format %s /tmp/FisicaOlive > /tmp/resp1FisicaOlive

leggoRespFisicaOlive=$(cat /tmp/resp1FisicaOlive)

rm  /tmp/resp1FisicaOlive

if test $leggoRespFisicaOlive -gt 0
 then
  ## Sono in una stazione live
  ## !!!!!! Per le stazioni live non va l'opzione -l

findmnt -n --real -o TARGET > /tmp/real1

else

findmnt -n -l --real -o TARGET > /tmp/real1

fi

rm -rf /tmp/splitReal

mkdir /tmp/splitReal

split -l 1 /tmp/real1 /tmp/splitReal/

for a in $(ls /tmp/splitReal/)

 do
	 
	 leggoA1="$(cat /tmp/splitReal/$a)"

  if test $leggoA1 == "/"
 
  then

     rm /tmp/splitReal/$a
  fi

  if test $leggoA1 == "/boot/efi"

  then

	  rm /tmp/splitReal/$a

  fi

cat /tmp/pos | sed -e 's/\//\\\//g' > /tmp/posed

cut -d/ -f2,3 /tmp/posed > /tmp/posed1

cut -d'\' -f2,1 /tmp/posed1 > /tmp/posed2

cat /tmp/posed2 | sed -e 's/\\//g' > /tmp/posed3

posTagliato="/$(cat /tmp/posed3)"

Itermine="$posTagliato"

if test $Itermine == $leggoA1

then

	rm /tmp/splitReal/$a

fi

rm /tmp/posed /tmp/posed1 /tmp/posed2 /tmp/posed3

done

for b in $(ls /tmp/splitReal/)

 do
   
   leggoMountedGenericPart="$(cat /tmp/splitReal/$b)"

   sudo umount -l $leggoMountedGenericPart

   sleep 3

done

rm -r /tmp/splitReal

rm  /tmp/real1 /tmp/FisicaOlive


if [ -f /tmp/valeparted-dev ]; then

	device="$(cat /tmp/valeparted-dev)"

else

/usr/local/share/valentine/diskParted/bash/ISOL/valeparted02ISOR.sh
	
	cat /tmp/valeNetrw-partizioni6 | tail -n1 > /tmp/valeNetrw-partizioni6Eg

	esempioPart="$(cat /tmp/valeNetrw-partizioni6Eg)"

	echo " "
	echo " "
read -p "Di seguito la lista delle partizioni reali (fisiche) disponibili:

$(cat /tmp/valeNetrw-partizioni6)

Devi specificare la partizione del disco che accoglierà il contenuto per
creare il file ISO.


Digita e.g.
/dev/$esempioPart

" partizione

device="/dev/$partizione"

fi

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



/usr/local/bin/luxdim -m -f/tmp/valeparted-fileNameToCopy | head -n3 | tail -n1 | awk '$1 > 0 {print $1}' | cut -d. -f1,1 > /tmp/valeparted-fileNameToCopyMega

leggoMega=$(cat /tmp/valeparted-fileNameToCopyMega)

## Aggiungo 1 mega per i byte che sono sotto l'unità o se il file non raggiunge l'unità.
dimensioni=$(echo $leggoMega +1 | bc)

sleep 2

sudo mkdir /mnt/valepartedMnt 2> /dev/null

sudo mount $device /mnt/valepartedMnt

sleep 1
sudo chown -R $curuser:$curuser /mnt/valepartedMnt

sudo chmod -R uga+xrw /mnt/valepartedMnt

sleep 1

sudo umount $device

if test $scelta == 1

then


sudo dd if=$device of=$fileName.iso 2> /dev/null

sudo chown $curuser:$curuser $fileName.iso

sudo chmod uga+rw $fileName.iso

sleep 1

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

sudo mount -o loop $fileName.iso /mnt/valepartedMnt

sleep 0.5

fileToCopy="$(cat /tmp/valeparted-fileNameToCopy)"

read -p "mart: Ti copierò il file 
$fileToCopy in
$fileName.iso

Se $fileToCopy fosse presente in una partizione non di sistema,
allora, prima di procedere premendo Enter, dovresti montarla manualmente
e senza ricorrere alle partizioni statiche.
Il file da copiare deve rispettare il suddetto percorso.


Alla fine della copia ti lascerò montato il file *.iso 
affinché tu possa caricarlo di ulteriori contenuti.
Ti aprirò anche una finestra di ValeNetrw per facilitarti
la scrittura/copia dei contenuti.

Alla fine, quando chiuderai la finestra di ValeNetrw, 
per sicurezza ti smonterò tutto.

Potrai in qualsiasi momento:

montare per leggere e/o scrivere il file ISO, eseguendo tale istanza:
sudo mount -o loop $fileName.iso /mnt/valepartedMnt

smontare, eseguendo:
sudo umount /mnt/valepartedMnt

Puoi scegliere qualsiasi cartella di /mnt per montare/smontare,
l importante è le proprietà e i permessi siano ben impostati.

Premi Enter per continuare" EnterNull


echo "Copia in corso del file 
$fileToCopy"


cp $fileToCopy /mnt/valepartedMnt

sync

sleep 3

gvim -f /mnt/valepartedMnt

sudo umount /mnt/valepartedMnt

else

sudo mount $device /mnt/valepartedMnt

sleep 1

echo " "
echo " "
echo " "

sleep 0.5

fileToCopy="$(cat /tmp/valeparted-fileNameToCopy)"

read -p "mart: Ti copierò il file 
$fileToCopy in
$fileName.iso

Se $fileToCopy fosse presente in una partizione non di sistema,
allora dovresti montarla (rispettando il suddetto percorso)
prima di procedere premendo Enter.


Alla fine della copia ti lascerò montato il file *.iso 
affinché tu possa caricarlo di ulteriori contenuti.

Ti aprirò  una finestra di ValeNetrw per facilitarti
la scrittura/copia dei contenuti, ti ricordo che solo in tale
sessione potrai scrivere il file ISO; in futuro potrai solo
leggerne i contenuti (si comporta come un CD-ROM).

Alla fine, quando chiuderai la finestra di ValeNetrw, 
per sicurezza ti smonterò tutto.

Potrai in qualsiasi momento:

montare per leggere il file ISO, eseguendo tale istanza:
sudo mount -o loop $fileName.iso /mnt/valepartedMnt

smontare, eseguendo:
sudo umount /mnt/valepartedMnt

Puoi scegliere qualsiasi cartella di /mnt per montare/smontare,
l importante è le proprietà e i permessi siano ben impostati.

Premi Enter per continuare" EnterNull

echo "Copia in corso del file
$fileToCopy"


cp $fileToCopy /mnt/valepartedMnt

sync


sleep 2

gvim -f /mnt/valepartedMnt

sudo chmod -R ugao+xrw /mnt/valepartedMnt

xorriso -as mkisofs -o $fileName.iso /mnt/valepartedMnt

sleep 1
sudo chown $curuser:$curuser $fileName.iso

sudo chmod uga+rw $fileName.iso

fi


sudo partprobe 2> /dev/null


sudo rm -r /tmp/valeParted*


### Aggiornamento di udev che partprobe intacca

lsblk > /dev/null


sudo systemctl restart systemd-udev-trigger.service 2> /dev/null

sleep 3

sudo systemctl restart systemd-udevd.service 2> /dev/null

sleep 3

lsblk > /dev/null

### Ripristino di netrw file manager
cp /usr/local/share/valentine/fileManager/plugin/Valentine.vim.file ~/.vim/plugin/Valentine/Valentine.vim

sudo cp /usr/local/share/valentine/fileManager/autoload/netrw.vim.file /usr/share/vim/vim82/autoload/netrw.vim

sudo cp -r /usr/local/share/valentine/fileManager/etc/vim /etc

sudo chown root:root /etc/vim 2> /dev/null

sudo chmod ugao-xrw /etc/vim 2> /dev/null

sudo chmod uga+r /etc/vim 2> /dev/null

sudo chmod ga+x /etc/vim 2> /dev/null

sudo chmod g-w /etc/vim 2> /dev/null

sudo chmod u+w /etc/vim 2> /dev/null

sudo chmod ugao-xrw /etc/vim/* 2> /dev/null

sudo chmod uga+r /etc/vim/* 2> /dev/null

sudo chmod u+w /etc/vim/* 2> /dev/null


rm -r ~/.vim/plugin/Valentine/netrw/commands/valedisks

rm -r /tmp/valeNetrw*


exit


