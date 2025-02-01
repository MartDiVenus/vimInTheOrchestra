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

#^^^^^^^^^^^^^ Scandaglio le azioni per eseguire gli script giusti.

for azioni in {1}

do

## azione --f (file iso da creare)
#
# if A.1
if [ -f /tmp/valeparted-fileName ]; then

	## l'azione --f combinata con le azioni --d e --nd 
	## mi creano un file iso nella posizione espressa da --f (il percorso prima del nome senza estensione)

	## se non esiste  /tmp/valeparted-fileName (azione --f) nel caso allora significa che voglio creare 
	# il file ISO nella stessa posizione del file da copiare. Infatti in d.sh ricorro a 
	# percorsoIsolato="$(cat /tmp/valentine-percorsoIsolato)"
outputFile=$(cat /tmp/valeparted-fileName)

cp /tmp/valeparted-dirName /tmp/valentine-fullName 

fullName=$(cat /tmp/valeparted-dirName)

/usr/local/share/valentine/trattamentoCartelle.sh

dirNameIsolata="$(cat /tmp/valentine-nomeCartellaIsolata)"

echo $dirNameIsolata > /tmp/valeparted-dirName

read -p "mart: Ti renderò ISO la directory 
$fullName 
in
$outputFile.iso

Se $fullName fosse presente in una partizione non di sistema,
allora dovresti montarla (rispettando il suddetto percorso)
prima di procedere premendo Enter.

Alla fine della sessione, montare per leggere il file ISO, eseguendo tale istanza:
sudo mount -o loop $outputFile.iso /mnt/valepartedMnt

smontare, eseguendo:
sudo umount /mnt/valepartedMnt

Puoi scegliere qualsiasi cartella di /mnt per montare/smontare,
l importante è le proprietà e i permessi siano ben impostati.

Premi Enter per continuare" EnterNull


/usr/local/share/valentine/diskParted/bash/Dir/f-d.sh


exit

break


fi


	## se non esiste /tmp/valeparted-fileName (-f), e non esiste /tmp/valeparted-dirName (--d)
       # allora significa che voglio creare il file ISO nella stessa posizione di ogni file da copiare
       # espresso nella lista.

       ## azione --nd

# if A.1.1
if [ -f /tmp/valeparted-listOfDirs ]; then 

	mkdir /tmp/valeparted-listOfDirsSplit

	leggoFileLista=$(cat /tmp/valeparted-listOfDirs)

	split -l1 $leggoFileLista /tmp/valeparted-listOfDirsSplit/


	for c in $(ls /tmp/valeparted-listOfDirsSplit)

	do 

		dirNameFull="$(cat /tmp/valeparted-listOfDirsSplit/$c)"

		echo $dirNameFull > /tmp/valentine-fullName 
	
/usr/local/share/valentine/trattamentoCartelle.sh

## Attenzione, in tale caso, non ho bisogno di nd, ho il ciclo che mi rende d.sh in nd.sh;

#/usr/local/share/valentine/diskParted/bash/Dir/nd.sh

/usr/local/share/valentine/diskParted/bash/Dir/d.sh
done

exit

break

fi


/usr/local/share/valentine/diskParted/bash/Dir/d.sh


done

# A.1

exit



