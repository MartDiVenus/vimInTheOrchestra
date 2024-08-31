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

#^^^^^^^^^^^^^ Scandaglio le opzioni per eseguire gli script giusti.

## opzione -f (file iso da creare)
if [ -f /tmp/valeparted-fileName ]; then

	## l'opzione -f combinata con le opzioni --d e --nd 
	## mi creano un file iso nella posizione espressa da -f (il percorso prima del nome senza estensione)
	
	## opzione -d (file da copiare nel file ISO)
if [ -f /tmp/valeparted-dirName ]; then 

/usr/local/share/valentine/diskParted/bash/Dir/f-d.sh

else

	## opzione -f
echo "Non hai espresso alcuna opzione tra -f, --d, --nd.
Uscita forzata"

exit

fi


else
	## se non esiste  /tmp/valeparted-fileName (opzione -f) nel caso allora significa che voglio creare 
	# il file ISO nella stessa posizione del file da copiare. Infatti in d.sh ricorro a 
	# percorsoIsolato="$(cat /tmp/valentine-percorsoIsolato)"

	## opzione -d
if [ -f /tmp/valeparted-dirName ]; then 


	cp /tmp/valeparted-dirName /tmp/valentine-fullName 
/usr/local/share/valentine/trattamentoCartelle.sh

	dirName="$(cat /tmp/valentine-nomeCartellaIsolata)"

	echo $dirName > /tmp/valeparted-dirName

read -p "mart: Ti renderò ISO la directory 
$dirName in
$dirName.iso

Se $dirName fosse presente in una partizione non di sistema,
allora dovresti montarla (rispettando il suddetto percorso)
prima di procedere premendo Enter.

Alla fine della sessione, montare per leggere il file ISO, eseguendo tale istanza:
sudo mount -o loop $dirName.iso /mnt/valepartedMnt

smontare, eseguendo:
sudo umount /mnt/valepartedMnt

Puoi scegliere qualsiasi cartella di /mnt per montare/smontare,
l importante è le proprietà e i permessi siano ben impostati.

Premi Enter per continuare" EnterNull


	/usr/local/share/valentine/diskParted/bash/Dir/d.sh

else
	## se non esiste /tmp/valeparted-fileName (-f), e non esiste /tmp/valeparted-dirName (--d)
       # allora significa che voglio creare il file ISO nella stessa posizione di ogni file da copiare
       # espresso nella lista.

       ## opzione -nd
if [ -f /tmp/valeparted-listOfDirs ]; then 

		mkdir /tmp/valeparted-listOfDirsSplit

	split -l1 /tmp/valeparted-listOfDirs /tmp/valeparted-listOfDirsSplit/


	for c in $(ls /tmp/valeparted-listOfDirsSplit)

	do 

		dirName="$(cat /tmp/valeparted-listOfDirsSplit/$c)"

		echo $dirName > /tmp/valeparted-dirName

		cp /tmp/valeparted-dirName /tmp/valentine-fullName 
	
/usr/local/share/valentine/trattamentoCartelle.sh

	dirName="$(cat /tmp/valentine-nomeCartellaIsolata)"

	echo $dirName > /tmp/valeparted-dirName

	
## Attenzione, in tale caso, non ho bisogno di nd, ho il ciclo che mi rende d.sh in nd.sh;

#/usr/local/share/valentine/diskParted/bash/Dir/nd.sh

/usr/local/share/valentine/diskParted/bash/Dir/d.sh
done

else
	echo "Non hai fornito né l opzione -f, né l'opzione --d, né l'opzione --nd.
Chiusura forzata."

exit

fi

fi


exit



