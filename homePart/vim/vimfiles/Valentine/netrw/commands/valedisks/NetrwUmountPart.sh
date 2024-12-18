#!/bin/bash

## Intro: Bash script about partitions umounting {{{1
##          It's called by NetrwUmountPart.vim .
## Title: NetrwUmountPart.sh {{{1
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

## Help: Vale-netrw_mo



rm -rf /tmp/valeNetrw-splitUmountPart

mkdir /tmp/valeNetrw-splitUmountPart

split -l 1 /tmp/valeNetrw-SMarked /tmp/valeNetrw-splitUmountPart/

for a in $(ls /tmp/valeNetrw-splitUmountPart/)

      	do

       		leggoA=$(cat /tmp/valeNetrw-splitUmountPart/$a)

		echo $leggoA | sed 's/\/tmp\/ValeDisks\///' > /tmp/valeNetrw-discoEPart
 
                cat /tmp/valeNetrw-discoEPart | cut -d/ -f2,2 > /tmp/valeNetrw-devATrattato
	
		leggoPartizione=$(cat /tmp/valeNetrw-devATrattato)

		cat /tmp/valeNetrw-discoEPart | cut -d/ -f1,1 > /tmp/valeNetrw-devIsolato
	
		leggoDevice=$(cat /tmp/valeNetrw-devIsolato)

		## se il device è il lettore CD/DVD
		grep "sr0"  /tmp/valeNetrw-splitUmountPart/$a > /tmp/valeNetrw-devGrepped
	
		stat --format %s /tmp/valeNetrw-devGrepped > /tmp/valeNetrw-bytes
	
		leggoBytes=$(cat /tmp/valeNetrw-bytes)
	
		if test $leggoBytes -gt 0
		
		 then
		## per aprire il vassoio
                  eject -r
                
                 else
		 
		      	 if [ ! -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/radice ]; then
		   
			  if [ ! -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/pwd ]; then

		             sudo umount -l /dev/$leggoPartizione
		         
			     sleep 3

		             sudo blkid /dev/$leggoPartizione >> /tmp/ValeDisks/$leggoDevice/$leggoPartizione/umounted

		             rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/info

                             rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/mounted

		             rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/turnedOff

                             rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/ejected
			     
		          fi
		         
			 fi
	   
		fi
		
done


rm -r /tmp/valeNetrw-splitUmountPart
 
rm /tmp/valeNetrw-discoEPart /tmp/valeNetrw-devATrattato /tmp/valeNetrw-devIsolato /tmp/valeNetrw-devGrepped /tmp/valeNetrw-bytes


exit



