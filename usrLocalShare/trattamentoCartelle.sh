#!/bin/bash

## !! a volte /tmp/valentine-fullName viene creato con uno spazio finale,
## in /usr/local/lib/valentine/filesCartelle/directSelect/1/perChiaveAlfanumerica/files/files.sh
## ho rimosso tale problema, ma per non perdere tempo nel correggere gli "infiniti" miei script
## che generano /tmp/valentine-fullName---correggo qui in trattamentoFiles.sh. 
cat /tmp/valentine-fullName | sed 's/ //g' | sed 's/\/$//g' > /tmp/valentine-fullNameCleaned

cat /tmp/valentine-fullNameCleaned | sed 's/\// /g' > /tmp/valentine-sostSlashBlank

sed 's/[^ ]//g' /tmp/valentine-sostSlashBlank | awk '{ print length }' > /tmp/valentine-colC.txt

numberOfColumn=$(cat /tmp/valentine-colC.txt)

sed 's/[^/]//g' /tmp/valentine-fullNameCleaned | awk '{ print length }' > /tmp/valentine-countSlash


leggoCountSlash=$(cat /tmp/valentine-countSlash)


#read -p "18 testing" EnterNull

if test $leggoCountSlash -eq 0

then

cat /tmp/valentine-fullNameCleaned  > /tmp/valentine-nomeCartellaIsolata

# testing
#echo " "
#echo "nome file isolato"
#cat /tmp/valentine-nomeCartellaIsolata
stat --format %s /tmp/valentine-nomeCartellaIsolata > /tmp/valentine-cartellaIsolataBytes

leggoCartellaIsolataBytes=$(cat /tmp/valentine-cartellaIsolataBytes)

if test $leggoCartellaIsolataBytes -eq 1
then

	## come cartella è stata dichiarata la radice
	echo "/" > /tmp/valentine-nomeCartellaIsolata

	## per la radice non si può esprimere alcun percorso isolato
	exit

else


echo "$PWD" > /tmp/valentine-percorsoIsolato

## ATTENZIONE!!!!!!!!!!!!!!!!
## per programmi come la copia diretta di files in valentine, 
## occorre verificare:
## <if test "$leggoPercorsoIsolato" == "$PWD">>
## perché al posto di $PWD deve esserci la $path sorgente della copia.
## Lo stesso caso si presenta nella copia diretta di cartelle in valentine,
## ma non occorre verificare con il condizionale $PWD perché verifico diversamente.
## Questo $PWD serve quando specifico file nella stessa posizione del terminale, e.g.
## luxdim --f=a.txt
## Quindi è corretto il codice di trattamentoFiles.sh, devi solo adeguare i codici
## che hanno bisogno delle proprie calibrazioni.
fi

#read -p "testing trattamentoFiles 53" EnterNull
else

if test $leggoCountSlash -eq 1

then


# dopo l'ultima /
# selezione il nome del file
cat /tmp/valentine-fullNameCleaned |sed 's/.*\///' > /tmp/valentine-nomeCartellaIsolata
# testing
#echo " "
#echo "nome file isoltato"
#cat /tmp/valentine-nomeCartellaIsolata


### Percorso isolato

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
#read -p "testing trattamentoFiles 124" EnterNull

# testing
#echo " "
#echo "percorso isolato è la radice del file system e.g. /b"
#cat /tmp/valentine-percorsoIsolato

else

	# il percorso è a sx della /

cat /tmp/valentine-fullNameCleaned | cut -d/ -f1,"$numberOfColumn" > /tmp/valentine-percorsoIsolato

#read -p "testing trattamentoFiles 137" EnterNull

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



# dopo l'ultima /
# selezione il nome del file
cat /tmp/valentine-fullNameCleaned |sed 's/.*\///' > /tmp/valentine-nomeCartellaIsolata
## aka
########### Cartella isolata
    ## 1. elimino l'ultimo spazio a dx, se esiste
    ## 2. elimino l'ultima slash
    ## 3. sostituisco le slash con gli spazi
    ## 4. elimino tutto ciò che viene prima dell'ultimo spazio
#    cat /tmp/valentine-fullNameCleaned | sed 's/ //g' | sed 's/\/$//g' | sed 's/\// /g' | sed 's/.* //g' > nomeCartellaIsolata

########## Percorso isolato
cat /tmp/valentine-fullNameCleaned | sed 's/\/[^\/]*$//' > /tmp/valentine-percorsoIsolato


### altro metodo
#field=$(($numberOfColumn - 1))
#cat /tmp/valentine-sostSlashBlank | awk -v inizio=1 -v fine=$field '{for(i=inizio;i<=fine;i++) print " " $i}' | tr -d '\n' > /tmp/valentine-percorsoIsolato00

#cat /tmp/valentine-percorsoIsolato00 | sed 's/ /\//g' > /tmp/valentine-percorsoIsolato

## sia per /a/b/c che per a/b/c crea sempre uno spazio davanti ad a,
# devo differenziare perché peer /a/b/c va bene in quanto sostituisco poi gli spazi con </>,
# ma per <a/b/c> non va bene.
   
fi

fi

exit

