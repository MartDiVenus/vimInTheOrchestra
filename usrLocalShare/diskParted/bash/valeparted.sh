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

sudo rm -fr /tmp/valeparted*

echo $PWD > /tmp/pos

echo ""$*"" > /tmp/valeparted-options00

cat /tmp/valeparted-options00 | sed 's/-/dirin/g' > /tmp/valeparted-optionsAwk

awk '
{
    for (i = 1; i <= NF; i++) {
        if(NR == 1) {
            s[i] = $i;
        } else {
            s[i] = s[i] " " $i;
        }
    }
}
END {
    for (i = 1; s[i] != ""; i++) {
        print s[i];
    }
}' /tmp/valeparted-optionsAwk > /tmp/valeparted-options0

cat /tmp/valeparted-options0  | sed 's/dirin/-/g' > /tmp/valeparted-options



for a in {1}

do

grep "\-loop" /tmp/valeparted-options > /tmp/valeparted-optionsLoop00

stat --format %s /tmp/valeparted-optionsLoop00 > /tmp/valeparted-optionsLoop00Bytes

leggoBytes=$(cat /tmp/valeparted-optionsLoop00Bytes)

#	read -p "testing loop" EnterNull
if test $leggoBytes -gt 0

then
#	read -p "testing avvio loop" EnterNull
	/usr/local/share/valentine/diskParted/bash/Loop/valepartedLoop.sh

	exit

	break
fi

## Get a device like ISO file

grep "\--get=" /tmp/valeparted-options > /tmp/valeparted-optionsGet00

stat --format %s /tmp/valeparted-optionsGet00 > /tmp/valeparted-optionsGet00Bytes

leggoBytes=$(cat /tmp/valeparted-optionsGet00Bytes)

if test $leggoBytes -gt 0

then

	cat /tmp/valeparted-optionsGet00 | sed 's/--get=//g' > /tmp/valeparted-sourceDevice


	grep "\--f=" /tmp/valeparted-options > /tmp/valeparted-optionsF00

stat --format %s /tmp/valeparted-optionsF00 > /tmp/valeparted-optionsF00Bytes

leggoBytesF=$(cat /tmp/valeparted-optionsF00Bytes)

#	read -p "testing isol --f=" EnterNull
if test $leggoBytesF -gt 0

then

	cat /tmp/valeparted-optionsF00 | sed 's/--f=//g' > /tmp/valeparted-fileName

#		read -p "testing isol -f" EnterNull


/usr/local/share/valentine/diskParted/bash/Get/f-sc.sh

exit

break

else



#	read -p "testing avvio get" EnterNull
	/usr/local/share/valentine/diskParted/bash/Get/valepartedGet.sh

	exit

	break


fi
fi

## Get a dir like readable ISO file


grep "\--d=" /tmp/valeparted-options > /tmp/valeparted-optionsDirD00

stat --format %s /tmp/valeparted-optionsDirD00 > /tmp/valeparted-optionsDirD00Bytes

leggoBytesD=$(cat /tmp/valeparted-optionsDirD00Bytes)

if test $leggoBytesD -gt 0

then 
cat  /tmp/valeparted-optionsDirD00 | sed 's/--d=//g' > /tmp/valeparted-dirName

#	read -p "testing avvio loop" EnterNull
	/usr/local/share/valentine/diskParted/bash/Dir/valepartedDir.sh

	exit

	break
fi

grep "\--nd=" /tmp/valeparted-options > /tmp/valeparted-optionsDirNd00

stat --format %s /tmp/valeparted-optionsDirNd00 > /tmp/valeparted-optionsDirNd00Bytes

leggoBytesNd=$(cat /tmp/valeparted-optionsDirNd00Bytes)

if test $leggoBytesNd -gt 0

then 
cat  /tmp/valeparted-optionsDirNdD00 | sed 's/--nd=//g' > /tmp/valeparted-listOfDirs

	#	read -p "testing avvio loop" EnterNull
	/usr/local/share/valentine/diskParted/bash/Dir/valepartedDir.sh

	exit

	break
fi

grep "\-isol" /tmp/valeparted-options > /tmp/valeparted-optionsIsol00

stat --format %s /tmp/valeparted-optionsIsol00 > /tmp/valeparted-optionsIsol00Bytes

leggoBytes=$(cat /tmp/valeparted-optionsIsol00Bytes)

#	read -p "testing isol" EnterNull
if test $leggoBytes -gt 0

then


## file iso da creare

grep "\--f=" /tmp/valeparted-options > /tmp/valeparted-optionsF00

stat --format %s /tmp/valeparted-optionsF00 > /tmp/valeparted-optionsF00Bytes

leggoBytesF=$(cat /tmp/valeparted-optionsF00Bytes)

#	read -p "testing isol --f=" EnterNull
if test $leggoBytesF -gt 0

then

	cat /tmp/valeparted-optionsF00 | sed 's/--f=//g' > /tmp/valeparted-fileName

#		read -p "testing isol -f" EnterNull

fi

### In sola lettura
grep "\-r" /tmp/valeparted-options > /tmp/valeparted-optionsR00

stat --format %s /tmp/valeparted-optionsR00 > /tmp/valeparted-optionsR00Bytes

leggoBytesR=$(cat /tmp/valeparted-optionsR00Bytes)

#	read -p "testing isol --f" EnterNull
if test $leggoBytesR -gt 0

then

	cat /tmp/valeparted-optionsR00 | sed 's/-r//g' > /tmp/valeparted-solaLettura

#		read -p "testing isol --f" EnterNull

fi

### In lettura e scrittura
grep "\-w" /tmp/valeparted-options > /tmp/valeparted-optionsW00

stat --format %s /tmp/valeparted-optionsW00 > /tmp/valeparted-optionsW00Bytes

leggoBytesW=$(cat /tmp/valeparted-optionsW00Bytes)

#	read -p "testing isol -f" EnterNull
if test $leggoBytesW -gt 0

then

	cat /tmp/valeparted-optionsW00 | sed 's/-w//g' > /tmp/valeparted-letturaEtScrittura

#		read -p "testing isol -f" EnterNull

fi

## se invece di esprimere un file, esprimessi un file contenente la lista di file ISO da creare
grep "\--l=" /tmp/valeparted-options > /tmp/valeparted-optionsL00

stat --format %s /tmp/valeparted-optionsL00 > /tmp/valeparted-optionsL00Bytes

leggoBytesI=$(cat /tmp/valeparted-optionsL00Bytes)

#	read -p "testing isol --l" EnterNull
if test $leggoBytesI -gt 0

then

	cat /tmp/valeparted-optionsL00 | sed 's/--l=//g' > /tmp/valeparted-fileIngresso
#	read -p "testing isol --l" EnterNull

fi

## file che sarà copiato nella iso

grep "\--sc=" /tmp/valeparted-options > /tmp/valeparted-optionsSC00

stat --format %s /tmp/valeparted-optionsSC00 > /tmp/valeparted-optionsSC00Bytes

leggoBytesSC=$(cat /tmp/valeparted-optionsSC00Bytes)

#	read -p "testing isol --sc" EnterNull
if test $leggoBytesSC -gt 0

then

	cat /tmp/valeparted-optionsSC00 | sed 's/--sc=//g' > /tmp/valeparted-fileNameToCopy
#	read -p "testing isol --sc" EnterNull

fi

## file contenente la lista dei file che saranno copiati nella iso

grep "\--scl" /tmp/valeparted-options > /tmp/valeparted-optionsSCL00

stat --format %s /tmp/valeparted-optionsSCL00 > /tmp/valeparted-optionsSCL00Bytes

leggoBytesSCL=$(cat /tmp/valeparted-optionsSCL00Bytes)

#	read -p "testing isol --scl" EnterNull
if test $leggoBytesSCL -gt 0

then

	cat /tmp/valeparted-optionsSCL00 | sed 's/--scl=//g' > /tmp/valeparted-listOfFilesToCopy
#	read -p "testing isol --scl" EnterNull

fi

## file contenente la lista dei file che saranno copiati nella iso

grep "\-del" /tmp/valeparted-options > /tmp/valeparted-optionsDel00

stat --format %s /tmp/valeparted-optionsDel00 > /tmp/valeparted-optionsDel00Bytes

leggoBytesDel=$(cat /tmp/valeparted-optionsDel00Bytes)

#	read -p "testing isol -del" EnterNull
if test $leggoBytesDel -gt 0

then

	cat /tmp/valeparted-optionsDel00 > /tmp/valeparted-delCopiedFiles
#	read -p "testing isol -del" EnterNull

fi


#	read -p "testing lancio ISOL" EnterNull
	/usr/local/share/valentine/diskParted/bash/ISOL/valepartedISOL.sh

	exit

	break

fi


grep "\-isor" /tmp/valeparted-options > /tmp/valeparted-optionsIsor00

stat --format %s /tmp/valeparted-optionsIsor00 > /tmp/valeparted-optionsIsor00Bytes

leggoBytes=$(cat /tmp/valeparted-optionsIsor00Bytes)

#	read -p "testing isor" EnterNull
if test $leggoBytes -gt 0

then


	echo "isor" > /tmp/valeparted-optionLoop



grep "\--dev" /tmp/valeparted-options > /tmp/valeparted-optionsDev00

stat --format %s /tmp/valeparted-optionsDev00 > /tmp/valeparted-optionsDev00Bytes

leggoBytesDev=$(cat /tmp/valeparted-optionsDev00Bytes)

#	read -p "testing isor --dev" EnterNull
if test $leggoBytesDev -gt 0

then

	cat /tmp/valeparted-optionsDev00 | sed 's/--dev=//g' > /tmp/valeparted-dev
#	read -p "testing isor --dev" EnterNull

fi

grep "\--f=" /tmp/valeparted-options > /tmp/valeparted-optionsF00

stat --format %s /tmp/valeparted-optionsF00 > /tmp/valeparted-optionsF00Bytes

leggoBytesF=$(cat /tmp/valeparted-optionsF00Bytes)

#	read -p "testing isor --f" EnterNull
if test $leggoBytesF -gt 0

then

	cat /tmp/valeparted-optionsF00 | sed 's/--f=//g' > /tmp/valeparted-fileName
#	read -p "testing isor --f" EnterNull

fi
### In sola lettura
grep "\-r" /tmp/valeparted-options > /tmp/valeparted-optionsR00

stat --format %s /tmp/valeparted-optionsR00 > /tmp/valeparted-optionsR00Bytes

leggoBytesR=$(cat /tmp/valeparted-optionsR00Bytes)

#	read -p "testing isol --f" EnterNull
if test $leggoBytesR -gt 0

then

	cat /tmp/valeparted-optionsR00 | sed 's/-r//g' > /tmp/valeparted-solaLettura

#		read -p "testing isol --f" EnterNull

fi

### In lettura e scrittura
grep "\-w" /tmp/valeparted-options > /tmp/valeparted-optionsW00

stat --format %s /tmp/valeparted-optionsW00 > /tmp/valeparted-optionsW00Bytes

leggoBytesW=$(cat /tmp/valeparted-optionsW00Bytes)

#	read -p "testing isol --f" EnterNull
if test $leggoBytesW -gt 0

then

	cat /tmp/valeparted-optionsW00 | sed 's/-w//g' > /tmp/valeparted-letturaEtScrittura

#		read -p "testing isol -f" EnterNull

fi

## se invece di esprimere un file, esprimessi un file contenente la lista di file ISO da creare
grep "\--l=" /tmp/valeparted-options > /tmp/valeparted-optionsL00

stat --format %s /tmp/valeparted-optionsL00 > /tmp/valeparted-optionsL00Bytes

leggoBytesI=$(cat /tmp/valeparted-optionsL00Bytes)

#	read -p "testing isor --l" EnterNull
if test $leggoBytesI -gt 0

then

	cat /tmp/valeparted-optionsL00 | sed 's/--l=//g' > /tmp/valeparted-fileIngresso
#	read -p "testing isor --l" EnterNull

fi


## file che sarà copiato nella iso

grep "\--sc=" /tmp/valeparted-options > /tmp/valeparted-optionsSC00

stat --format %s /tmp/valeparted-optionsSC00 > /tmp/valeparted-optionsSC00Bytes

leggoBytesSC=$(cat /tmp/valeparted-optionsSC00Bytes)

#	read -p "testing isol --sc" EnterNull
if test $leggoBytesSC -gt 0

then

	cat /tmp/valeparted-optionsSC00 | sed 's/--sc=//g' > /tmp/valeparted-fileNameToCopy
#	read -p "testing isol --sc" EnterNull

fi

## file contenente la lista dei file che saranno copiati nella iso

grep "\--scl" /tmp/valeparted-options > /tmp/valeparted-optionsSCL00

stat --format %s /tmp/valeparted-optionsSCL00 > /tmp/valeparted-optionsSCL00Bytes

leggoBytesSCL=$(cat /tmp/valeparted-optionsSCL00Bytes)

#	read -p "testing isol --scl" EnterNull
if test $leggoBytesSCL -gt 0

then

	cat /tmp/valeparted-optionsSCL00 | sed 's/--scl=//g' > /tmp/valeparted-listOfFilesToCopy
#	read -p "testing isol --scl" EnterNull

fi

## file contenente la lista dei file che saranno copiati nella iso

grep "\-del" /tmp/valeparted-options > /tmp/valeparted-optionsDel00

stat --format %s /tmp/valeparted-optionsDel00 > /tmp/valeparted-optionsDel00Bytes

leggoBytesDel=$(cat /tmp/valeparted-optionsDel00Bytes)

#	read -p "testing isol -del" EnterNull
if test $leggoBytesDel -gt 0

then

	cat /tmp/valeparted-optionsDel00 > /tmp/valeparted-delCopiedFiles
#read -p "testing isol -del" EnterNull

fi


#	read -p "testing lancio ISOR" EnterNull

	/usr/local/share/valentine/diskParted/bash/ISOR/valepartedISOR.sh

	exit

	break

fi


grep "\-h" /tmp/valeparted-options > /tmp/valeparted-optionsH00

stat --format %s /tmp/valeparted-optionsH00 > /tmp/valeparted-optionsH00Bytes

leggoBytes=$(cat /tmp/valeparted-optionsH00Bytes)

#	read -p "testing -h" EnterNull
if test $leggoBytes -gt 0

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
echo "
Name: Valeparted"
echo "
Goal: Bash script about netrw/fdisk based disk partition table manipulation, loop
device creation, ISO file creatione."
echo " "
		echo " "
echo "help									-h"
echo " "
echo "Without option:  disk partition table manipulation"				        
echo " "
echo " "
echo "Create a ISO file from a source device					--get='Value'"
echo " "
echo " "
echo "Create a ISO file (only readable) from a filesystem directory:		"
echo "Source directory for ISO file						--d='Value'"
echo "List of source directory for ISO files					--nd='Value'"
echo " "
echo " "
echo "file (without extension) that will be the ISO file			--f='Value'"
echo " "
echo " "
echo "Create a ISO file	by a loop (virtual) device				-isol"
echo " "
echo " "
echo "Create a file ISO	by a physical device					-isor"
echo " "
echo " "
echo "Only for -isor: Physical device to create a ISO file			--dev='Value'"
echo " "
echo " "
echo "file having list of files will be the ISO file				--l='Value'"
echo " "
echo " "
echo "facultative: ISO file only readable					-r"
echo " "
echo "facultative: ISO file readable and writeable				-w"
echo " "
echo " "
echo "facultative: file to copy in ISO file					--sc='Value'"
echo "e.g.
-sc=/home/mart/test/a.txt
cat list.txt
/home/mart/test/a.txt
"
echo " "
echo " "
echo "facultative: file having list of files to copy in ISO file		--scl='Value'"
echo "--scl=/home/mart/test/list.txt
cat /home/mart/test/list.txt
/home/mart/test/a.txt
/home/mart/test/b.txt

or, selecting files by ValeNetrw:
cp /tmp/valeNetrw-SMarked /home/mart/test/list.txt
or, directly:
--scl=/tmp/valeNetrw-SMarked
"
echo " "
echo " "
echo "Create loop device (loop partition)					-loop"
echo "Usage:
valeparted -option -f<Value>"
echo " "
echo "e.g.:

Manipolazione della tabella delle partizioni, informazioni sulle partizioni.
~$> valeparted

Crea immagine iso da un device sorgente (CD-ROM, chiavetta, partizione hd)
~$> valeparted --get=/dev/sdc1 --f=/home/user/a

Crea immagine iso /home/user/a.iso dalla directory del filesystem /home/mart/test2
~$> valeparted -d/home/mart/test2 --f=/home/user/a

Crea immagine iso /home/mart/test2.iso dalla directory del filesystem /home/mart/test2
~$> valeparted --d=/home/mart/test2 

Crea immagine iso da una lista di directory del filesystem
~$> valeparted --nd=/home/mart/list.txt




Crea immagine iso, in scrittura e lettura, vuota /home/user/a.iso
~$> valeparted -isol -w --f=/home/user/a


Crea immagine iso, in sola lettura, vuota /home/user/a.iso
~$> valeparted -isol -r --f=/home/user/a

Potrai applicare le opzioni -r. -w anche nei prossimi esempi


Crea immagine iso /home/user/a.iso al cui interno è presente /home/user/test/fileToCopyIntoISO.txt
~$> valeparted -isol --f=/home/user/a --sc=/home/user/test/fileToCopyIntoISO.txt


Nel prox esempio creo la iso nella stessa posizione del file che essa conterrà.

Crea immagine iso /home/user/test/fileToCopyIntoISO.iso al cui interno è presente
/home/user/test/fileToCopyIntoISO.txt
~$> valeparted -isol --sc=/home/user/test/fileToCopyIntoISO.txt


Nel prox esempio creo la iso nella stessa posizione del file che essa conterrà, e rimuovo
quest ultimo. Questa istanza dovrebbe essere la più abituale, previo testing svolto
accuratamente del codice.

Crea immagine iso /home/user/test/fileToCopyIntoISO.iso al cui interno è presente
/home/user/test/fileToCopyIntoISO.txt, e rimuovi /home/user/test/fileToCopyIntoISO.txt
~$> valeparted -isol --sc=/home/user/test/fileToCopyIntoISO.txt -del



Crea multipli file ISO specificati, uno per ogni riga, in
/home/user/test/listISO.txt

e copia in essi i file specificati, uno per ogni riga, in 
/home/user/test/listOfFileToCopyIntoISO.txt

~$> valeparted -isol -l/home/user/test/listISO.txt --scl=/home/user/test/listOfFileToCopyIntoISO.txt



Apparentemente non avrebbe molto senso copiare lo stesso file in file ISO differenti,
invece potrebbe rivelarsi utile nel caso in cui si volessero aggiornare i file ISO in futuro e
ritrovarsi una base assegnata.

~$> valeparted -isol -l/home/user/test/listISO.txt --sc=/home/user/test/FileToCopyIntoISO.txt



Similmente per -isor, e di seguito altre opzioni:

Se non esprimessi alcun --dev, ti verrebbe chiesto durante l'esecuzione. 
Per file ISO singoli da creare, consiglio di non esprimerlo, in modo da sfruttare pienamente valeparted.

Invece per creare file ISO multipli in un'unica sessione, consiglio di specificare --dev='Value'.


~$> valeparted -isor --f=/home/user/a

~$> valeparted -isor --f=/home/user/a --sc=/home/user/test/fileToCopyIntoISO.txt

~$> valeparted -isor --dev=/dev/sda3 -l/home/user/test/listISO.txt

~$> valeparted -isor --dev=/dev/sda3 -l/home/user/test/listISO.txt --scl=/home/user/test/listOfFileToCopyIntoISO.txt


crea solo un disco loop
~$> valeparted -loop


Montaggio:
sudo mount 'discoLoopCreato' /mnt/valepartedMnt o qualsiasi altra cartella di /mnt,
sempre che sia ben impostata con le proprieàt e i permessi

Smontaggio:
sudo umount 'discoLoopCreato'
vel
sudo umount /mnt/valepartedMnt
vel
sudo umount /mnt/'folder'

Copyright:
Copyright (C) 2023.08.29 Mario Fantini (ing.mariofantini@gmail.com).
Bash copyright applies to its Mario Fantini's pseudo options.
GNU copyright applies to its Mario Fantini's GNU tools usage.
And so on.
"

	exit
break

fi

done

#if [ -f /tmp/valeparted-optionLoop ]; then

#	exit
#fi

#read -p "47 valeparted"

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

/usr/local/share/valentine/diskParted/bash/valeparted02.sh

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


sudo partprobe 2> /dev/null


sudo rm -r /tmp/ValeParted

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


rm -fr ~/.vim/plugin/Valentine/netrw/commands/valeparted

rm -fr /tmp/valeNetrw*



exit

