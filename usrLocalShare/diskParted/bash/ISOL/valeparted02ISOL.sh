#!/bin/bash

## Intro: Bash script about netrw/fdisk based disk partition table manipulation;
##        with X session {{{1
## invoked by /usr/local/bin/valeparted
## Title: valeparted02.sh {{{1
## Author: Mario Fantini ing.mariofantini@gmail.com {{{1

## Copyright (C) 2022.02.27 {{{1 
## Creative Commons by-nc-sa-eu
## https://martlux.ns0.it:4000/cluster/securing/agendalux

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

sudo rm -rf /tmp/valeNetrw*

rm -fr ~/.vim/plugin/Valentine/netrw/commands/valedisks

mkdir ~/.vim/plugin/Valentine/netrw/commands/valeparted 2> /dev/null

cp /usr/local/share/valentine/diskParted/plugins/* ~/.vim/plugin/Valentine/netrw/commands/valeparted

sudo cp /usr/local/share/valentine/diskParted/autoload/netrw.vim.disk /usr/share/vim/vim82/autoload/netrw.vim

cp /usr/local/share/valentine/diskParted/plugin/Valentine.vim.parted ~/.vim/plugin/Valentine/Valentine.vim

sudo rm -r /etc/vim

sudo cp -r /usr/local/share/valentine/diskParted/etc/vim /etc

sudo chown root:root /etc/vim 2> /dev/null

sudo chmod ugao-xrw /etc/vim 2> /dev/null

sudo chmod uga+r /etc/vim 2> /dev/null

sudo chmod ga+x /etc/vim 2> /dev/null

sudo chmod g-w /etc/vim 2> /dev/null

sudo chmod u+w /etc/vim 2> /dev/null

sudo chmod ugao-xrw /etc/vim/* 2> /dev/null

sudo chmod uga+r /etc/vim/* 2> /dev/null

sudo chmod u+w /etc/vim/* 2> /dev/null

echo $PWD > /tmp/valeNetrw-pos

### Inizio Elenca le partizioni montate
## Alternativa  a ~$ mount
## mount stampa tutti i punti di montaggio anche quelli virtuali i.e.

### Per i dischi loop non posso usare lsblk perché non li rileva
ls /dev/sd* > /tmp/valeNetrw-lsDevLoop

touch /tmp/valeNetrw-partLoop


### Mi serve dopo
lsblk > /tmp/valeNetrw-lsblkOut1

### Le reali partizioni montate (/, /boot/efi/, i.e. /mnt/sourceData5)
findmnt -n -l --real -o TARGET > /tmp/valeNetrw-real1

### Fine Elenca partizioni montate

### Radice, boot e posizione corrente del terminale.

rm -f /tmp/valeNetrw-partMontate2

touch /tmp/valeNetrw-partMontate2

rm -rf /tmp/valeNetrw-splitReal

mkdir /tmp/valeNetrw-splitReal

rm -f /tmp/valeNetrw-devMontati

touch /tmp/valeNetrw-devMontati

split -l 1 /tmp/valeNetrw-real1 /tmp/valeNetrw-splitReal/

for a in $(ls /tmp/valeNetrw-splitReal/)

 do

  echo | cat /tmp/valeNetrw-splitReal/$a >> /tmp/valeNetrw-partMontate2

  rm -f /tmp/valeNetrw-splitReal/$a

  rm -f /tmp/valeNetrw-posed /tmp/valeNetrw-posed1 /tmp/valeNetrw-posed2 /tmp/valeNetrw-posed3

done

### partizioni montate
if [ -f /tmp/valeNetrw-partMontate2 ]; then
    
 rm -fr /tmp/valeNetrw-splitMontate2

 mkdir /tmp/valeNetrw-splitMontate2
    
 split -l1 /tmp/valeNetrw-partMontate2 /tmp/valeNetrw-splitMontate2/

 ## device relativi montati
 for b in $(ls /tmp/valeNetrw-splitMontate2/)

  do

   leggoB=$(cat /tmp/valeNetrw-splitMontate2/$b)

   grep "$leggoB" /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-mount1

   cat /tmp/valeNetrw-mount1 | awk '$1 > 0 {print $1}' >> /tmp/valeNetrw-devMontati0

 done

 cat /tmp/valeNetrw-devMontati0  | sed 's/└─//' > /tmp/valeNetrw-devMontati1

 cat /tmp/valeNetrw-devMontati1 | sed 's/├─//' > /tmp/valeNetrw-devMontati2

 rm -rf /tmp/valeNetrw-splitDevMontati

 mkdir /tmp/valeNetrw-splitDevMontati

 sort /tmp/valeNetrw-devMontati2 > /tmp/valeNetrw-devMontati3

 cat /tmp/valeNetrw-devMontati3 | uniq > /tmp/valeNetrw-devMontati

 split -l1 /tmp/valeNetrw-devMontati /tmp/valeNetrw-splitDevMontati/

fi


### Device montato in cui sono con il terminale $PWD
## se il punto di montaggio fosse contenuto nella posizione corrente del mio terminale 
## non dovrei né smontare la partizione associata né spegnere il disco associato:
## con /tmp/valeNetrw-pos, la stampa effettuata con $PWD,
## seleziono la directory in cui sono posizionato.

## i.e. con il terminale sono posizionato in /mnt/stock/test, contenuto in /tmp/valeNetrw-pos
cat /tmp/valeNetrw-pos | sed -e 's/\//\\\//g' > /tmp/valeNetrw-posed

cut -d/ -f2,3 /tmp/valeNetrw-posed > /tmp/valeNetrw-posed1

## devo togliere l'ultima << \ >> perché il punto di montaggio non ha l'ultima << / >>
cut -d'\' -f2,1 /tmp/valeNetrw-posed1 > /tmp/valeNetrw-posed2

## ora ho mnt\/stock indipendentemente dalla profondità della mia posizione del terminale,
## in quanto  taglio sempre alla seconda << / >> ossia alla profondità del pto. di montaggio
## che voglio escludere perché in esso è contenuto la mia posizione nel terminale.

## ristabilisco la << / >> per avere << mnt/stock >>
cat /tmp/valeNetrw-posed2 | sed -e 's/\\//g' > /tmp/valeNetrw-posed3

posTagliato="/$(cat /tmp/valeNetrw-posed3)"

Itermine="$posTagliato"

grep "$Itermine"  /tmp/valeNetrw-lsblkOut1 | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-devicePWD0

cat /tmp/valeNetrw-devicePWD0  | sed 's/└─//' > /tmp/valeNetrw-devicePWD1

cat /tmp/valeNetrw-devicePWD1 | sed 's/├─//' > /tmp/valeNetrw-devicePWD

leggoDevPWD=$(cat /tmp/valeNetrw-devicePWD)

### device montato della radice

grep "/" /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-mount1

rm -rf /tmp/valeNetrw-splitRadice

mkdir /tmp/valeNetrw-splitRadice
 
split -l1 /tmp/valeNetrw-mount1 /tmp/valeNetrw-splitRadice/

for a in $(ls /tmp/valeNetrw-splitRadice/)

 do

  cat /tmp/valeNetrw-splitRadice/$a | awk '$1 > 0 {print $7}' > /tmp/valeNetrw-ultimoCampo

  stat --format %s /tmp/valeNetrw-ultimoCampo > /tmp/valeNetrw-bytes

  leggoBytes=$(cat /tmp/valeNetrw-bytes)

  ## la radice ha 2 bytes
  if test $leggoBytes -eq 2
  
   then
  
    cat /tmp/valeNetrw-splitRadice/$a | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-deviceRadice0
   
    cat  /tmp/valeNetrw-deviceRadice0 | sed 's/└─//' > /tmp/valeNetrw-deviceRadice1

    cat /tmp/valeNetrw-deviceRadice1 | sed 's/├─//' > /tmp/valeNetrw-deviceRadice
  
  fi

done

leggoDeviceRadice=$(cat /tmp/valeNetrw-deviceRadice 2> /dev/null)

### eventuale device montato per il boot

grep "boot" /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-mount1

cat /tmp/valeNetrw-mount1 | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-deviceBoot0

cat /tmp/valeNetrw-deviceBoot0 | sed 's/└─//' > /tmp/valeNetrw-deviceBoot1

cat /tmp/valeNetrw-deviceBoot1 | sed 's/├─//' > /tmp/valeNetrw-deviceBoot

leggoDeviceBoot=$(cat /tmp/valeNetrw-deviceBoot)

cat /tmp/valeNetrw-lsblkOut1 | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-dischi1

cat /tmp/valeNetrw-dischi1 | sed '/^NAME/d' > /tmp/valeNetrw-dischi2

cat /tmp/valeNetrw-dischi2 | sed '/^├─/d' > /tmp/valeNetrw-dischi3

cat /tmp/valeNetrw-dischi3 | sed '/^└─/d' > /tmp/valeNetrw-dischi4

##  /tmp/valeNetrw-dischi4
## Questi sono i nomi dei device

### Ora le partizioni

comm -3 /tmp/valeNetrw-dischi4 /tmp/valeNetrw-dischi2 2> /dev/null | tee /tmp/valeNetrw-partizioni1 > /dev/null

cat /tmp/valeNetrw-partizioni1 | sed 's/├─//g' > /tmp/valeNetrw-partizioni2

cat /tmp/valeNetrw-partizioni2 | sed 's/└─//g' > /tmp/valeNetrw-partizioni3

cat /tmp/valeNetrw-partizioni3 | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-partizioni4

sort /tmp/valeNetrw-partizioni4 > /tmp/valeNetrw-partizioni5

cat /tmp/valeNetrw-partizioni5 > /tmp/valeNetrw-partizioni6
 
#### Modifica

## solo le partizioni, i dischi li creo dopo
cat /tmp/valeNetrw-lsDevLoop | sed 's/\/dev\///g' > /tmp/valeNetrw-lsDevLoop01
cat /tmp/valeNetrw-lsDevLoop01 | sed '/^sd.$/d' > /tmp/valeNetrw-lsDevLoop02

mkdir /tmp/valeNetrw-splitPartizioniLoop

split -l1 /tmp/valeNetrw-lsDevLoop02 /tmp/valeNetrw-splitPartizioniLoop/

for c in $(ls /tmp/valeNetrw-splitPartizioniLoop/)
 
   do

leggoC="$(cat /tmp/valeNetrw-splitPartizioniLoop/$c)"

echo $leggoC > /tmp/valeNetrw-partLoop
   

## così elimino solo l'ultimo carattere invece se la partizione avesse due cifre non riuscirei a isolarlo.
## :%s/.$//g

cat /tmp/valeNetrw-partLoop | sed 's/sd.//g' > /tmp/valeNetrw-partLoopNumeric

partLoopNumeric=$(cat /tmp/valeNetrw-partLoopNumeric)

cat /tmp/valeNetrw-partLoop | sed 's/'$partLoopNumeric'//g' > /tmp/valeNetrw-devLoop

leggoA="$(cat /tmp/valeNetrw-devLoop)"

grep "$leggoA" /tmp/valeNetrw-partizioni6 > /tmp/valeNetrw-devLoopIter

stat --format %s /tmp/valeNetrw-devLoopIter > /tmp/valeNetrw-devLoopIterBytes

leggoDevLoopIter=$(cat /tmp/valeNetrw-devLoopIterBytes)

if test ! $leggoDevLoopIter -gt 0

then

echo $leggoA >> /tmp/valeNetrw-devLoopList

fi
done

sleep 1

rm -r  ~/.vim/plugin/Valentine/netrw/commands/valeparted

exit


