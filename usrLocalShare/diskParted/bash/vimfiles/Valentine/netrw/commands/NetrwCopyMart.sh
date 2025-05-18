#!/bin/bash

## Intro: Bash script about files/dirs netrw copying.
## Title: NetrwCopyMart.sh {{{1
## Author: Mario Fantini marfant7@gmail.com https://github.com/MartDiVenus/ {{{1

## Copyright (C) 2021.10.15 {{{1 
# Creative Commons by-nc-sa-eu
# https://martlux.ns0.it:4000/cluster/securing/agendalux

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You have received a copy of the GNU General Public License
# along with this program in README/COPYING. 
# Aka see <https://www.gnu.org/licenses/>.

## Help: Vale-netrw_fc




pathDest="$(cat /tmp/valeNetrw-DMarked)"

conferma="$(cat /tmp/valeNetrw-copying)"

if test $conferma == "y"

then

	rm -rf /tmp/valeNetrw-splitDestFolders

	mkdir /tmp/valeNetrw-splitDestFolders

	split -l 1 /tmp/valeNetrw-DMarked /tmp/valeNetrw-splitDestFolders/

	rm -rf /tmp/valeNetrw-splitCopyMart

       	mkdir /tmp/valeNetrw-splitCopyMart

       	split -l 1 /tmp/valeNetrw-SMarked /tmp/valeNetrw-splitCopyMart/

	for a in $(ls /tmp/valeNetrw-splitDestFolders)
	do
		leggoA=$(cat /tmp/valeNetrw-splitDestFolders/$a)

        	for b in $(ls /tmp/valeNetrw-splitCopyMart/)

        	do

       		leggoB=$(cat /tmp/valeNetrw-splitCopyMart/$b)

       		sudo -S cp -rv --preserve=all $leggoB $leggoA

       		sync

        	done

	rm /tmp/valeNetrw-splitDestFolders/$a

        done

rm -r /tmp/valeNetrw-splitDestFolders /tmp/valeNetrw-splitCopyMart

else
	exit
 fi
 

exit

