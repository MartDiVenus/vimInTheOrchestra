#!/bin/bash

## Intro: Bash script about bookmarks updating of /etc/vim/gvimrc.local
## /etc/vim/vimrc.local.
## Title: updatingGvim.sh {{{1
## Author: Mario Fantini ing.mariofantini@gmail.com https://github.com/MartDiVenus/ {{{1

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



if [ -d /var/local/netrw ]; then
        if [ -d /var/local/netrw/bookmarks ]; then
                echo " " > /dev/null
        else
                sudo mkdir /var/local/netrw/bookmarks
                sudo chown -R root:$USER /var/local/netrw/bookmarks
                sudo chmod -R uga+xrw /var/local/netrw/bookmarks
        fi
else

                sudo mkdir /var/local/netrw
		sudo mkdir /var/local/netrw/bookmarks
                sudo chown -R root:$USER /var/local/netrw
                sudo chmod -R uga+xrw /var/local/netrw
fi

exit
