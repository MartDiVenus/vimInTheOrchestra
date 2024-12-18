#!/bin/bash

## Intro: Bash script about netrw/fdisk based disk partition table manipulation,
##        with X session {{{1
## /usr/local/bin/valeparted
## Title: partScript.sh {{{1
## Author: Mario Fantini ing.mariofantini@gmail.com {{{1

## Copyright (C) 2022.02.27 {{{1 
## Creative Commons by-nc-sa-eu
## https://martlux.ns0.it:4000/cluster/securing/devskio

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
#!/bin/bash

## Intro: Bash script about netrw/fdisk based disk partition table manipulation,
##        with X session {{{1
## /usr/local/bin/valeparted
## Title: valeparted.sh {{{1
## Author: Mario Fantini ing.mariofantini@gmail.com {{{1

## Copyright (C) 2022.02.27 {{{1 
## Creative Commons by-nc-sa-eu
## https://martlux.ns0.it:4000/cluster/securing/martalux

sudo partprobe

echo $PWD > /tmp/pos

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


echo " "
echo " "
echo " "
read -p "Stai per modificare il device che specificherai.

Specifica il nome del device, e.g.
/dev/sdc

:" device

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

sudo fdisk -l $device > /tmp/valeParted-fdisk

## non mi piace la notazione non scientifica di fdisk, quindi
## la rendo scientifica.
sed 's/,/\./g' /tmp/valeParted-fdisk > /tmp/valeParted-fdisk01

sed 's/GiB./GiB,/g' /tmp/valeParted-fdisk01 > /tmp/valeParted-fdisk02

sed 's/bytes\./bytes,/g' /tmp/valeParted-fdisk02 > /tmp/valeParted-fdiskL

cat /tmp/valeParted-fdiskL

echo " "
echo " "
read -p "Ecco le caratteristiche del tuo device scelto,
puoi visionarle in qualsiasi momento anche nel file
/tmp/valeParted-fdiskL

premi Enter per continuare" EnterNull


echo " "
echo " "

read -p "Digita il numero associato alla tua risposta e premi Enter.


0. Vuoi creare una nuova tabella delle partizioni msdos.


1. Vuoi creare una nuova tabella delle partizioni msdos,
   e una partizione che occupa lo spazio totale.


2. Vuoi creare una partizione primaria o estesa per la tabella msdos 


3. Vuoi creare una partizione logica per la partizione estesa msdos




4. Vuoi creare una nuova tabella delle partizioni gpt 


5. Vuoi creare una partizione logica per la tabella gpt



6. Vuoi eliminare una partizione. 

:" scelta

echo " "
echo " "

echo " "
echo " "

if test $scelta == 0

then

	sudo wipefs --all $device

	sleep 3


echo -e "o
w" | sudo fdisk $device

fi



if test $scelta == 1

then

	sudo wipefs --all $device

	sleep 3


	echo "$device-1" > /tmp/valeParted-device

vi -c ":%s/-//g" /tmp/valeParted-device -c :w -c :q

cp /tmp/valeParted-device /tmp/valeParted-part

myPart="$(cat /tmp/valeParted-part)"

npart=1

echo " "
echo " "
echo " "
echo " "

read -p "Specifica l'etichetta che vuoi assegnare.

e.g. per filesystem ext3, ext4, xfs:
salvaMare

e.g. per i filesystem fat16, fat32 è preferibile usare il maiuscolo:
SALVAMARE

:" label

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


read -p "Specifica il filesystem tra i quattro:
ext3, ext4, fat16, fat32, xfs.

e.g.
xfs

:" filesystem


sleep 1

echo " "
echo " "
echo " "
echo " "


echo -e "n
p
$nPart
\r
\r
w" | sudo fdisk $device


sleep 3

echo " "
echo " "

if test $filesystem == "ext3"
	then

		echo "Non digitare nulla fino alla fine delle operazioni di mke2fs,
non si riferisce a te il cursore che compare a dx dei due punti nelle voci
<<Creating journal:
Writing superblocks and filesystem accounting information:
>>" 
echo " "


sudo mkfs.$filesystem -F -L $label $myPart

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


sudo mkfs.$filesystem -F -L $label $myPart

sleep 3

fi


if test $filesystem == "fat16"
	then

sudo mkfs.vfat -F 16 -n $label $myPart

sleep 3

fi


if test $filesystem == "fat32"
	then

sudo mkfs.vfat -F 32 -n $label $myPart

sleep 3

fi

if test $filesystem == "xfs"
	then

sudo mkfs.$filesystem -f -L $label $myPart

sleep 3

fi

fi



if test $scelta == 2

then
echo " "
echo " "
echo " "
echo " "

read -p "Specifica il tipo di partizione che vuoi creare.

1. primaria [max 4 partizioni primarie, solitamente per sistemi operativi]

2. estesa [container per partizioni logiche, solitamente per partizioni dati]

Digita il numero associato alla tua scelta e premi Enter.

:" partType

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

#echo "Di seguito la lista delle partizioni, e settori del disco:"


#echo " "

#echo "In caso di partizioni già esistenti avrai, in ordine da sx verso dx:
#Dispositivo
#Avvio
#Start
#Fine
#Settori
#Size
#Id
#Tipo"

#echo " "
#echo " "



echo " "
echo " "
echo " "
echo " "

grep "$device" /tmp/valeParted-fdiskL > /tmp/valeParted-sectorsList


### Sviluppo

# leggoListaPartizioni="$(cat /tmp/valeParted-sectorsList)"

# cat /tmp/valeParted-fdiskL | head -n1 | awk '$1 > 0 {print $7}' > /tmp/valeParted-sectors

# leggoSettoriTotali=$(cat /tmp/valeParted-sectors)

# lastSector=$(($leggoSettoriTotali - 1))

# cat /tmp/valeParted-sectorsList | tr ':\n' '\n' > /tmp/valeParted-sectorsList1

# cat /tmp/valeParted-sectorsList1 | uniq > /tmp/valeParted-sectorsList2

#### Sviluppo 
#cat /tmp/valeParted-sectorsList2


#echo " "
#read -p "Esprimi il settore di inizio per la nuova partizione,
#
#primo settore del device		ultimo settore del device:
#2048					$lastSector




#a) Se esistesse già una partizione non occupante tutto il device,
#e.g. /dev/sdc1 e tu volessi aggiungere la partizione /dev/sdc2; 
#
#e.g. se tu avessi:
#
#Disk /dev/sdc: 7.29 GiB, 7823458304 bytes, 15280192 sectors
#...
#Units: sectors of 1 * 512 = 512 bytes
#[infatti (15280191 sectors)(512 bytes) = 7823457792 bytes = 7.82 GiB]
#...

#Dispositivo Avvio     Start      Fine     Settori   Size    Id     Tipo
#/dev/sdc1             2048      2099199   2097152   1G      83     Linux


#allora come settore iniziale dovresti esprimere in settori:
#2099200
#perché 2099200 = 2099199+1

#infatti essa equivale a (2099200*512 = 1,074,790,400) bytes, ossia a 1.07 GiB
#dall'inizio del disco.


#b) Se la partizione /dev/sdc1 invece occupasse tutto il device, o occupasse
#i settori in cui vorresti la nuova partizione: allora dovresti abbandonare
#tale istanza ora, perché ti occorrerebbe o rimuovere /dev/sdc1 o creare una
#nuova tabella msdos.

#:" firstSector

#echo " "
#echo " "
#echo " "
#echo " "
cat /tmp/valeParted-fdiskL | head -n1 | awk '$1 > 0 {print $3}' > /tmp/valeParted-sizeValue

cat /tmp/valeParted-fdiskL | head -n1 | awk '$1 > 0 {print $4}' > /tmp/valeParted-sizeUnit

vi -c ":%s/,//g" /tmp/valeParted-sizeUnit -c :w -c :q

leggoSizeValue=$(cat /tmp/valeParted-sizeValue)

leggoSizeUnit=$(cat /tmp/valeParted-sizeUnit)


cat /tmp/valeParted-sectorsList | tr ':\n' '\n' > /tmp/valeParted-sectorsList1

cat /tmp/valeParted-sectorsList1 | uniq > /tmp/valeParted-sectorsList2




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

echo "Di seguito la lista delle partizioni, e settori del disco:"


echo " "

echo "In caso di partizioni già esistenti avrai, in ordine da sx verso dx:
Dispositivo
Avvio
Start
Fine
Settori
Size
Id
Tipo"

echo " "
echo " "


cat /tmp/valeParted-sectorsList2

echo " "
echo " "

read -p "Visiona le caratteristiche di sopra, premi Enter per continuare" EnterNull

echo " "
echo " "
echo " "

read -p "Esprimi l'ultimo settore per la nuova partizione.

Attraverso i bytes (K,M,G,T,P), nel tuo caso ha in totale:
valore unità
$leggoSizeValue $leggoSizeUnit

e.g. prendendo l'esempio riportato in a), 2., per avere la /dev/sdc2 dovresti
digitare:
+6G
oppure se volessi ricorrerre ai numeri non interi:
+6.3G

:" partEnd01



##### Sviluppo

#read -p "Esprimi l'ultimo settore per la nuova partizione.

#a) Attraverso i bytes (K,M,G,T,P), nel tuo caso ha in totale:
#valore unità
#$leggoSizeValue $leggoSizeUnit

#e.g. prendendo l'esempio riportato in a), 2., per avere la /dev/sdc2 dovresti
#digitare:
#+6G
#oppure se volessi ricorrerre ai numeri non interi:
#+6.3G

#:"

#b) Attraverso i settori [Non testato].
#Nel tuo caso hai in totale:
#$lastSector



#e.g. se volessi creare una partizione /dev/sdc2 di 6 giga a dx
#della /dev/sdc1  di 1 giga [quest'ultima fissata al settore di inizio],
#dovresti digitare:
#	+15280191

#	e.g.
#Disk /dev/sdc: 7.29 GiB, 7823458304 bytes, 15280192 sectors
#...
#Units: sectors of 1 * 512 = 512 bytes
#[infatti (15280191 sectors)(512 bytes) = 7823457792 bytes = 7.82 GiB]
#...
#/dev/sdc1            2048  2099199  2097152    1G 83 Linux

#avresti alla fine di tale istanza:

#Dispositivo Avvio     Start      Fine     Settori   Size    Id   Tipo
#/dev/sdc1             2048      2099199   2097152   1G      83   Linux
#/dev/sdc2            2099200    15280191  13180992  6.3G    83   Linux


#Questo perché:

#1. /dev/sdc1: voglio 1 GiB per la I partizione:

#1.1 sottraggo alla fine della I partizione, i settori da cui inizia---
#i 2048 sono stabiliti di default come inizio della I partizione del disco:
#2099199 - 2048 = 2097151 settori

#1.2 conversione da settori in bytes:
#(2097151 settori)(512 bytes) = 1,073,741,312 bytes  approssimato a 1 GiB


#2. dev/sdc2: dimostro <+15280191> per occupare il restante spazio del disco
#per la /dev/sdc2

#2.1 sottraggo ai bytes totali del disco, quelli della I partizione:
#7,823,458,304 - 1,073,741,312 = 6,749,716,992 bytes   disponibili

#2.2 conversione da bytes a settori
#(6,749,716,992 bytes)/(512 bytes) = 13183041 settori  disponibili

#2.3 Aggiungo alla fine della I partizione (aggiungendo 1 per non avere
#sovrapposizione), i settori necessari per la II partizione:
#(2099199 + 1) + 13183041 = 15282241 settori

#Infatti, a meno di piccoli scostamenti, ho coerenza tra i valori.


#3. Quindi se volessi avere una II partizione di 5 GiB, anziché di 6 GiB:

#3.1 conversione di 5 GiB in settori
#(5,000,000,000)/(512) = 9765625 settori 

#3.2 Aggiungo alla fine, maggiorata di uno, della I partizione i settori
#necessari alla II:
#2099200 + 9765625 = 11864825 settori

#3.3. esprimerò quindi <+11864825>

#:" partEnd01

## fdisk usa le virgole al posto del pto., per le cifre decimali.
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

read -p "Specifica l'etichetta che vuoi assegnare.

e.g. per filesystem ext3, ext4, xfs:
salvaMare

e.g. per i filesystem fat16, fat32 è preferibile usare il maiuscolo:
SALVAMARE

:" label

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


read -p "Specifica il filesystem tra i quattro:
ext3, ext4, fat16, fat32, xfs.

e.g.
xfs

:" filesystem


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
sleep 1


if test $partType == 1

then


echo -e "n
p
$fake
\r
$partEnd
q" | sudo fdisk $device > /tmp/valeparted-outputFdiskIstanza2

## * msdos
# Se ne rimangono più di una:
# <<Numero della partizione (3,4, default 3):>>

## * msdos
# Se ne rimane solo una di primaria:
# <<Selected partition 4>>

grep "Numero della partizione" /tmp/valeparted-outputFdiskIstanza2 > /tmp/valeparted-nPartioneOut01

stat --format %s /tmp/valeparted-nPartioneOut01 > /tmp/valeparted-nPartioneOut01Bytes

leggoByte=$(cat /tmp/valeparted-nPartioneOut01Bytes)

if test $leggoByte -gt 1

then

 cat /tmp/valeparted-nPartioneOut01 | awk '$1 > 0 {print $9}' > /tmp/valeparted-nPartioneDefault

 vi -c ":%s/)://" /tmp/valeparted-nPartioneDefault -c :w -c :q

 
else

grep "Selected partition" /tmp/valeparted-outputFdiskIstanza2 > /tmp/valeparted-nPartioneOut01

stat --format %s /tmp/valeparted-nPartioneOut01 > /tmp/valeparted-nPartioneOut01Bytes

leggoByte=$(cat /tmp/valeparted-nPartioneOut01Bytes)

if test $leggoByte -gt 1

then


cat /tmp/valeparted-nPartioneOut01 | awk '$1 > 0 {print $3}' > /tmp/valeparted-nPartioneDefault

else

	clear

	echo " "
	echo " "
	echo "Non riesco a selezionare la partizione di default,
       controlla il codice se compatibile con la nuova versione di fdisk o con il suo linguaggio.

       Infatti, in caso di ultima partizione primaria (la 4 sempre) fdisk comunica in inglese con
<<Selected partition 4>>, mentre in caso di partizioni primarie 1, 2, 3---comunica in italiano.

Uscita forzata."

exit

fi

fi


nPart=$(cat /tmp/valeparted-nPartioneDefault)


######## Test sviluppo
#exit OK

echo -e "n
p
$nPart
\r
$partEnd
w" | sudo fdisk $device > /tmp/valeparted-outputFdiskIstanza2



else

echo -e "n
e
\r
\r
$partEnd
q" | sudo fdisk $device > /tmp/valeparted-outputFdiskIstanza2

## * msdos
# Se ne rimangono più di una:
# <<Numero della partizione (3,4, default 3):>>

## * msdos
# Se ne rimane solo una di primaria:
# <<Selected partition 4>>

grep "Numero della partizione" /tmp/valeparted-outputFdiskIstanza2 > /tmp/valeparted-nPartioneOut01

stat --format %s /tmp/valeparted-nPartioneOut01 > /tmp/valeparted-nPartioneOut01Bytes

leggoByte=$(cat /tmp/valeparted-nPartioneOut01Bytes)

if test $leggoByte -gt 1

then

 cat /tmp/valeparted-nPartioneOut01 | awk '$1 > 0 {print $9}' > /tmp/valeparted-nPartioneDefault

 vi -c ":%s/)://" /tmp/valeparted-nPartioneDefault -c :w -c :q

 
else

cat /tmp/valeparted-nPartioneOut01 | awk '$1 > 0 {print $3}' > /tmp/valeparted-nPartioneDefault

fi

nPart=$(cat /tmp/valeparted-nPartioneDefault)


echo -e "n
e
$nPart
\r
$partEnd
w" | sudo fdisk $device 2> /dev/null


fi


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


sudo mkfs.$filesystem -F -L $label $myPart

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

sudo mkfs.$filesystem -F -L $label $myPart

sleep 3

fi


if test $filesystem == "fat16"
	then

sudo mkfs.vfat -F 16 -n $label $myPart

sleep 3

fi


if test $filesystem == "fat32"
	then

sudo mkfs.vfat -F 32 -n $label $myPart

sleep 3

fi


if test $filesystem == "xfs"
	then

sudo mkfs.$filesystem -f -L $label $myPart

sleep 3

fi

fi




if test $scelta == 3

then

echo -e "n
l 
q" | sudo fdisk $device > /tmp/valeParted-outputLogical

grep "Adding logical partition" /tmp/valeParted-outputLogical  | awk '$1 > 0 {print $4}' > /tmp/valeParted-outputLogicalN

nPart=$(cat /tmp/valeParted-outputLogicalN)

echo "$device-$nPart" > /tmp/valeParted-device

vi -c ":%s/-//g" /tmp/valeParted-device -c :w -c :q

cp /tmp/valeParted-device /tmp/valeParted-part

myPart="$(cat /tmp/valeParted-part)"

#grep "Last sector" /tmp/valeParted-outputLogical > /tmp/valeParted-outputLogicalSectors

## Sviluppo
#cat /tmp/valeParted-outputLogicalSectors

#read -p "Visiona le caratteristiche di sopra, premi Enter per continuare"

#echo " "
#read -p "Esprimi il settore di inizio per la nuova partizione logica
#interna all'estesa.


#e.g. se tu avessi:
#Disk /dev/sdc: 7.29 GiB, 7823458304 bytes, 15280192 sectors
#...
#Units: sectors of 1 * 512 = 512 bytes
#...

#Dispositivo Avvio   Start     Fine  Settori  Size Id Tipo
#/dev/sdc1            2048  2099199  2097152    1G 83 Linux
#/dev/sdc2         2099200 15280191 13180992  6.3G  5 Esteso

#First sector (2101248-15280191, default 2101248): Last sector, (2101248-15280191, default 15280191):

#allora come settore iniziale dovresti esprimere:
#2101248

#Dove: (2101248 sectors)(512 bytes) =  1,075,838,976 bytes = 1.07 GiB

#b) Se la nuova partizione invece occupasse tutta la partizione estesa, o occupasse
#i settori già occupati da un'altra partizione logica (all'interno dell'estesa),
#allora dovresti abbandonare tale istanza ora, perché ti occorrerebbe rimuovere
#la partizione logica già esistente.

#:" firstSector


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

#cat /tmp/valeParted-outputLogicalSectors

cat /tmp/valeParted-fdiskL

echo " "

echo " "

read -p "Visiona le caratteristiche di sopra, premi Enter per continuare" EnterNull

echo " "
echo " "
echo " "

read -p "Esprimi l'ultimo settore per la nuova partizione.

Attraverso i bytes (K,M,G,T,P).

e.g. prendendo l'esempio riportato in a), 2., per avere la /dev/sdc2 dovresti
digitare:
+6G
oppure se volessi ricorrerre ai numeri non interi:
+6.3G

:" partEnd01

##### Sviluppo

#read -p "Esprimi l'ultimo settore per la nuova partizione.

#a) Attraverso i bytes (K,M,G,T,P), nel tuo caso ha in totale:
#valore unità
#$leggoSizeValue $leggoSizeUnit

#e.g. prendendo l'esempio riportato in a), 2., per avere la /dev/sdc2 dovresti
#digitare:
#+6G
#oppure se volessi ricorrerre ai numeri non interi:
#+6.3G

#:"

#b) Attraverso i settori [Non testato].
#Nel tuo caso hai in totale:
#$lastSector



#e.g. se volessi creare una partizione /dev/sdc2 di 6 giga a dx
#della /dev/sdc1  di 1 giga [quest'ultima fissata al settore di inizio],
#dovresti digitare:
#	+15280191

#	e.g.
#Disk /dev/sdc: 7.29 GiB, 7823458304 bytes, 15280192 sectors
#...
#Units: sectors of 1 * 512 = 512 bytes
#[infatti (15280191 sectors)(512 bytes) = 7823457792 bytes = 7.82 GiB]
#...
#/dev/sdc1            2048  2099199  2097152    1G 83 Linux

#avresti alla fine di tale istanza:

#Dispositivo Avvio     Start      Fine     Settori   Size    Id   Tipo
#/dev/sdc1             2048      2099199   2097152   1G      83   Linux
#/dev/sdc2            2099200    15280191  13180992  6.3G    83   Linux


#Questo perché:

#1. /dev/sdc1: voglio 1 GiB per la I partizione:

#1.1 sottraggo alla fine della I partizione, i settori da cui inizia---
#i 2048 sono stabiliti di default come inizio della I partizione del disco:
#2099199 - 2048 = 2097151 settori

#1.2 conversione da settori in bytes:
#(2097151 settori)(512 bytes) = 1,073,741,312 bytes  approssimato a 1 GiB


#2. dev/sdc2: dimostro <+15280191> per occupare il restante spazio del disco
#per la /dev/sdc2

#2.1 sottraggo ai bytes totali del disco, quelli della I partizione:
#7,823,458,304 - 1,073,741,312 = 6,749,716,992 bytes   disponibili

#2.2 conversione da bytes a settori
#(6,749,716,992 bytes)/(512 bytes) = 13183041 settori  disponibili

#2.3 Aggiungo alla fine della I partizione (aggiungendo 1 per non avere
#sovrapposizione), i settori necessari per la II partizione:
#(2099199 + 1) + 13183041 = 15282241 settori

#Infatti, a meno di piccoli scostamenti, ho coerenza tra i valori.


#3. Quindi se volessi avere una II partizione di 5 GiB, anziché di 6 GiB:

#3.1 conversione di 5 GiB in settori
#(5,000,000,000)/(512) = 9765625 settori 

#3.2 Aggiungo alla fine, maggiorata di uno, della I partizione i settori
#necessari alla II:
#2099200 + 9765625 = 11864825 settori

#3.3. esprimerò quindi <+11864825>

#:" partEnd01

## fdisk usa la virgola al posto del pto., per le cifre decimali.
echo $partEnd01 > /tmp/valeparted-partEnd01

sed 's/\./,/g' /tmp/valeparted-partEnd01 > /tmp/valeparted-partEnd

partEnd="$(cat /tmp/valeparted-partEnd)"


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

read -p "Specifica l'etichetta che vuoi assegnare.

e.g. per filesystem ext3, ext4, xfs:
salvaMare

e.g. per i filesystem fat16, fat32 è preferibile usare il maiuscolo:
SALVAMARE

:" label

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

read -p "Specifica il filesystem tra i quattro:
ext3, ext4, fat16, fat32, xfs.

e.g.
xfs

:" filesystem


sleep 1



if test $filesystem == "ext3"
	then

		echo "Non digitare nulla fino alla fine delle operazioni di mke2fs,
non si riferisce a te il cursore che compare a dx dei due punti nelle voci
<<Creating journal:
Writing superblocks and filesystem accounting information:
>>" 
echo " "

sudo mkfs.$filesystem -F -L $label $myPart

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

sudo mkfs.$filesystem -F -L $label $myPart

sleep 3

fi


if test $filesystem == "fat16"
	then

sudo mkfs.vfat -F 16 -n $label $myPart

sleep 3

fi

if test $filesystem == "fat32"
	then

sudo mkfs.vfat -F 32 -n $label $myPart

sleep 3

fi

if test $filesystem == "xfs"
	then

sudo mkfs.$filesystem -f -L $label $myPart

sleep 3

fi

fi


if test $scelta == 4

then

	sudo wipefs --all $device

	sleep 3


echo -e "g
w" | sudo fdisk $device 2> /dev/null

fi

if test $scelta == 5

then

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

vi -c ":%s/)://" /tmp/valeparted-nPartioneDefault -c :w -c :q

fi

nPart=$(cat /tmp/valeparted-nPartioneDefault)

echo "$device-$nPart" > /tmp/valeParted-device

vi -c ":%s/-//g" /tmp/valeParted-device -c :w -c :q

cp /tmp/valeParted-device /tmp/valeParted-part

myPart="$(cat /tmp/valeParted-part)"


#### Sviluppo

# leggoListaPartizioni="$(cat /tmp/valeParted-sectorsList)"

# cat /tmp/valeParted-fdiskL | head -n1 | awk '$1 > 0 {print $7}' > /tmp/valeParted-sectors

# leggoSettoriTotali=$(cat /tmp/valeParted-sectors)

# lastSector=$(($leggoSettoriTotali - 1))


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


#grep "$device" /tmp/valeParted-fdiskL > /tmp/valeParted-sectorsList

#cat /tmp/valeParted-sectorsList | tr ':\n' '\n' > /tmp/valeParted-sectorsList1

#cat /tmp/valeParted-sectorsList1 | uniq > /tmp/valeParted-sectorsList2

#cat /tmp/valeParted-sectorsList2


#echo "Di seguito la lista delle partizioni, e settori del disco:"


#echo " "

#echo "In caso di partizioni già esistenti avrai, in ordine da sx verso dx:
#Dispositivo
#Avvio
#Start
#Fine
#Settori
#Size
#Id
#Tipo"


#read -p "Esprimi il settore di inizio per la nuova partizione,

#primo settore del device		ultimo settore del device:
#2048					$lastSector




#a) Se esistesse già una partizione non occupante tutto il device,
#e.g. /dev/sdc1 e tu volessi aggiungere la partizione /dev/sdc2; 

#e.g. se tu avessi:

#Disk /dev/sdc: 7.29 GiB, 7823458304 bytes, 15280192 sectors
#...
#Units: sectors of 1 * 512 = 512 bytes
#...
#Dispositivo Avvio     Start      Fine     Settori   Size    Id     Tipo
#/dev/sdc1             2048      2099199   2097152   1G      83     Linux


#allora come settore iniziale dovresti esprimere:
#2099200
#perché 2099200 = 2099199 + 1




#b) Se la partizione /dev/sdc1 invece occupasse tutto il device, o occupasse
#i settori in cui vorresti la nuova partizione: allora dovresti abbandonare
#tale istanza ora, perché ti occorrerebbe o rimuovere /dev/sdc1 o creare una
#nuova tabella msdos.

#:" firstSector

#cat /tmp/valeParted-fdiskL | head -n1 | awk '$1 > 0 {print $3}' > /tmp/valeParted-sizeValue

#cat /tmp/valeParted-fdiskL | head -n1 | awk '$1 > 0 {print $4}' > /tmp/valeParted-sizeUnit

#vi -c ":%s/,//g" /tmp/valeParted-sizeUnit -c :w -c :q

#leggoSizeValue=$(cat /tmp/valeParted-sizeValue)

#leggoSizeUnit=$(cat /tmp/valeParted-sizeUnit)




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

echo "Di seguito la lista delle partizioni, e settori del disco:"


echo " "

echo "In caso di partizioni già esistenti avrai:
Dispositivo Avvio     Start      Fine     Settori   Size    Id   Tipo"

echo " "
echo " "


grep "$device" /tmp/valeParted-fdiskL > /tmp/valeParted-sectorsList

cat /tmp/valeParted-sectorsList | tr ':\n' '\n' > /tmp/valeParted-sectorsList1

cat /tmp/valeParted-sectorsList1 | uniq > /tmp/valeParted-sectorsList2

cat /tmp/valeParted-sectorsList2

echo " "
echo " "

read -p "Visiona le caratteristiche di sopra, premi Enter per continuare" EnterNull

echo " "
echo " "
echo " "

read -p "Esprimi l'ultimo settore per la nuova partizione.

Attraverso i bytes (K,M,G,T,P).

e.g. prendendo l'esempio riportato in a), 2., per avere la /dev/sdc2 dovresti
digitare:
+6G
oppure se volessi ricorrerre ai numeri non interi:
+6.3G

:" partEnd01


##### Sviluppo

#read -p "Esprimi l'ultimo settore per la nuova partizione.

#a) Attraverso i bytes (K,M,G,T,P), nel tuo caso ha in totale:
#valore unità
#$leggoSizeValue $leggoSizeUnit

#e.g. prendendo l'esempio riportato in a), 2., per avere la /dev/sdc2 dovresti
#digitare:
#+6G
#oppure se volessi ricorrerre ai numeri non interi:
#+6.3G

#:"

#b) Attraverso i settori [Non testato].
#Nel tuo caso hai in totale:
#$lastSector



#e.g. se volessi creare una partizione /dev/sdc2 di 6 giga a dx
#della /dev/sdc1  di 1 giga [quest'ultima fissata al settore di inizio],
#dovresti digitare:
#	+15280191

#	e.g.
#Disk /dev/sdc: 7.29 GiB, 7823458304 bytes, 15280192 sectors
#...
#Units: sectors of 1 * 512 = 512 bytes
#[infatti (15280191 sectors)(512 bytes) = 7823457792 bytes = 7.82 GiB]
#...
#/dev/sdc1            2048  2099199  2097152    1G 83 Linux

#avresti alla fine di tale istanza:

#Dispositivo Avvio     Start      Fine     Settori   Size    Id   Tipo
#/dev/sdc1             2048      2099199   2097152   1G      83   Linux
#/dev/sdc2            2099200    15280191  13180992  6.3G    83   Linux


#Questo perché:

#1. /dev/sdc1: voglio 1 GiB per la I partizione:

#1.1 sottraggo alla fine della I partizione, i settori da cui inizia---
#i 2048 sono stabiliti di default come inizio della I partizione del disco:
#2099199 - 2048 = 2097151 settori

#1.2 conversione da settori in bytes:
#(2097151 settori)(512 bytes) = 1,073,741,312 bytes  approssimato a 1 GiB


#2. dev/sdc2: dimostro <+15280191> per occupare il restante spazio del disco
#per la /dev/sdc2

#2.1 sottraggo ai bytes totali del disco, quelli della I partizione:
#7,823,458,304 - 1,073,741,312 = 6,749,716,992 bytes   disponibili

#2.2 conversione da bytes a settori
#(6,749,716,992 bytes)/(512 bytes) = 13183041 settori  disponibili

#2.3 Aggiungo alla fine della I partizione (aggiungendo 1 per non avere
#sovrapposizione), i settori necessari per la II partizione:
#(2099199 + 1) + 13183041 = 15282241 settori

#Infatti, a meno di piccoli scostamenti, ho coerenza tra i valori.


#3. Quindi se volessi avere una II partizione di 5 GiB, anziché di 6 GiB:

#3.1 conversione di 5 GiB in settori
#(5,000,000,000)/(512) = 9765625 settori 

#3.2 Aggiungo alla fine, maggiorata di uno, della I partizione i settori
#necessari alla II:
#2099200 + 9765625 = 11864825 settori

#3.3. esprimerò quindi <+11864825>

#:" partEnd01

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

read -p "Specifica l'etichetta che vuoi assegnare.

e.g. per filesystem ext3, ext4, xfs:
salvaMare

e.g. per i filesystem fat16, fat32 è preferibile usare il maiuscolo:
SALVAMARE

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


read -p "Specifica il filesystem tra i quattro:
ext3, ext4, fat16, fat32, xfs.

e.g.
xfs

:" filesystem


echo -e "n
l 
$nPart
\r
$partEnd
w" | sudo fdisk $device

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


sudo mkfs.$filesystem -F -L $label $myPart

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


sudo mkfs.$filesystem -F -L $label $myPart

sleep 3

fi


if test $filesystem == "fat16"
	then

sudo mkfs.vfat -F 16 -n $label $myPart

sleep 3

fi

if test $filesystem == "fat32"
	then

sudo mkfs.vfat -F 32 -n $label $myPart

sleep 3

fi

if test $filesystem == "xfs"
	then

sudo mkfs.$filesystem -f -L $label $myPart

sleep 3

fi

fi

if test $scelta == 6

then

echo " "
echo " "
echo " "
echo " "
read -p "Specifica il numero della partizione.

:" nPart

echo "$device-$nPart" > /tmp/valeParted-device

vi -c ":%s/-//g" /tmp/valeParted-device -c :w -c :q

cp /tmp/valeParted-device /tmp/valeParted-part

myPart="$(cat /tmp/valeParted-part)"

sudo wipefs --all $myPart

sleep 5


echo -e "d
$nPart
w" | sudo fdisk $device


sleep 3


fi


sudo partprobe


sudo rm -r /tmp/ValeParted

sudo rm -r /tmp/valeParted*


### Aggiornamento di udev che partprobe intacca

lsblk > /dev/null


sudo systemctl restart systemd-udev-trigger.service 2> /dev/null

sleep 3

sudo systemctl restart systemd-udevd.service 2> /dev/null

sleep 3

lsblk > /dev/null




exit


