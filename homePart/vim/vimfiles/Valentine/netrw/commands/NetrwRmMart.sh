#!/bin/bash

## Intro: Bash script about files/dires removing (remarked by [fm]).
## Title: NetrwRmMart.sh {{{1
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

## Help: Vale-netrw_fR



conferma="$(cat /tmp/valeNetrw-deleting)"

if test $conferma == "y"

then

       	rm -rf /tmp/valeNetrw-splitRmMart

       	mkdir /tmp/valeNetrw-splitRmMart

       	split -l 1 /tmp/valeNetrw-SMarked /tmp/valeNetrw-splitRmMart/

       	for a in $(ls /tmp/valeNetrw-splitRmMart/)

       	do

       		leggoA=$(cat /tmp/valeNetrw-splitRmMart/$a)

       		sudo -S rm -fr $leggoA

       	done

else
	exit
 fi

rm -r /tmp/valeNetrw-splitRmMart
 



exit

