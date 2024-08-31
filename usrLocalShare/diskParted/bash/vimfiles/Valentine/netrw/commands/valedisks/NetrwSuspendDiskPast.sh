#!/bin/bash

## Intro: Bash script about disk suspension {{{1
##          It's called by NetrwSuspendDisk.vim .
## Title: NetrwSuspendDisk.sh {{{1
## Author: Mario Fantini marfant7@gmail.com https://github.com/MartDiVenus/ {{{1

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

## Help: Vale-netrw_bu

rm -rf /tmp/valeNetrw-splitSuspendDisk

mkdir /tmp/valeNetrw-splitSuspendDisk

split -l 1 /tmp/valeNetrw-SMarked /tmp/valeNetrw-splitSuspendDisk/

for a in $(ls /tmp/valeNetrw-splitSuspendDisk/)

      	do

       		leggoA=$(cat /tmp/valeNetrw-splitSuspendDisk/$a)
         
		echo $leggoA | sed 's/\/tmp\/ValeDisks\///' > /tmp/valeNetrw-discoEPart
 
                cat /tmp/valeNetrw-discoEPart | cut -d/ -f2,2 > /tmp/valeNetrw-devATrattato
	
		leggoPartizione=$(cat /tmp/valeNetrw-devATrattato)

		cat /tmp/valeNetrw-discoEPart | cut -d/ -f1,1 > /tmp/valeNetrw-devIsolato
	
		leggoDevice=$(cat /tmp/valeNetrw-devIsolato)

              	find /tmp/ValeDisks -name $leggoDevice* > /tmp/valeNetrw-suspendList

		cat /tmp/valeNetrw-suspendList | sed 's/\/tmp\/ValeDisks\/'$leggoDevice'\///' > /tmp/valeNetrw-suspendListSedded

		echo "1Gdd
ZZ" > /tmp/valeNetrw-commandDelILine

                vim -s /tmp/valeNetrw-commandDelILine /tmp/valeNetrw-suspendListSedded

		rm -rf /tmp/valeNetrw-splitSuspendList

		mkdir /tmp/valeNetrw-splitSuspendList

		split -l1 /tmp/valeNetrw-suspendListSedded  /tmp/valeNetrw-splitSuspendList/

		for a in $(ls /tmp/valeNetrw-splitSuspendList/)
		
	         do
		 
		   leggoA=$(cat /tmp/valeNetrw-splitSuspendList/$a)

		   if [ ! -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/radice ]; then
		   
			   if [ ! -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/pwd ]; then
		    	    
	  	              sudo umount -l /dev/$leggoA

		              sleep 3

			      sudo hdparm -y /dev/$leggoA

			      sleep 5

			      sudo blkid /dev/$leggoPartizione >> /tmp/ValeDisks/$leggoDevice/$leggoPartizione/umounted

		              rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/info

                              rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/mounted

		              rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/turnedOff

                              rm -f /tmp/ValeDisks/$leggoDevice/$leggoPartizione/ejected

                           fi
		   fi
	         
	         done
done


rm -r /tmp/valeNetrw-splitSuspendDisk /tmp/valeNetrw-splitSuspendList/
 
rm /tmp/valeNetrw-devIsolato /tmp/valeNetrw-devATrattato /tmp/valeNetrw-suspendList /tmp/valeNetrw-suspendListSedded


exit




