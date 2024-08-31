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

/usr/local/share/valentine/diskParted/bash/valeparted02ISOL.sh

echo " "
echo " "
echo "a
b
c
d
e
f
g
h
i
j
k
l
m
n
o
p
q
r
s
t
u
v
z
w
y
x" > /tmp/valeNetrw-Alpham

if [ -f /tmp/valeNetrw-devLoopList ]; then

	cat /tmp/valeNetrw-devLoopList | tail -n1 > /tmp/valeNetrw-lastLoopDev

cat /tmp/valeNetrw-lastLoopDev | sed 's/sd//g' > /tmp/valeNetrw-devLoopLastLettera

lastLettera="$(cat /tmp/valeNetrw-devLoopLastLettera)"

grep -n "$lastLettera" /tmp/valeNetrw-Alpham | cut -d: -f1,1 > /tmp/valeNetrw-devLoopLastLetteraLine

lastLetterLine=$(cat /tmp/valeNetrw-devLoopLastLetteraLine)
## + 2 in modo da non avere problemi con l'eventuale futuro montaggio di un disco fisico.
## e.g. se attualmente avessi due dischi fisici sda e sdb e creassi il disco loop /dev/sdc1
## aggiungendo +1, se montassi un disco dopo tale sessione di valeparted, allora il sistema
## lo leggerebbe come sdc. Tale sovrapposizione non crea problemi per mount se eseguito 
## manualmente, mentre li crea se esternamente (e.g. tramite valeparted o valedisk).
echo $(echo $lastLetterLine + 2 | bc) > /tmp/valeNetrw-devLoopLastLetteraLinePlus

lastLetterPlusNumber=$(cat /tmp/valeNetrw-devLoopLastLetteraLinePlus)

sed -n ''$lastLetterPlusNumber'p' /tmp/valeNetrw-Alpham > /tmp/valeNetrw-newDevLoopLetter

stat --format %s /tmp/valeNetrw-newDevLoopLetter > /tmp/valeNetrw-newDevLoopLetterBytes

newDevLoopLetterBytes=$(cat /tmp/valeNetrw-newDevLoopLetterBytes)

if test $newDevLoopLetterBytes -gt 0

then


newDevLoopLetter="$(cat /tmp/valeNetrw-newDevLoopLetter)"

#read -p "testing newDevLoopLetter" EnterNull

else
	echo " "
	echo " "
	echo "mart: Hai esaurito i dischi /dev/sd* a una cifra, quelli con cui lavora valeparted.
Uscita forzata. Per sicurezza riavvia il sistema e riesegui tale istanza.
"

exit

fi

numb=1

partizione="sd$newDevLoopLetter$numb"

grep "$partizione" /tmp/valeNetrw-partizioni6 > /tmp/valeNetrw-verificaPartizioniLoopi

stat --format %s /tmp/valeNetrw-verificaPartizioniLoopi > /tmp/valeNetrw-verificaPartizioniLoopiBytes

leggoBytesPartLoopiVerifica=$(cat /tmp/valeNetrw-verificaPartizioniLoopiBytes)

#read -p "224" EnterNull

if test $leggoBytesPartLoopiVerifica -eq 0

then

	echo " "
	echo " "
	read -p "mart: Attenzione, verrà creato il seguente disco/partizione loop:
/dev/$partizione

Premi Enter per continuare." EnterNull

else
	echo " "
	echo " "
	echo "Riavvia il sistema, ho provato a creare un disco/partizione loop
ma compare già esistente nelle partizioni loop.
Riavvia il sistema e riesegui 
valeparted -iso -f'file name without extension'"
	exit
	
fi

else


cat /tmp/valeNetrw-partizioni6 | tail -n1 > /tmp/valeNetrw-lastRealDev

cat /tmp/valeNetrw-lastRealDev | sed 's/sd//g' > /tmp/valeNetrw-devRealLastLetteraEtNumb

lastLetteraEtNumb="$(cat /tmp/valeNetrw-devRealLastLetteraEtNumb)"

cat /tmp/valeNetrw-devRealLastLetteraEtNumb | sed 's/.$//g' > /tmp/valeNetrw-devRealLastLettera

lastLettera="$(cat /tmp/valeNetrw-devRealLastLettera)"

grep -n "$lastLettera" /tmp/valeNetrw-Alpham | cut -d: -f1,1 > /tmp/valeNetrw-devRealLastLetteraLine

lastLetterLine=$(cat /tmp/valeNetrw-devRealLastLetteraLine)

## + 2 in modo da non avere problemi con l'eventuale futuro montaggio di un disco fisico.
## e.g. se attualmente avessi due dischi fisici sda e sdb e creassi il disco loop /dev/sdc1
## aggiungendo +1, se montassi un disco dopo tale sessione di valeparted, allora il sistema
## lo leggerebbe come sdc. Tale sovrapposizione non crea problemi per mount se eseguito 
## manualmente, mentre li crea se esternamente (e.g. tramite valeparted o valedisk).
echo $(echo $lastLetterLine + 2 | bc) > /tmp/valeNetrw-devRealLastLetteraLinePlus

lastLetterPlusNumber=$(cat /tmp/valeNetrw-devRealLastLetteraLinePlus)

sed -n ''$lastLetterPlusNumber'p' /tmp/valeNetrw-Alpham > /tmp/valeNetrw-newDevRealLetter

stat --format %s /tmp/valeNetrw-newDevRealLetter > /tmp/valeNetrw-newDevRealLetterBytes

newDevRealLetterBytes=$(cat /tmp/valeNetrw-newDevRealLetterBytes)

if test $newDevRealLetterBytes -gt 0

then


newDevRealLetter="$(cat /tmp/valeNetrw-newDevRealLetter)"

#read -p "testing newDevRealLetter" EnterNull

else
	echo " "
	echo " "
	echo "mart: Hai esaurito i dischi /dev/sd* a una cifra, quelli con cui lavora valeparted.
Uscita forzata. Per sicurezza riavvia il sistema e riesegui tale istanza.
"

exit

fi

numb=1

partizione="sd$newDevRealLetter$numb"

grep "$partizione" /tmp/valeNetrw-partizioni6 > /tmp/valeNetrw-verificaPartizioniReali

stat --format %s /tmp/valeNetrw-verificaPartizioniReali > /tmp/valeNetrw-verificaPartizioniRealiBytes

leggoBytesPartRealiVerifica=$(cat /tmp/valeNetrw-verificaPartizioniRealiBytes)

#read -p "305" EnterNull

if test $leggoBytesPartRealiVerifica -eq 0

then

	echo " "
	echo " "
	read -p "mart: Attenzione, verrà creato il seguente disco/partizione loop:
/dev/$partizione

Premi Enter per continuare." EnterNull

else
	echo " "
	echo " "
	echo "Riavvia il sistema, ho provato a creare un disco/partizione loop
ma compare già esistente nelle partizioni reali.
Riavvia il sistema e riesegui 
valeparted -iso -f'file name without extension'"
	exit
	
fi


fi

device="/dev/$partizione"

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


read -p "mart: Digita il numero associato alla tua risposta e premi Enter.

1. Vuoi creare un file ISO scrivibile sempre.


2.  Vuoi creare un file ISO scrivibile solo in tale sessione, in futuro avrà 
permessi solo in lettura; si comporterà come un CD-ROM.

:" scelta

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


read -p "mart: Specifica in mega bytes le dimensioni del disco loop da creare
:" dimensioni

suffissoK="k"

sudo dd if=/dev/zero of=$device bs=1k count=$dimensioni$suffissoK 2> /dev/null

sleep 2
echo "mart: Non digitare nulla se gli output non sono preceduti da mart:
e.g.
mart: bla bla bla"
echo " "
echo " "
echo " "

echo " "
echo " "
echo " "

sudo fdisk -l $device > /tmp/valeParted-fdisk

echo " "
echo " "

echo " "
echo " "

echo " "


echo -e "n
l 
q" | sudo fdisk $device > /tmp/valeParted-outputLogical


grep "Adding logical partition" /tmp/valeParted-outputLogical > /tmp/valeParted-outputLogical01

stat --format %s /tmp/valeParted-outputLogical01 > /tmp/valeParted-outputLogical02

leggoBytes=$(cat /tmp/valeParted-outputLogical02)

if test $leggoBytes -gt 1

then

grep "Adding logical partition" /tmp/valeParted-outputLogical  | awk '$1 > 0 {print $4}' > /tmp/valeparted-nPartioneDefault

else

grep "Numero della partizione" /tmp/valeParted-outputLogical > /tmp/valeParted-outputLogical01

cat /tmp/valeParted-outputLogical01 | awk '$1 > 0 {print $12}' > /tmp/valeparted-nPartioneDefault

vi -c ":silent! %s/)://" /tmp/valeparted-nPartioneDefault -c :w -c :q

fi

nPart=$(cat /tmp/valeparted-nPartioneDefault)

echo "$device-$nPart" > /tmp/valeParted-device

vi -c ":%s/-//g" /tmp/valeParted-device -c :w -c :q

cp /tmp/valeParted-device /tmp/valeParted-part

myPart="$(cat /tmp/valeParted-part)"



suffissoM="M"
partEnd01="+$dimensioni$suffissoM"


## fdisk usa la virgola al posto del pto., per le cifre decimali.
echo $partEnd01 > /tmp/valeparted-partEnd01

sed 's/\./,/g' /tmp/valeparted-partEnd01 > /tmp/valeparted-partEnd

partEnd="$(cat /tmp/valeparted-partEnd)"

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

read -p "mart: Specifica l'etichetta che vuoi assegnare.

e.g.
prontuarioLaTeX


:" label


sleep 1

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

## Va bene anche ext4, ma per ciò che mi occorre mi basta ext3.
## Se creassi un disco inferiore a 2 MB, allora automaticamente
## verrebbe creato un ext2.
filesystem="ext3"

echo "mart: Non digitare nulla se gli output non sono preceduti da mart:
e.g.
mart: bla bla bla"
echo " "
echo " "
echo " "

echo " "
echo " "
echo " "

echo -e "n
l 
$nPart
\r
$partEnd
w" | sudo fdisk $device 2> /dev/null

sleep 3


echo "$device-$nPart" > /tmp/valeParted-device

vi -c ":%s/-//g" /tmp/valeParted-device -c :w -c :q

cp /tmp/valeParted-device /tmp/valeParted-part

myPart="$(cat /tmp/valeParted-part)"


if test $filesystem == "ext3"
	then

		echo "Non digitare nulla fino alla fine delle operazioni di mke2fs,
non si riferisce a te il cursore che compare a dx dei due punti nelle voci
<<Creating journal:
Writing superblocks and filesystem accounting information:
>>" 
echo " "


sudo mkfs.$filesystem -F -L $label $myPart 2> /dev/null

sleep 3

fi

if test $filesystem == "ext4"
	then

		echo "Non digitare nulla fino alla fine delle operazioni di mke2fs,
non si riferisce a te il cursore che compare a dx dei due punti nelle voci
<<Creating journal:
Writing superblocks and filesystem accounting information:
>>" 
echo " "


sudo mkfs.$filesystem -F -L $label $myPart 2> /dev/null

sleep 3

fi

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

read -p "mart: Ti monterò $fileName.iso
affinché tu possa già caricarlo di contenuti.
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
l'importante è le proprietà e i permessi siano ben impostati.

Premi Enter per continuare" EnterNull

sudo mount -o loop $fileName.iso /mnt/valepartedMnt

sleep 2

gvim -f /mnt/valepartedMnt

sudo umount /mnt/valepartedMnt

else

sudo mount $device /mnt/valepartedMnt

sleep 1

echo " "
echo " "
echo " "
read -p "mart: Ti aprirò  una finestra di ValeNetrw per facilitarti
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
l'importante è le proprietà e i permessi siano ben impostati.

Premi Enter per continuare" EnterNull



sleep 2

gvim -f /mnt/valepartedMnt

sudo chmod -R ugao+xrw /mnt/valepartedMnt

xorriso -as mkisofs -o $fileName.iso /mnt/valepartedMnt

sleep 1
sudo chown $curuser:$curuser $fileName.iso

sudo chmod uga+rw $fileName.iso

fi

#=========== Eliminazione disco loop
if [ -f /tmp/valeNetrw-devLoopList ]; then

	cat /tmp/valeNetrw-devLoopList | sed 's/^/\/dev\//g' > /tmp/valeNetrw-devLoopList01

	cat /tmp/valeNetrw-devLoopList01 | sed 's/$/1/g' > /tmp/valeNetrw-devLoopList02

	cat /tmp/valeNetrw-devLoopList02 | tail -n1 > /tmp/valeNetrw-devLoopListDel

#	cat /tmp/valeNetrw-devLoopList02

echo " "
echo " "

echo "mart: Rimozione del disco/part loop:
$myPart


Digita il numero associato alla tua scelta e premi enter:

1. rimozione semplice (veloce)

2. rimozione sicura (meno lenta)

3. non rimuovere il disco/part loop"

read -p "
:" sceltaDel


for a in {1}

do

if test $sceltaDel -eq 1

then
sudo rm $myPart

break

fi

if test $sceltaDel -eq 2

then

sudo wipefs --all $myPart

sudo rm $myPart

break

fi

done

sleep 2


## E` inutile eliminare la partizione anche con fdisk.
#cat /tmp/valeParted-devicePart | sed 's/\/dev\/sd.//g' > /tmp/valeParted-nPart

#nPart=$(cat /tmp/valeParted-nPart)

#cat /tmp/valeParted-devicePart | sed 's/'$nPart'//g' > /tmp/valeParted-device

#device="$(cat /tmp/valeParted-device)"

#read -p "testing device = $device" EnterNull

#echo -e "d
#$nPart
#w" | sudo fdisk $device


#sleep 3

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

