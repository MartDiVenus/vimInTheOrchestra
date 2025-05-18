#!/bin/bash

## Intro: Bash script about disks turning off {{{1
##          It's called by NetrwSleepDisk.vim .
## Title: NetrwSleepDisk.sh {{{1
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

## Help: Vale-netrw_bo

#echo $USER > /tmp/valeNetrw-curuser

#curuser="$(cat /tmp/valeNetrw-curuser)"




################################################

rm -rf /tmp/valeNetrw-splitSleepDisk

mkdir /tmp/valeNetrw-splitSleepDisk

split -l 1 /tmp/valeNetrw-SMarked /tmp/valeNetrw-splitSleepDisk/

for a in $(ls /tmp/valeNetrw-splitSleepDisk/)

      	do

       		leggoA=$(cat /tmp/valeNetrw-splitSleepDisk/$a)

		echo $leggoA | sed 's/\/tmp\/ValeDisks\///' > /tmp/valeNetrw-disco01

		sed 's/\///g' /tmp/valeNetrw-disco01 > /tmp/valeNetrw-disco02

		leggoSuffissoDisco="$(cat /tmp/valeNetrw-disco02)"

		echo "/dev/$leggoSuffissoDisco" > /tmp/valeNetrw-disco
		
		leggoDisco="$(cat /tmp/valeNetrw-disco)"

		sudo fdisk -l $leggoDisco | grep "^/dev/" > /tmp/valeNetrw-fdiskGrep
		
		vi -c ":%s/\//dirindindin/g" /tmp/valeNetrw-fdiskGrep -c :w -c :q

		cat /tmp/valeNetrw-fdiskGrep | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-awk

		vi -c ":%s/dirindindin/\//g" /tmp/valeNetrw-awk -c :w -c :q


		rm -fr /tmp/valeNetrw-splitPart/

		mkdir /tmp/valeNetrw-splitPart/

		split -l1 /tmp/valeNetrw-awk /tmp/valeNetrw-splitPart/

		for b in $(ls /tmp/valeNetrw-splitPart)

		do
			leggoB="$(cat /tmp/valeNetrw-splitPart/$b)"

		        sudo umount -l $leggoB 2> /dev/null

			sleep 3

		done

                sudo hdparm -Y $leggoDisco 2> /dev/null

                sleep 5

	done

exit

		
		
