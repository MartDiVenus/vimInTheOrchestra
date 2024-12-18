#!/bin/bash

## Intro: Bash script about partitions mounting {{{1
##          It's called by NetrwMountPart.vim .
## Title: NetrwMountPart.sh {{{1
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

## Help: Vale-netrw_m


rm -rf /tmp/valeNetrw-splitMountPart

mkdir /tmp/valeNetrw-splitMountPart


awk '{ nlines++;  print nlines }' /tmp/valeNetrw-SMarked | tail -n1  > /tmp/valeNetrw-nLines

leggoNLines=$(cat /tmp/valeNetrw-nLines)

if test $leggoNLines -gt 1
then
	echo " "
	read -p "Failure! You can't mount more than one partition at time a time.
	a) open a new valeNetrw window
	b) Remark correctly: 
		 Type [fs#m] to edit your selection
	c) close the last valeNetrw window
	
	Press here Enter when you are ready to type again [mo]" EnterNull


 		leggoA="$(cat /tmp/valeNetrw-SMarked)"

		echo $leggoA | sed 's/\/tmp\/ValeParted\///' > /tmp/valeNetrw-discoEPart
 
                cat /tmp/valeNetrw-discoEPart | cut -d/ -f2,2 > /tmp/valeNetrw-devATrattato
	
		leggoPartizione=$(cat /tmp/valeNetrw-devATrattato)

		cat /tmp/valeNetrw-discoEPart | cut -d/ -f1,1 > /tmp/valeNetrw-devIsolato
	
		leggoDevice=$(cat /tmp/valeNetrw-devIsolato)

		## se il device è il lettore CD/DVD
		grep "sr0"  /tmp/valeNetrw-SMarked > /tmp/valeNetrw-devGrepped
	
		stat --format %s /tmp/valeNetrw-devGrepped > /tmp/valeNetrw-bytes
	
		leggoBytes=$(cat /tmp/valeNetrw-bytes)
	
		if test $leggoBytes -gt 0
		
		 then
		## per aprire il vassoio
                  eject -r
                
                 else

                  echo " "
		### Il valore di $ptoMontaggio è scritto da
                ## /home/mart/.vim/plugin/Valentine/netrw/commands/NetrwMountPart.vim
		  ptoMontaggio="$(cat /tmp/valeNetrw-mountingPoint)"
	
### questa istanza [avente le opzioni umask, uid] non vale per tutti i file system, i.e. è valida per ext3 ma non per xfs
                  ## sudo mount -o ro,users,nosuid,nodev,nofail,umask=000,uid=1000 /dev/$leggoPartizione $ptoMontaggio
	          ##	  
        ### questa istanza invece è universalema per vfat è richiesta umask=000,uid=1000
	         #sudo mount -o ro,users,nosuid,nodev,nofail /dev/$leggoPartizione $ptoMontaggio

		 ### quindi ricavo il filesystem, almeno per quelli che uso io eseguo la distinzione.

                  sudo blkid /dev/$leggoPartizione > /tmp/valeNetrw-blkidOut1

                  cat /tmp/valeNetrw-blkidOut1 | sed 's/ /./g' |  tr '.\n' '\n' > /tmp/valeNetrw-blkidOut1V

                  grep "^TYPE" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-type

		  leggoType=$(cat /tmp/valeNetrw-type)

		  if test $leggoType == "xfs"
		   then
		      sudo mount -o ro,users,nosuid,nodev,nofail /dev/$leggoPartizione $ptoMontaggio
		      sleep 3
		  fi

		  if test $leggoType == "ext3"
		   then
		      sudo mount -o ro,users,nosuid,nodev,nofail /dev/$leggoPartizione $ptoMontaggio
		      sleep 3
		  fi

		  if test $leggoType == "ext4"
		   then
		      sudo mount -o ro,users,nosuid,nodev,nofail /dev/$leggoPartizione $ptoMontaggio
		      sleep 3
		  fi

		  if test $leggoType == "vfat"
		   then
		      sudo mount -o ro,users,nosuid,nodev,nofail,umask=000,uid=1000 /dev/$leggoPartizione $ptoMontaggio
		      sleep 3
                  fi

		  if test $leggoType == "ntfs"
		   then
			sudo ntfsfix /dev/$leggoPartizione

                        sudo mount -t ntfs-3g -o ro,users,nosuid,nodev,nofail,remove_hiberfile,umask=000,uid=1000 /dev/$leggoPartizione $ptoMontaggio

			echo " "
			read -p "Montato, per smontare dovrai eseguire:
sudo umount -lt ntfs-3g /dev/$leggoPartizione

Premi Enter per chiudere."
                  fi

		  echo "$ptoMontaggio" > /tmp/ValeParted/$leggoDevice/$leggoPartizione/mounted

		  echo " " >> /tmp/ValeParted/$leggoDevice/$leggoPartizione/mounted

		  sudo blkid /dev/$leggoPartizione >> /tmp/ValeParted/$leggoDevice/$leggoPartizione/mounted

		  echo " " >> /tmp/ValeParted/$leggoDevice/$leggoPartizione/mounted

                  df -h /dev/$leggoPartizione >> /tmp/ValeParted/$leggoDevice/$leggoPartizione/mounted

		  rm -f /tmp/ValeParted/$leggoDevice/$leggoPartizione/info

                  rm -f /tmp/ValeParted/$leggoDevice/$leggoPartizione/umounted

		  rm -f /tmp/ValeParted/$leggoDevice/$leggoPartizione/turnedOff

                  rm -f /tmp/ValeParted/$leggoDevice/$leggoPartizione/ejected

		fi
		


rm -r /tmp/valeNetrw-splitMountPart
 

rm /tmp/valeNetrw-discoEPart /tmp/valeNetrw-devATrattato /tmp/valeNetrw-devIsolato /tmp/valeNetrw-devGrepped /tmp/valeNetrw-bytes

else

	        leggoA="$(cat /tmp/valeNetrw-SMarked)"
		
		echo $leggoA | sed 's/\/tmp\/ValeParted\///' > /tmp/valeNetrw-discoEPart
 
                cat /tmp/valeNetrw-discoEPart | cut -d/ -f2,2 > /tmp/valeNetrw-devATrattato
	
		leggoPartizione=$(cat /tmp/valeNetrw-devATrattato)

		cat /tmp/valeNetrw-discoEPart | cut -d/ -f1,1 > /tmp/valeNetrw-devIsolato
	
		leggoDevice=$(cat /tmp/valeNetrw-devIsolato)

		## se il device è il lettore CD/DVD
		grep "sr0" /tmp/valeNetrw-SMarked  > /tmp/valeNetrw-devGrepped
	
		stat --format %s /tmp/valeNetrw-devGrepped > /tmp/valeNetrw-bytes
	
		leggoBytes=$(cat /tmp/valeNetrw-bytes)
	
		if test $leggoBytes -gt 0
		
		 then
		## per aprire il vassoio
                  eject -r
                
                 else

		### Il valore di $ptoMontaggio è scritto da
                ## /home/mart/.vim/plugin/Valentine/netrw/commands/NetrwMountPart.vim
		  ptoMontaggio="$(cat /tmp/valeNetrw-mountingPoint)"
	
	### questa istanza [avente le opzioni umask, uid] non vale per tutti i file system, i.e. è valida per ext3 ma non per xfs
                  ## sudo mount -o ro,users,nosuid,nodev,nofail,umask=000,uid=1000 /dev/$leggoPartizione $ptoMontaggio
	          ##	  
        ### questa istanza invece è universale ma per vfat è richiesta umask=000,uid=1000
	         #sudo mount -o ro,users,nosuid,nodev,nofail /dev/$leggoPartizione $ptoMontaggio

		 ### quindi ricavo il filesystem, almeno per quelli che uso io eseguo la distinzione.

                  sudo blkid /dev/$leggoPartizione > /tmp/valeNetrw-blkidOut1

                  cat /tmp/valeNetrw-blkidOut1 | sed 's/ /./g' |  tr '.\n' '\n' > /tmp/valeNetrw-blkidOut1V

                  grep "^TYPE" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-type

		  leggoType=$(cat /tmp/valeNetrw-type)

		  if test $leggoType == "xfs"
		   then
		      sudo mount -o ro,users,nosuid,nodev,nofail /dev/$leggoPartizione $ptoMontaggio
		      sleep 3
		  fi

		  if test $leggoType == "ext3"
		   then
		      sudo mount -o ro,users,nosuid,nodev,nofail /dev/$leggoPartizione $ptoMontaggio
		      sleep 3
		  fi

		  if test $leggoType == "ext4"
		   then
		      sudo mount -o ro,users,nosuid,nodev,nofail /dev/$leggoPartizione $ptoMontaggio
		      sleep 3
		  fi

		  if test $leggoType == "vfat"
		   then
		      sudo mount -o ro,users,nosuid,nodev,nofail,umask=000,uid=1000 /dev/$leggoPartizione $ptoMontaggio
		      sleep 3
                  fi

		  if test $leggoType == "ntfs"
		   then
			sudo ntfsfix /dev/$leggoPartizione

                        sudo mount -t ntfs-3g -o ro,users,nosuid,nodev,nofail,remove_hiberfile,umask=000,uid=1000 /dev/$leggoPartizione $ptoMontaggio

			echo " "
			read -p "Montato, per smontare dovrai eseguire:
sudo umount -lt ntfs-3g /dev/$leggoPartizione

Premi Enter per chiudere."
                  fi

		  echo "$ptoMontaggio" > /tmp/ValeParted/$leggoDevice/$leggoPartizione/mounted

		  echo " " >> /tmp/ValeParted/$leggoDevice/$leggoPartizione/mounted

		  sudo blkid /dev/$leggoPartizione >> /tmp/ValeParted/$leggoDevice/$leggoPartizione/mounted

		  echo " " >> /tmp/ValeParted/$leggoDevice/$leggoPartizione/mounted

                  df -h /dev/$leggoPartizione >> /tmp/ValeParted/$leggoDevice/$leggoPartizione/mounted

		  rm -f /tmp/ValeParted/$leggoDevice/$leggoPartizione/info

                  rm -f /tmp/ValeParted/$leggoDevice/$leggoPartizione/umounted

		  rm -f /tmp/ValeParted/$leggoDevice/$leggoPartizione/turnedOff

                  rm -f /tmp/ValeParted/$leggoDevice/$leggoPartizione/ejected

		fi
		

rm -r /tmp/valeNetrw-splitMountPart
 

rm /tmp/valeNetrw-discoEPart /tmp/valeNetrw-devATrattato /tmp/valeNetrw-devIsolato /tmp/valeNetrw-devGrepped /tmp/valeNetrw-bytes


fi


exit



