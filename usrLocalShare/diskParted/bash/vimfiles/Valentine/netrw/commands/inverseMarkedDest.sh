#!/bin/bash

## Intro: Bash script about inverse selection for fd*. {{{1
##          It's called by NetrwInverseMarkedDest.vim .
## Title: Inverse fd* selection
## Name: inverseMarkedDest.sh {{{1
## Author: Mario Fantini ing.mariofantini@gmail.com https://github.com/MartDiVenus/ {{{1

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

## Help: Vale-netrw__fd 

## [fd] genera come sempre /tmp/valeNetrw-DMarked
## [h] seleziona, stampa e chiude la corrente directory, generando /tmp/valeNetrw-CMarked
## In ordine cronologico:
# 1. rimarca con [fd]
# 2. [h]

var1="$(cat /tmp/valeNetrw-CMarked)"

ls -1l $var1 | grep "^d" > /tmp/valeNetrw-allDirsD

cat /tmp/valeNetrw-allDirsD | awk '$1 > 0 {print $9}' > /tmp/valeNetrw-allDirs

cat /tmp/valeNetrw-CMarked | sed -e 's/\//\\\//g' > /tmp/valeNetrw-pathSedded

leggoPathSedded="$(cat /tmp/valeNetrw-pathSedded)" 

sed 's/'$leggoPathSedded'//g' /tmp/valeNetrw-DMarked > /tmp/valeNetrw-nomeIsolatoPre

sed 's/\///g' /tmp/valeNetrw-nomeIsolatoPre > /tmp/valeNetrw-nomeIsolatoPreSort

sort /tmp/valeNetrw-nomeIsolatoPreSort > /tmp/valeNetrw-nomeIsolato

comm -3 /tmp/valeNetrw-allDirs /tmp/valeNetrw-nomeIsolato > /tmp/valeNetrw-inverseSelection

sed 's/^/'$leggoPathSedded'/' /tmp/valeNetrw-inverseSelection > /tmp/valeNetrw-DMarked

### Anche SMarked, in modo da poter eseguire operazioni anche con fR etc.
cp /tmp/valeNetrw-DMarked /tmp/valeNetrw-SMarked



rm /tmp/valeNetrw-CMarked /tmp/valeNetrw-nomeIsolatoPreSort /tmp/valeNetrw-allDirsD /tmp/valeNetrw-allDirs /tmp/valeNetrw-nomeIsolatoPre /tmp/valeNetrw-pathSedded /tmp/valeNetrw-nomeIsolato /tmp/valeNetrw-inverseSelection


exit

