#!/bin/bash

## Intro: Bash script about disks turning off {{{1
##          It's called by NetrwOffDisk.vim .
## Title: NetrwOffDisk.sh {{{1
## Author: Mario Fantini ing.mariofantini@gmail.com https://github.com/MartDiVenus/ {{{1
## Copyright (C) 2022.02.26 {{{1 
## Creative Commons by-nc-sa-eu
## https://martlux.ns0.it:4000/cluster/writing/vim

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

## Help: Vale-netrw_bo

rm -rf /tmp/valeNetrw-splitOffDisk

mkdir /tmp/valeNetrw-splitOffDisk

split -l 1 /tmp/valeNetrw-SMarked /tmp/valeNetrw-splitOffDisk/

for a in $(ls /tmp/valeNetrw-splitOffDisk/)

      	do

       		leggoA=$(cat /tmp/valeNetrw-splitOffDisk/$a)

		echo $leggoA | sed 's/\/tmp\/ValeDisks\///' > /tmp/valeNetrw-discoEPart
 
                cat /tmp/valeNetrw-discoEPart | cut -d/ -f2,2 > /tmp/valeNetrw-devATrattato
	
		leggoPartizione=$(cat /tmp/valeNetrw-devATrattato)

		cat /tmp/valeNetrw-discoEPart | cut -d/ -f1,1 > /tmp/valeNetrw-devIsolato
	
		leggoDevice=$(cat /tmp/valeNetrw-devIsolato)

		## se il device è il lettore CD/DVD
		grep "sr0"  /tmp/valeNetrw-splitOffDisk/$a > /tmp/valeNetrw-devGrepped
	
		stat --format %s /tmp/valeNetrw-devGrepped > /tmp/valeNetrw-bytes
	
		leggoBytes=$(cat /tmp/valeNetrw-bytes)
	
		if test $leggoBytes -gt 0
		then
		## per aprire il vassoio
                eject -r

		echo "/dev/sr0 ejected" > /tmp/ValeDisks/$leggoDevice/$leggoPartizione/ejected

                
                else

		    if [ ! -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/radice ]; then
		   
			   if [ ! -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/pwd ]; then
### Potrebbe apparire superfluo il condizionale per sapere se la partizione 
## è montata o meno, ma non lo è in quanto se essa non fosse montata,
## umount fallirebbe facendo fallire -- o meglio "impazzire" -- udisksctl che 
## spegnerebbe altri dischi tranne quello selezionato. Tuttavia non si risolve così, è 
## udiskctl che è pazzo.
				   if [ -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/mounted ]; then
		              
			                        sudo umount -l /dev/$leggoPartizione

						sleep 3

				        else

						sleep 1
				   fi

## Tale istanza la posso portare anche fuori dal ciclo [come ho fatto nel III modo],
# ma non cambierebbe nulla: udiskctl  non regge nemmeno l'assenza di un condizionale 
# o di un ciclo, non funziona nemmeno direttamente da terminale.
                               sudo udisksctl power-off -b /dev/$leggoPartizione 2> /dev/null

			       sleep 2

		               sudo blkid /dev/$leggoPartizione >> /tmp/ValeDisks/$leggoDevice/$leggoPartizione/turnedOff

                               rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/info

                               rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/umounted

		               rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/mounted

                               rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/ejected

			   fi
		    fi

		fi
		
       	done


rm -r /tmp/valeNetrw-splitOffDisk

rm /tmp/valeNetrw-discoEPart /tmp/valeNetrw-devATrattato /tmp/valeNetrw-devIsolato /tmp/valeNetrw-devGrepped /tmp/valeNetrw-bytes


 


exit


