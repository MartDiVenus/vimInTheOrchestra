#!/bin/bash

## Intro: Bash script about terminal opening in marked destination dir (netrw).
## Title: NetrwCdOT.sh {{{1
## Author: Mario Fantini ing.mariofantini@gmail.com https://github.com/MartDiVenus/ {{{1

## Copyright (C) 2021.10.15 {{{1 
# Creative Commons by-nc-sa-eu

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

## Help: Vale-netrw_ot



destFolder="$(cat /tmp/valeNetrw-CMarked)"

cd $destFolder && mlterm -p /usr/local/lib/martalux/usrLocalShare/martaImages/blueTermBackground.png --contrast=90 --fade=50

#if [ -f /bin/pangoterm ]; then
#	cd $destFolder && pangoterm
#else
#	cd $destFolder && mlterm
#fi


exit


