#!/bin/bash

rm -fr /tmp/bdValeNetrwSplit

mkdir /tmp/bdValeNetrwSplit


rm -f /tmp/bdValeNetrw-corrottoSource-log-list.txt

touch /tmp/bdValeNetrw-corrottoSource-log-list.txt

split -l1 /tmp/valeNetrw-SMarked /tmp/bdValeNetrwSplit/



paranoidOrNotParanoid=$(cat /tmp/bdValeNetrw-choise)

if test $paranoidOrNotParanoid == 1

then


for a in $(ls /tmp/bdValeNetrwSplit/)

   do

   leggoA="$(cat /tmp/bdValeNetrwSplit/$a)"

   ls -l -1 $leggoA > /tmp/bdValeNetrwPreVi

   vi -c ":%s/-/dirindindin/g" /tmp/bdValeNetrwPreVi -c :w -c :q

   stat --format %s $leggoA > /tmp/bdValeNetrwStatFile

   leggoByt=$(cat /tmp/bdValeNetrwStatFile)
############################################################################################### II if
   if test $leggoByt -gt 0
     then

     cat /tmp/bdValeNetrwPreVi | awk '$1 > 0 {print $5}' > /tmp/bdValeNetrwExtractedListedl
#### E` importante iniziare il ciclo prima << for p ... >> di << leggoBytes=... >> altrimenti << $leggoBytes >>
### non si aggiornerebbe correttamente se iniziassi il ciclo dopo di << $leggoBytes >> e avverrebbero
### incrementi falsati con dispendio di energia, spazio e tempo inutile. 
### Se eliminassi il ciclo << for p ... >> si fermerebbe alla prima iterazione
### con conseguente fallimento. 
### In tal modo invece funziona perfettamente.
###################################################################################################
  for p in {1}
    do
      leggoBytes=$(cat /tmp/bdValeNetrwExtractedListedl)
######### non puoi usare la variabile $leggoA, solo apparentemente uguale, a $fileDaCor
######### perché $leggoA non aggiornata
########## avresti il fallimento perché il codice si fermerebbe solo a una directory
          fileDaCor=$(cat /tmp/bdValeNetrwSplit/$a)
          echo "$fileDaCor" >> /tmp/bdValeNetrw-corrottoSource-log-list.txt

#### test

#read -p "Sto trattando $fileDaCor
#Premi Enter per continuare" EnterNull

#### 1 mega
          if test $leggoBytes -le 1000000
           then 
##### Simulazioni per non fare danni
###            echo " sto corrompendo il file perché minore uguale a 1 megabyte"
             dd if=/dev/urandom of="$fileDaCor" bs=1k count=1000
             dd if=/dev/urandom of="$fileDaCor" bs=1k count=1000
             dd if=/dev/zero of="$fileDaCor" bs=1k count=1000
	     rm $fileDaCor
            break
           else
#### 10 mega
          if test $leggoBytes -le 10000000
           then 
###            echo " sto corrompendo il file perché minore uguale a 10 megabyte"
            dd if=/dev/urandom of="$fileDaCor" bs=1k count=10000
            dd if=/dev/urandom of="$fileDaCor" bs=1k count=10000
            dd if=/dev/zero of="$fileDaCor" bs=1k count=10000
	    rm $fileDaCor
            break
           else
#### 100 mega
            if test $leggoBytes -le 100000000
             then 
###              echo " sto corrompendo il file perché minore uguale a 100 megabyte"
             dd if=/dev/urandom of="$fileDaCor" bs=1k count=100000
             dd if=/dev/urandom of="$fileDaCor" bs=1k count=100000
             dd if=/dev/zero of="$fileDaCor" bs=1k count=100000
	     rm $fileDaCor
              break
              else
#### 1 giga
            if test $leggoBytes -le 1000000000
             then 
####              echo " sto corrompendo il file perché minore uguale a 1 gigabyte"
               dd if=/dev/urandom of="$fileDaCor" bs=1k count=1000k
               dd if=/dev/urandom of="$fileDaCor" bs=1k count=1000k
               dd if=/dev/zero of="$fileDaCor" bs=1k count=1000k
               rm $fileDaCor
              break
              else
#### 10 giga
            if test $leggoBytes -le 10000000000
             then 
####              echo " sto corrompendo il file perché minore uguale a 10 gigabyte"
              dd if=/dev/urandom of="$fileDaCor" bs=1k count=10000k
              dd if=/dev/urandom of="$fileDaCor" bs=1k count=10000k
              dd if=/dev/zero of="$fileDaCor" bs=1k count=10000k
              rm $fileDaCor
	      break
            fi          
          fi
        fi
      fi
     fi   
 done
  rm -f /tmp/bdValeNetrwExtractedListedl

     else
     echo "Il file originale è vuoto"
############## elimino dalle cartella di split tutti i file inizianti con il pattern $obiettivo
    fi
done
	       fi



############# Se non paranoid

if test $paranoidOrNotParanoid == 2

then

for a in $(ls /tmp/bdValeNetrwSplit/)
  do

   leggoA="$(cat /tmp/bdValeNetrwSplit/$a)"

   ls -l -1 $leggoA > /tmp/bdValeNetrwPreVi

   vi -c ":%s/-/dirindindin/g" /tmp/bdValeNetrwPreVi -c :w -c :q

   stat --format %s $leggoA > /tmp/bdValeNetrwStatFile

   leggoByt=$(cat /tmp/bdValeNetrwStatFile)
############################################################################################### 1 if
   if test $leggoByt -gt 0
     then

     cat /tmp/bdValeNetrwPreVi | awk '$1 > 0 {print $5}' > /tmp/bdValeNetrwExtractedListedl
#### E` importante iniziare il ciclo prima << for p ... >> di << leggoBytes=... >> altrimenti << $leggoBytes >>
### non si aggiornerebbe correttamente se iniziassi il ciclo dopo di << $leggoBytes >> e avverrebbero
### incrementi falsati con dispendio di energia, spazio e tempo inutile. 
### Se eliminassi il ciclo << for p ... >> si fermerebbe alla prima iterazione
### con conseguente fallimento. 
### In tal modo invece funziona perfettamente.
###################################################################################################
  for p in {1}
    do
      leggoBytes=$(cat /tmp/bdValeNetrwExtractedListedl)
######### non puoi usare la variabile $leggoA, solo apparentemente uguale, a $fileDaCor
######### perché $leggoA non aggiornata
########## avresti il fallimento perché il codice si fermerebbe solo a una directory
          fileDaCor=$(cat /tmp/bdValeNetrwSplit/$a)
          echo "$fileDaCor" >> /tmp/bdValeNetrw-corrottoSource-log-list.txt

#### test

#read -p "Sto trattando $fileDaCor
#Premi Enter per continuare" EnterNull

#### 1 mega
          if test $leggoBytes -le 1000000
           then 
##### Simulazioni per non fare danni
###            echo " sto corrompendo il file perché minore uguale a 1 megabyte"
             dd if=/dev/urandom of="$fileDaCor" bs=1k count=1000
	     rm $fileDaCor
            break
           else
#### 10 mega
          if test $leggoBytes -le 10000000
           then 
###            echo " sto corrompendo il file perché minore uguale a 10 megabyte"
            dd if=/dev/urandom of="$fileDaCor" bs=1k count=10000
	    rm $fileDaCor
            break
           else
#### 100 mega
            if test $leggoBytes -le 100000000
             then 
###              echo " sto corrompendo il file perché minore uguale a 100 megabyte"
             dd if=/dev/urandom of="$fileDaCor" bs=1k count=100000
	     rm $fileDaCor
              break
              else
#### 1 giga
            if test $leggoBytes -le 1000000000
             then 
####              echo " sto corrompendo il file perché minore uguale a 1 gigabyte"
               dd if=/dev/urandom of="$fileDaCor" bs=1k count=1000k
               rm $fileDaCor
              break
              else
#### 10 giga
            if test $leggoBytes -le 10000000000
             then 
####              echo " sto corrompendo il file perché minore uguale a 10 gigabyte"
              dd if=/dev/urandom of="$fileDaCor" bs=1k count=10000k
              rm $fileDaCor
	      break
            fi          
          fi
        fi
      fi
     fi   
 done
 /tmp/bdValeNetrwExtractedListedl

     else
     echo "Il file originale è vuoto"
############## elimino dalle cartella di split tutti i file inizianti con il pattern $obiettivo
    fi
done

fi

  
#rm -fr /tmp/bdValeNetrw*


exit


