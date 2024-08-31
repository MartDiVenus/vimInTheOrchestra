#!/bin/bash

## Intro: Bash script about inverse selection for fm*. {{{1
##          It's called by NetrwInverseMarkedSource.vim .
## Title: inverseMarkedSource.sh {{{1
## Author: Mario Fantini marfant7@gmail.com https://github.com/MartDiVenus/ {{{1

## Copyright (C) 2021.10.15 {{{1 
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

## Help: Vale-netrw__fm

## [fm] genera come sempre /tmp/valeNetrw-SMarked
## [h] stampa la corrente directory, generando /tmp/valeNetrw-CMarked
## In ordine cronologico:
# 1. rimarca con [fm]
# 2. [h]
# 3. [_fm]


var1="$(cat /tmp/valeNetrw-CMarked)"

ls -1 $var1  > /tmp/valeNetrw-allFiles

cat /tmp/valeNetrw-CMarked | sed -e 's/\//\\\//g' > /tmp/valeNetrw-pathSedded

leggoPathSedded="$(cat /tmp/valeNetrw-pathSedded)" 

sed 's/'$leggoPathSedded'//g' /tmp/valeNetrw-SMarked > /tmp/valeNetrw-nomeIsolatoPreSort

sort /tmp/valeNetrw-nomeIsolatoPreSort > /tmp/valeNetrw-nomeIsolato

comm -3 /tmp/valeNetrw-allFiles /tmp/valeNetrw-nomeIsolato > /tmp/valeNetrw-inverseSelection

sed 's/^/'$leggoPathSedded'/' /tmp/valeNetrw-inverseSelection > /tmp/valeNetrw-SMarked

rm /tmp/valeNetrw-CMarked /tmp/valeNetrw-nomeIsolatoPreSort /tmp/valeNetrw-allFiles /tmp/valeNetrw-pathSedded /tmp/valeNetrw-nomeIsolato /tmp/valeNetrw-inverseSelection


exit

