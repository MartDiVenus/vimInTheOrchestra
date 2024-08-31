#!/bin/bash


## Intro: Bash script about bookmarks updating of /etc/vim/gvimrc.local
## /etc/vim/vimrc.local.
## Title: updatingGvim.sh {{{1
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

## Help: Vale-netrw_fu

rm -fr /tmp/valeNetrw*

sudo rm -f /var/local/netrw/bookmarks/bookmarksList

rm -f /tmp/valeNetrw-newList

rm -f /tmp/valeNetrw-percorsiBookmarks 

rm -rf /tmp/valeNetrw-splitRaw

mkdir /tmp/valeNetrw-splitRaw

split -l 1 /var/local/netrw/bookmarks/bookmarksListRaw /tmp/valeNetrw-splitRaw/

declare -i var=0

for a in $(ls /tmp/valeNetrw-splitRaw)
   do
        var=var+1
 	leggoA=$(cat /tmp/valeNetrw-splitRaw/$a)

 	echo ", '$leggoA'" | tr -d '\n' >> /tmp/valeNetrw-percorsiBookmarks 
        echo "$var. $leggoA" >> /tmp/valeNetrw-newList  	
done


#### Inizio anche per l'editing con [fb]
cat /tmp/valeNetrw-newList | awk '$1 > 0 {print $2}' | sort > /tmp/valeNetrw-bookmarksList02

rm -rf /tmp/valeNetrw-splitList

mkdir /tmp/valeNetrw-splitList

touch /var/local/netrw/bookmarks/bookmarksList


split -l1 /tmp/valeNetrw-bookmarksList02 /tmp/valeNetrw-splitList/

declare -i var=0

for b in $(ls /tmp/valeNetrw-splitList)

do
	var=var+1

	leggoB="$(cat /tmp/valeNetrw-splitList/$b)"

echo "$var. $leggoB" >> /var/local/netrw/bookmarks/bookmarksList

done

#### Fine anche per l'editing con [fb]

# Creo una lista pulita con /tmp/valeNetrw-newList nel ciclo di sopra.

vim -c :1s/^.//g /tmp/valeNetrw-percorsiBookmarks -c :w -c :q

vim -c :1s/^.//g /tmp/valeNetrw-percorsiBookmarks -c :w -c :q


cp /tmp/valeNetrw-percorsiBookmarks /var/local/netrw/bookmarks/bookmarksToGvimrc


echo -e "\n \"BookmarksBlock" > /tmp/valeNetrw-partI
 

sudo chmod uga+rw /etc/vim/gvimrc.local

sudo sed '/"CimiceBookMarksPerSed/d' /etc/vim/gvimrc.local > /tmp/valeNetrw-gvimrcSedded

sudo cp /etc/vim/gvimrc.local /etc/vim/gvimrc.local.back

sudo rm /etc/vim/gvimrc.local 

sudo mv /tmp/valeNetrw-gvimrcSedded /etc/vim/gvimrc.local

echo -e "let g:netrw_bookmarklist= [$(cat /var/local/netrw/bookmarks/bookmarksToGvimrc)] \"CimiceBookMarksPerSed" > /tmp/valeNetrw-update

leggoUpdate="$(cat /tmp/valeNetrw-update)"

echo $leggoUpdate | sudo tee -a /etc/vim/gvimrc.local 2> /dev/null

sudo chmod uga+rw /etc/vim/vimrc.local

sudo sed '/"CimiceBookMarksPerSed/d' /etc/vim/vimrc.local > /tmp/valeNetrw-vimrcSedded

sudo cp /etc/vim/vimrc.local /etc/vim/vimrc.local.back

sudo rm /etc/vim/vimrc.local 

sudo mv /tmp/valeNetrw-vimrcSedded /etc/vim/vimrc.local

echo $leggoUpdate | sudo tee -a /etc/vim/vimrc.local 2> /dev/null

rm /tmp/valeNetrw-partI /tmp/valeNetrw-update 



exit

