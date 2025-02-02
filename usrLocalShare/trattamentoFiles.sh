#!/bin/bash

cp /tmp/valentine-fullName /tmp/valentine-fullNameBackup


cat /tmp/valentine-fullNameBackup | sed 's/\// /g' > /tmp/valentine-sostSlashBlank

sed 's/[^ ]//g' /tmp/valentine-sostSlashBlank | awk '{ print length }' > /tmp/valentine-colC.txt

numberOfColumn=$(cat /tmp/valentine-colC.txt)

sed 's/[^/]//g' /tmp/valentine-fullName | awk '{ print length }' > /tmp/valentine-countSlash


leggoCountSlash=$(cat /tmp/valentine-countSlash)


#read -p "18 testing" EnterNull

if test $leggoCountSlash == 0

then

cat /tmp/valentine-fullNameBackup  > /tmp/valentine-nomeFileIsolato

# testing
#echo " "
#echo "nome file isolato"
#cat /tmp/valentine-nomeFileIsolato


# nome file senza estensione
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
cat /tmp/valentine-nomeFileIsolato | sed 's/\./ /g' > /tmp/valentine-nomeSenzaEstensionePre
## il I campo è il nome senza estensione
cat /tmp/valentine-nomeSenzaEstensionePre | awk '$1 > 0 {print $1}' > /tmp/valentine-nomeSenzaEstensione
cat /tmp/valentine-nomeSenzaEstensionePre | awk '$1 > 0 {print $2}' > /tmp/valentine-tipoEstensione


#read -p "43 testing" EnterNull


# testing
#echo " "
#echo "nome senza estensione"
#cat /tmp/valentine-nomeSenzaEstensione

# testing
#echo " "

echo "$PWD" > /tmp/valentine-percorsoIsolato

else

if test $leggoCountSlash == 1

then


# dopo l'ultima /
# selezione il nome del file
cat /tmp/valentine-fullNameBackup |sed 's/.*\///' > /tmp/valentine-nomeFileIsolato
# testing
#echo " "
#echo "nome file isoltato"
#cat /tmp/valentine-nomeFileIsolato


# nome file senza estensione
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
cat /tmp/valentine-nomeFileIsolato | sed 's/\./ /g' > /tmp/valentine-nomeSenzaEstensionePre
## il I campo è il nome senza estensione
cat /tmp/valentine-nomeSenzaEstensionePre | awk '$1 > 0 {print $1}' > /tmp/valentine-nomeSenzaEstensione
cat /tmp/valentine-nomeSenzaEstensionePre | awk '$1 > 0 {print $2}' > /tmp/valentine-tipoEstensione
#read -p "testing 80" EnterNull

# testing
#echo " "
#echo "nome senza estensione"
#cat /tmp/valentine-nomeSenzaEstensione


### Percorso isolato


## prima dell'ultima / non funziona in caso di più /, quindi ricorro al nome del file
# cat /tmp/valentine-fullNameBackup |sed 's/\/.*//' > /tmp/valentine-percorsoIsolato


## esprimendo il nome del file non funziona in caso di omonimia tra nome file e una cartella,
# e.g. prova/prova
# seleziono il percorso privo del nome del file
# nomeFile="$(cat /tmp/valentine-nomeFileIsolato)"
## l'ultimo sed elimina l'ultima /, comodo per esprimere la variabile $pathIsolato in codici esterni
## isolandola da ciò che viene a dx, e.g. $pathIsolato/prova.txt
#cat /tmp/valentine-fullNameBackup  |sed 's/'$nomeFile'.*//'  | sed 's/\/$//g' > /tmp/valentine-percorsoIsolato


## devo capire se ho 
# e.g. a/b
# ho una slash e due colonne
# o e.g. /a
# ho una slash  1 colonna


## se eliminando il primo carattere, il numero di colonne cambia significa che lo spazio
# è all'inizio del file, quindi che il percorso è la radice del file system

cp /tmp/valentine-sostSlashBlank /tmp/valentine-sostSlashBlankRadix

vim -c ":1,1s/^.//g" /tmp/valentine-sostSlashBlankRadix -c :w -c :q

sed 's/[^ ]//g' /tmp/valentine-sostSlashBlankRadix | awk '{ print length }' > /tmp/valentine-colCRadix.txt

	# qua 
numberOfColumnRadix=$(cat /tmp/valentine-colCRadix.txt)

if test ! $numberOfColumn -eq $numberOfColumnRadix

then

	echo "/" > /tmp/valentine-percorsoIsolato 
# testing
#echo " "
#echo "percorso isolato è la radice del file system e.g. /b"
#cat /tmp/valentine-percorsoIsolato

else

	# il percorso è a sx della /

cat /tmp/valentine-fullNameBackup | cut -d/ -f1,"$numberOfColumn" > /tmp/valentine-percorsoIsolato

# testing
#echo " "
#echo "percorso isolato e.g. a/b"
#cat /tmp/valentine-percorsoIsolato

fi
	# testing 
#	 read -p "sto a 90" EnterNull
else
	## significa che il numero di slash è maggiore di 1


	## devo capire di nuovo se ho 
# e.g. a/b/c
# ho due slash e tre colonne
# o e.g. /a/b/c
# ho tre slash e tre colonna


## se eliminando il primo carattere, il numero di colonne cambia significa che lo spazio
# è all'inizio del file, quindi che il percorso è la radice del file system

cp /tmp/valentine-sostSlashBlank /tmp/valentine-sostSlashBlankRadix

vim -c ":1,1s/^.//g" /tmp/valentine-sostSlashBlankRadix -c :w -c :q

sed 's/[^ ]//g' /tmp/valentine-sostSlashBlankRadix | awk '{ print length }' > /tmp/valentine-colCRadix.txt

	# qua 
numberOfColumnRadix=$(cat /tmp/valentine-colCRadix.txt)

if test ! $numberOfColumn -eq $numberOfColumnRadix

then

# dopo l'ultima /
# selezione il nome del file
cat /tmp/valentine-fullNameBackup |sed 's/.*\///' > /tmp/valentine-nomeFileIsolato
# testing
#echo " "
#echo "nome file isoltato"
#cat /tmp/valentine-nomeFileIsolato
#read -p "testing 181" EnterNull

# nome file senza estensione
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
#vi -s /usr/local/lib/valentine/command-sost-pto /tmp/valentine-nomeFileIsolato
cat /tmp/valentine-nomeFileIsolato | sed 's/\./ /g' > /tmp/valentine-nomeSenzaEstensionePre
#read -p "testing 187" EnterNull

## il I campo è il nome senza estensione
cat /tmp/valentine-nomeSenzaEstensionePre | awk '$1 > 0 {print $1}' > /tmp/valentine-nomeSenzaEstensione
cat /tmp/valentine-nomeSenzaEstensionePre | awk '$1 > 0 {print $2}' > /tmp/valentine-tipoEstensione

# testing
#echo " "
#echo "nome senza estensione"
#cat /tmp/valentine-nomeSenzaEstensione


### Percorso isolato

## prima dell'ultima / non funziona in caso di più /, quindi ricorro al nome del file
# cat /tmp/valentine-fullNameBackup |sed 's/\/.*//' > /tmp/valentine-percorsoIsolato


## esprimendo il nome del file non funziona in caso di omonimia tra nome file e una cartella,
# e.g. prova/prova
# seleziono il percorso privo del nome del file
# nomeFile="$(cat /tmp/valentine-nomeFileIsolato)"
## l'ultimo sed elimina l'ultima /, comodo per esprimere la variabile $pathIsolato in codici esterni
## isolandola da ciò che viene a dx, e.g. $pathIsolato/prova.txt
#cat /tmp/valentine-fullNameBackup  |sed 's/'$nomeFile'.*//'  | sed 's/\/$//g' > /tmp/valentine-percorsoIsolato


cat /tmp/valentine-fullNameBackup | sed 's/\// /g' > /tmp/valentine-sostSlashBlank

# e.g. a/b
# ho una slash e due colonne
# e.g. /a
# ho una slash  1 colonna

echo $numberOfColumn - 1| bc > /tmp/valentine-nCampiMinusLast

nColonneMinusLast=$(cat /tmp/valentine-nCampiMinusLast)

# stampo i campi dal I al penultimo, sulla stessa linea (I tr)
cat /tmp/valentine-sostSlashBlank | awk -v inizio=1 -v fine=$nColonneMinusLast '{for(i=inizio;i<=fine;i++) print $i}' > /tmp/valentine-pathBlanked

## inserisco le / alla fine di ogni riga
vim -c ":%s/$/\//g" /tmp/valentine-pathBlanked -c :w -c :q
# read -p "sto a 143" EnterNull

## porto tutto sulla stella linea
cat /tmp/valentine-pathBlanked | tr -d '\n' > /tmp/valentine-percorsoIsolato
# read -p "sto a 147" EnterNull

## inserisco all'inizio la /
vim -c ":%s/^/\//g" /tmp/valentine-percorsoIsolato -c :w -c :q

# read -p "sto a 152" EnterNull
## elimino l'ultima / perché è comodo scrivere in script esterni: $pathIsolato/bla 
vim -c ":%s/\/$//g" /tmp/valentine-percorsoIsolato -c :w -c :q

	# testing 
#	read -p "sto a 157" EnterNull

# testing
# echo " "
# echo "percorso isolato e.g. /home/mart/test7"
# cat /tmp/valentine-percorsoIsolato


# testing
#echo " "
#echo "percorso isolato è la radice del file system e.g. /b"
#cat /tmp/valentine-percorsoIsolato

### OK 2024.05.04
else

# dopo l'ultima /
# selezione il nome del file
cat /tmp/valentine-fullNameBackup |sed 's/.*\///' > /tmp/valentine-nomeFileIsolato
# testing
#echo " "
#echo "nome file isoltato"
#cat /tmp/valentine-nomeFileIsolato


# nome file senza estensione
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
## non uso cut perché se il file avesse più punti, allora occorrerebbero altri accorgimenti.
cat /tmp/valentine-nomeFileIsolato | sed 's/\./ /g' > /tmp/valentine-nomeSenzaEstensionePre
## il I campo è il nome senza estensione
cat /tmp/valentine-nomeSenzaEstensionePre | awk '$1 > 0 {print $1}' > /tmp/valentine-nomeSenzaEstensione
cat /tmp/valentine-nomeSenzaEstensionePre | awk '$1 > 0 {print $2}' > /tmp/valentine-tipoEstensione


# testing
#echo " "
#echo "nome senza estensione"
#cat /tmp/valentine-nomeSenzaEstensione


### Percorso isolato

## prima dell'ultima / non funziona in caso di più /, quindi ricorro al nome del file
# cat /tmp/valentine-fullNameBackup |sed 's/\/.*//' > /tmp/valentine-percorsoIsolato


## esprimendo il nome del file non funziona in caso di omonimia tra nome file e una cartella,
# e.g. prova/prova
# seleziono il percorso privo del nome del file
# nomeFile="$(cat /tmp/valentine-nomeFileIsolato)"
## l'ultimo sed elimina l'ultima /, comodo per esprimere la variabile $pathIsolato in codici esterni
## isolandola da ciò che viene a dx, e.g. $pathIsolato/prova.txt
#cat /tmp/valentine-fullNameBackup  |sed 's/'$nomeFile'.*//'  | sed 's/\/$//g' > /tmp/valentine-percorsoIsolato


cat /tmp/valentine-fullNameBackup | sed 's/\// /g' > /tmp/valentine-sostSlashBlank

# e.g. a/b
# ho una slash e due colonne
# e.g. /a
# ho una slash  1 colonna

## In tal caso va numberOfColumn
#echo $numberOfColumn - 1| bc > /tmp/valentine-nCampiMinusLast

#nColonneMinusLast=$(cat /tmp/valentine-nCampiMinusLast)

# stampo i campi dal I al penultimo, sulla stessa linea (I tr)
#cat /tmp/valentine-sostSlashBlank | awk -v inizio=1 -v fine=$nColonneMinusLast '{for(i=inizio;i<=fine;i++) print $i}' > /tmp/valentine-pathBlanked
cat /tmp/valentine-sostSlashBlank | awk -v inizio=1 -v fine=$numberOfColumn '{for(i=inizio;i<=fine;i++) print $i}' > /tmp/valentine-pathBlanked


## inserisco le / alla fine di ogni riga
vim -c ":%s/$/\//g" /tmp/valentine-pathBlanked -c :w -c :q
# read -p "sto a 143" EnterNull

## porto tutto sulla stella linea
cat /tmp/valentine-pathBlanked | tr -d '\n' > /tmp/valentine-percorsoIsolato
# read -p "sto a 147" EnterNull

# read -p "sto a 152" EnterNull
## elimino l'ultima / perché è comodo scrivere in script esterni: $pathIsolato/bla 
vim -c ":%s/\/$//g" /tmp/valentine-percorsoIsolato -c :w -c :q

#read -p "testing 314" EnterNull

	# il percorso è a sx della /
# testing
#echo " "
#echo "percorso isolato e.g. a/b/C"
#cat /tmp/valentine-percorsoIsolato

fi
	# testing 
#	 read -p "sto a 90" EnterNull



fi

fi

exit

