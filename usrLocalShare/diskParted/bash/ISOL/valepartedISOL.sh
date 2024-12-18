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

#^^^^^^^^^^^^^ Scandaglio le opzioni per eseguire gli script giusti.

## opzione -f (file iso da creare)
if [ -f /tmp/valeparted-fileName ]; then

	## l'opzione -f combinata con le opzioni --sc e --scl 
	## mi creano un file iso nella posizione espressa da -f (il percorso prima del nome senza estensione)
	
	## opzione --sc (file da copiare nel file ISO)
if [ -f /tmp/valeparted-fileNameToCopy ]; then 

/usr/local/share/valentine/diskParted/bash/ISOL/f-sc.sh

else

	## opzione --scl (lista di file ISO da copiare nel file ISO)
if [ -f /tmp/valeparted-listOfFilesToCopy ]; then 
/usr/local/share/valentine/diskParted/bash/ISOL/f-scl.sh

else

	## opzione -f
/usr/local/share/valentine/diskParted/bash/ISOL/f.sh

fi

fi

else
	## se non esiste  /tmp/valeparted-fileName (opzione -f) allora significa che voglio creare 
	# il file ISO nella stessa posizione del file da copiare.

	## opzione --sc
if [ -f /tmp/valeparted-fileNameToCopy ]; then 

/usr/local/share/valentine/diskParted/bash/ISOL/sc.sh

	cp /tmp/valeparted-fileNameToCopy /tmp/valentine-fullName 
/usr/local/share/valentine/trattamentoFiles.sh

	nomeFileDaCopiareSenzaEstensione="$(cat /tmp/valentine-nomeSenzaEstensione)"

	echo $nomeFileDaCopiareSenzaEstensione > /tmp/valeparted-fileName

else
	## se non esiste /tmp/valeparted-fileName (-f), e non esiste /tmp/valeparted-fileNameToCopy (--sc)
       # allora significa che voglio creare il file ISO nella stessa posizione di ogni file da copiare
       # espresso nella lista.

       ## opzione --scl
if [ -f /tmp/valeparted-listOfFilesToCopy ]; then 

		mkdir /tmp/valeparted-listOfFilesToCopySplit

	split -l1 /tmp/valeparted-listOfFilesToCopy /tmp/valeparted-listOfFilesToCopySplit/

	if [ -f /tmp/valeparted-solaLettura ]; then

read -p "mart: Se i file da copiare fossero presenti in una partizione non di sistema,
allora dovresti montarla (rispettando il suddetto percorso)
prima di procedere premendo Enter.


Alla fine della copia ti lascerò montato il file *.iso 
affinché tu possa caricarlo di ulteriori contenuti.

Ti aprirò  una finestra di ValeNetrw per facilitarti
la scrittura/copia dei contenuti, ti ricordo che solo in tale
sessione potrai scrivere il file ISO; in futuro potrai solo
leggerne i contenuti (si comporta come un CD-ROM).

Potrai in qualsiasi momento:

montare per leggere il file ISO, eseguendo tale istanza:
sudo mount -o loop $fileName.iso /mnt/valepartedMnt

smontare, eseguendo:
sudo umount /mnt/valepartedMnt

Puoi scegliere qualsiasi cartella di /mnt per montare/smontare,
l importante è le proprietà e i permessi siano ben impostati.

Premi Enter per continuare" EnterNull

else

	read -p "mart: Se i file da copiare fossero presenti in una partizione non di sistema,
allora dovresti montarla (rispettando il suddetto percorso)
prima di procedere premendo Enter.


Alla fine della copia ti lascerò montato il file *.iso 
affinché tu possa caricarlo di ulteriori contenuti.

Ti aprirò  una finestra di ValeNetrw per facilitarti
la scrittura/copia dei contenuti, ti ricordo che potrai aggiornare
il file ISO in qualsiasi momento montandolo, scrivendo/copiando e smontandolo.

Potrai in qualsiasi momento:

montare per leggere il file ISO, eseguendo tale istanza:
sudo mount -o loop $fileName.iso /mnt/valepartedMnt

smontare, eseguendo:
sudo umount /mnt/valepartedMnt

Puoi scegliere qualsiasi cartella di /mnt per montare/smontare,
l importante è le proprietà e i permessi siano ben impostati.

Premi Enter per continuare" EnterNull

fi

for c in $(ls /tmp/valeparted-listOfFilesToCopySplit)

	do 

		fileNameToCopy="$(cat /tmp/valeparted-listOfFilesToCopySplit/$c)"

		echo $fileNameToCopy > /tmp/valeparted-fileNameToCopy

		cp /tmp/valeparted-fileNameToCopy /tmp/valentine-fullName 
	
/usr/local/share/valentine/trattamentoFiles.sh

	
		nomeFileDaCopiareSenzaEstensione="$(cat /tmp/valentine-nomeSenzaEstensione)"
	
		echo $nomeFileDaCopiareSenzaEstensione > /tmp/valeparted-fileName

## Attenzione, in tale caso, non ho bisogno di scl, ho il ciclo che mi rende sc.sh in scl.sh;
## ciò, però, non accade quando le opzioni -f e --scl sono espresse contemporaneamente.

#/usr/local/share/valentine/diskParted/bash/ISOL/scl.sh

/usr/local/share/valentine/diskParted/bash/ISOL/sc.sh
done

else
	echo "Non hai fornito né l opzione -f, né l'opzione --sc, né l'opzione --scl.
Chiusura forzata."

exit

fi

fi

## opzione -l (lista di file ISO da creare)
if [ -f /tmp/valeparted-fileIngresso ]; then

	mkdir /tmp/valeparted-fileIngressoSplit

	split -l1 /tmp/valeparted-fileIngresso /tmp/valeparted-fileIngressoSplit/


	for c in $(ls /tmp/valeparted-fileIngressoSplit)

	do 

		fileName="$(cat /tmp/valeparted-fileIngressoSplit/$c)"

		echo $fileName > /tmp/valeparted-fileName


#Apparentemente non avrebbe molto senso copiare lo stesso file in file ISO differenti,
#invece potrebbe rivelarsi utile nel caso in cui si volessero aggiornare i file ISO in futuro e
#ritrovarsi una base assegnata.
		if [ -f /tmp/valeparted-fileNameToCopy ]; then 

/usr/local/share/valentine/diskParted/bash/ISOL/f-sc.sh

else

if [ -f /tmp/valeparted-listOfFilesToCopy ]; then 
/usr/local/share/valentine/diskParted/bash/ISOL/f-scl.sh

fi

fi

	done

fi

exit



