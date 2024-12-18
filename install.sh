#!/bin/bash

## Intro: Bash script about Vim's plugin << Valentine >> installing.
##        martalux installs it too, but I don't place martalux in public domain;
##        I could share martalux with Vim's and other élite of administrators,
##        I don't share it with any user.
## Title: install.sh {{{1
## Author: Mario Fantini "MartDiVenus" ing.mariofantini@gmail.com 
## https://github.com/MartDiVenus/ {{{1

## Copyright (C) 2022.02.27 {{{1 
# Creative Commons by-nc-sa-eu
# https://martlux.ns0.it:4000/cluster/writing/Valentine

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

echo $USER > /tmp/fullValentine-curuserechoed

curuser=$(cat /tmp/fullValentine-curuserechoed)


echo $PWD > /tmp/fullValentinePosNow

posNow="$(cat /tmp/fullValentinePosNow)"



sudo rm -fr /usr/local/share/valentine 

sudo mkdir /usr/local/share/valentine 

sudo cp -r usrLocalShare/* /usr/local/share/valentine

sudo chown -R root:$curuser /usr/local/share/valentine

sudo chmod -R uga+xrw /usr/local/share/valentine

sudo cp -r varLocal/netrw /var/local

sudo chown -R $curuser:$curuser /var/local/netrw

sudo chmod -R uga+xrw /var/local/netrw


sudo rm -fr /home/$curuser/.vim

sudo rm -fr /root/.vim

sudo rm -fr /etc/vim

sudo rm -f /home/$curuser/.vimrc

sudo rm -f /root/.vimrc

sudo cp -r  /usr/local/share/valentine/fileManager/etc/vim /etc

sudo chown root:root /etc/vim 2> /dev/null
sudo chmod ugao-xrw /etc/vim 2> /dev/null
sudo chmod uga+r /etc/vim 2> /dev/null
sudo chmod ga+x /etc/vim 2> /dev/null
sudo chmod g-w /etc/vim 2> /dev/null
sudo chmod u+w /etc/vim 2> /dev/null
sudo chmod ugao-xrw /etc/vim/* 2> /dev/null
sudo chmod uga+r /etc/vim/* 2> /dev/null
sudo chmod u+w /etc/vim/* 2> /dev/null


sudo mkdir -p /home/$curuser/.vim/autoload

sudo cp homePart/vim/vimfiles/Valentine/netrw/bash/properm /usr/local/bin

sudo chmod uga+xr /usr/local/bin/properm

### bookmarks
sudo cp homePart/vim/.netrwbook /home/$curuser/.vim



### forked netrw.vim
sudo cp /usr/local/share/valentine/fileManager/autoload/netrw.vim.file /usr/share/vim/vim90/autoload/netrw.vim

sudo chown root:root /usr/share/vim/vim90/autoload/netrw.vim

sudo chmod goa-rxw /usr/share/vim/vim90/autoload/netrw.vim

sudo chmod uga+r /usr/share/vim/vim90/autoload/netrw.vim


### forked autoload/netrwFileHandlers.vim
sudo cp /usr/local/share/valentine/fileManager/autoload/netrwFileHandlers.vim /usr/share/vim/vim90/autoload

sudo chown root:root /usr/share/vim/vim90/autoload/netrwFileHandlers.vim

sudo chmod goa-rxw /usr/share/vim/vim90/autoload/netrwFileHandlers.vim

sudo chmod uga+r /usr/share/vim/vim90/autoload/netrwFileHandlers.vim




### forked syntax/netrw.vim
sudo cp homePart/vim/vimfiles/Valentine/netrw/syntax/netrw.vim.file /usr/share/vim/vim90/syntax/netrw.vim

sudo chown root:root /usr/share/vim/vim90/syntax/netrw.vim

sudo chmod goa-rxw /usr/share/vim/vim90/syntax/netrw.vim

sudo chmod uga+r /usr/share/vim/vim90/syntax/netrw.vim


### forked syntax/mart.vim
sudo cp homePart/vim/vimfiles/Valentine/netrw/syntax/mart.vim /usr/share/vim/vim90/syntax

sudo chown root:root /usr/share/vim/vim90/syntax/mart.vim

sudo chmod goa-rxw /usr/share/vim/vim90/syntax/mart.vim

sudo chmod uga+r /usr/share/vim/vim90/syntax/mart.vim



sudo cp -r homePart/vim/vimfiles/Valentine/netrw/syntax /usr/local/share/valentine/fileManager


### colors/mart.vim
sudo cp /usr/local/share/valentine/fileManager/colors/mart.vim /usr/share/vim/vim90/colors

sudo chown root:root /usr/share/vim/vim90/colors/mart.vim

sudo chmod goa-rxw /usr/share/vim/vim90/colors/mart.vim

sudo chmod ga+r /usr/share/vim/vim90/colors/mart.vim


### colors/valedisks.vim
sudo cp /usr/local/share/valentine/diskManager/colors/valedisks.vim /usr/share/vim/vim90/colors

sudo chown root:root /usr/share/vim/vim90/colors/valedisks.vim

sudo chmod goa-rxw /usr/share/vim/vim90/colors/valedisks.vim

sudo chmod uga+r /usr/share/vim/vim90/colors/valedisks.vim


### colors/valeparted.vim
sudo cp /usr/local/share/valentine/diskParted/colors/valeparted.vim /usr/share/vim/vim90/colors

sudo chown root:root /usr/share/vim/vim90/colors/valeparted.vim

sudo chmod goa-rxw /usr/share/vim/vim90/colors/valeparted.vim

sudo chmod uga+r /usr/share/vim/vim90/colors/valeparted.vim


########## disk Manager

sudo cp /usr/local/share/valentine/diskManager/bash/valedisks.sh /usr/local/bin/valedisks

sudo chown root:$USER /usr/local/bin/valedisks

sudo chmod a-xrw /usr/local/bin/valedisks

sudo chmod o-xrw /usr/local/bin/valedisks

sudo chmod uga+xr /usr/local/bin/valedisks



########## partizionatore (ValeParted)

sudo cp /usr/local/share/valentine/diskParted/bash/valeparted.sh /usr/local/bin/valeparted

sudo chown root:$USER /usr/local/bin/valeparted

sudo chmod a-xrw /usr/local/bin/valeparted

sudo chmod o-xrw /usr/local/bin/valeparted

sudo chmod uga+xr /usr/local/bin/valeparted



### copia di homePart/vim
cp -r homePart/vim/* /home/$curuser/.vim

sudo mkdir /root/.vim

sudo cp -r homePart/vim/* /root/.vim


########## Impostazioni di default

######## plugin Valentine.vim.file (file manager)

sudo cp /usr/local/share/valentine/fileManager/plugin/Valentine.vim.file  /home/$curuser/.vim/plugin/Valentine/Valentine.vim

sudo cp /usr/local/share/valentine/fileManager/plugin/Valentine.vim.file /root/.vim/plugin/Valentine/Valentine.vim


######## Plugins
rm -fr /tmp/fullValetineUnzipPlugins

mkdir /tmp/fullValetineUnzipPlugins

#### vim-plug: gestore dei plugin

cd /usr/local/share/valentine/pluginPackages/vimPlug

unzip vim-plug-master.zip -d /tmp/fullValetineUnzipPlugins

cd /tmp/fullValetineUnzipPlugins

sudo cp vim-plug-master/plug.vim /home/$curuser/.vim/autoload

sudo cp vim-plug-master/doc/* /home/$curuser/.vim/doc

#vim -c ':helptags /home/$curuser/.vim/doc' -c :q

sudo mkdir /home/$curuser/.vim/plugged

rm -r vim-plug-master


#### tagbar: tree/browser dei tag

## dipendenza <universal ctags
cd /usr/local/share/valentine/pluginPackages/tagbarEtUniversalCtags

cd universalCtags

sleep 1

unzip ctags-master.zip -d /tmp/fullValetineUnzipPlugins

cd /tmp/fullValetineUnzipPlugins/ctags-master

sleep 1

./autogen.sh

sleep 5

./configure

sleep 5

make

sleep 4

sudo make install 

sleep 3

cd ..


sudo rm -r /tmp/fullValetineUnzipPlugins/ctags-master


## installazione di tagbar

cd /usr/local/share/valentine/pluginPackages/tagbarEtUniversalCtags

unzip tagbar-master.zip -d /tmp/fullValetineUnzipPlugins

cd /tmp/fullValetineUnzipPlugins/

cd tagbar-master

## obbligatorio in  /home/$curuser/.vim/autoload
sudo cp -r autoload/* /home/$curuser/.vim/autoload

sudo mkdir -p /home/$curuser/.vim/plugged/tagbar

sudo cp -r plugin /home/$curuser/.vim/plugged/tagbar

sudo cp -r syntax /home/$curuser/.vim/plugged/tagbar

sudo cp doc/* /home/$curuser/.vim/plugged/tagbar/doc

cd $posNow


## installazione di vim-tex-folder
cd /usr/local/share/valentine/pluginPackages/simpleFolding

unzip vim-tex-fold-master.zip -d /tmp/fullValetineUnzipPlugins

cd /tmp/fullValetineUnzipPlugins/

cd vim-tex-fold-master

sudo mkdir  /home/$curuser/.vim/plugged/vim-tex-fold

sudo cp -r * /home/$curuser/.vim/plugged/vim-tex-fold

cd $posNow

######## proprietà e permessi

sudo chown -R $curuser:$curuser /home/$curuser/.vim

sudo chmod -R uga+xrw /home/$curuser/.vim

sudo cp -r /home/$curuser/.vim /root

sudo chown -R root:root /root/.vim

sudo chmod -R uga+xrw /root/.vim


sudo chown -R root:$curuser /usr/local/share/valentine

sudo chmod go-rxw /usr/local/share/valentine

sudo chmod -R uga+rx /usr/local/share/valentine

sudo rm -fr /tmp/fullValentine*

exit

