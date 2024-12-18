#!/bin/bash

## Intro: Bash script about netrw/fdisk based disk partition table manipulation;
##        with X session {{{1
## invoked by /usr/local/bin/valeparted
## Title: valeparted02.sh {{{1
## Author: Mario Fantini ing.mariofantini@gmail.com {{{1

## Copyright (C) 2022.02.27 {{{1 
## Creative Commons by-nc-sa-eu
## https://martlux.ns0.it:4000/cluster/securing/agendalux

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

## Help: Vale-netrw

sudo rm -rf /tmp/valeNetrw*

rm -fr ~/.vim/plugin/Valentine/netrw/commands/valedisks

mkdir ~/.vim/plugin/Valentine/netrw/commands/valeparted 2> /dev/null

cp /usr/local/share/valentine/diskParted/plugins/* ~/.vim/plugin/Valentine/netrw/commands/valeparted

sudo cp /usr/local/share/valentine/diskParted/autoload/netrw.vim.disk /usr/share/vim/vim82/autoload/netrw.vim

cp /usr/local/share/valentine/diskParted/plugin/Valentine.vim.parted ~/.vim/plugin/Valentine/Valentine.vim

sudo rm -r /etc/vim

sudo cp -r /usr/local/share/valentine/diskParted/etc/vim /etc

sudo chown root:root /etc/vim 2> /dev/null

sudo chmod ugao-xrw /etc/vim 2> /dev/null

sudo chmod uga+r /etc/vim 2> /dev/null

sudo chmod ga+x /etc/vim 2> /dev/null

sudo chmod g-w /etc/vim 2> /dev/null

sudo chmod u+w /etc/vim 2> /dev/null

sudo chmod ugao-xrw /etc/vim/* 2> /dev/null

sudo chmod uga+r /etc/vim/* 2> /dev/null

sudo chmod u+w /etc/vim/* 2> /dev/null

echo $PWD > /tmp/valeNetrw-pos

### Inizio Elenca le partizioni montate
## Alternativa  a ~$ mount
## mount stampa tutti i punti di montaggio anche quelli virtuali i.e.

### Mi serve dopo
lsblk > /tmp/valeNetrw-lsblkOut1

### Le reali partizioni montate (/, /boot/efi/, i.e. /mnt/sourceData5)
findmnt -n -l --real -o TARGET > /tmp/valeNetrw-real1

### Fine Elenca partizioni montate

### Radice, boot e posizione corrente del terminale.

rm -f /tmp/valeNetrw-partMontate2

touch /tmp/valeNetrw-partMontate2

rm -rf /tmp/valeNetrw-splitReal

mkdir /tmp/valeNetrw-splitReal

rm -f /tmp/valeNetrw-devMontati

touch /tmp/valeNetrw-devMontati

split -l 1 /tmp/valeNetrw-real1 /tmp/valeNetrw-splitReal/

for a in $(ls /tmp/valeNetrw-splitReal/)

 do

  echo | cat /tmp/valeNetrw-splitReal/$a >> /tmp/valeNetrw-partMontate2

  rm -f /tmp/valeNetrw-splitReal/$a

  rm -f /tmp/valeNetrw-posed /tmp/valeNetrw-posed1 /tmp/valeNetrw-posed2 /tmp/valeNetrw-posed3

done

### partizioni montate
if [ -f /tmp/valeNetrw-partMontate2 ]; then
    
 rm -fr /tmp/valeNetrw-splitMontate2

 mkdir /tmp/valeNetrw-splitMontate2
    
 split -l1 /tmp/valeNetrw-partMontate2 /tmp/valeNetrw-splitMontate2/

 ## device relativi montati
 for b in $(ls /tmp/valeNetrw-splitMontate2/)

  do

   leggoB=$(cat /tmp/valeNetrw-splitMontate2/$b)

   grep "$leggoB" /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-mount1

   cat /tmp/valeNetrw-mount1 | awk '$1 > 0 {print $1}' >> /tmp/valeNetrw-devMontati0

 done

 cat /tmp/valeNetrw-devMontati0  | sed 's/└─//' > /tmp/valeNetrw-devMontati1

 cat /tmp/valeNetrw-devMontati1 | sed 's/├─//' > /tmp/valeNetrw-devMontati2

 rm -rf /tmp/valeNetrw-splitDevMontati

 mkdir /tmp/valeNetrw-splitDevMontati

 sort /tmp/valeNetrw-devMontati2 > /tmp/valeNetrw-devMontati3

 cat /tmp/valeNetrw-devMontati3 | uniq > /tmp/valeNetrw-devMontati

 split -l1 /tmp/valeNetrw-devMontati /tmp/valeNetrw-splitDevMontati/

fi


### Device montato in cui sono con il terminale $PWD
## se il punto di montaggio fosse contenuto nella posizione corrente del mio terminale 
## non dovrei né smontare la partizione associata né spegnere il disco associato:
## con /tmp/valeNetrw-pos, la stampa effettuata con $PWD,
## seleziono la directory in cui sono posizionato.

## i.e. con il terminale sono posizionato in /mnt/stock/test, contenuto in /tmp/valeNetrw-pos
cat /tmp/valeNetrw-pos | sed -e 's/\//\\\//g' > /tmp/valeNetrw-posed

cut -d/ -f2,3 /tmp/valeNetrw-posed > /tmp/valeNetrw-posed1

## devo togliere l'ultima << \ >> perché il punto di montaggio non ha l'ultima << / >>
cut -d'\' -f2,1 /tmp/valeNetrw-posed1 > /tmp/valeNetrw-posed2

## ora ho mnt\/stock indipendentemente dalla profondità della mia posizione del terminale,
## in quanto  taglio sempre alla seconda << / >> ossia alla profondità del pto. di montaggio
## che voglio escludere perché in esso è contenuto la mia posizione nel terminale.

## ristabilisco la << / >> per avere << mnt/stock >>
cat /tmp/valeNetrw-posed2 | sed -e 's/\\//g' > /tmp/valeNetrw-posed3

posTagliato="/$(cat /tmp/valeNetrw-posed3)"

Itermine="$posTagliato"

grep "$Itermine"  /tmp/valeNetrw-lsblkOut1 | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-devicePWD0

cat /tmp/valeNetrw-devicePWD0  | sed 's/└─//' > /tmp/valeNetrw-devicePWD1

cat /tmp/valeNetrw-devicePWD1 | sed 's/├─//' > /tmp/valeNetrw-devicePWD

leggoDevPWD=$(cat /tmp/valeNetrw-devicePWD)

### device montato della radice

grep "/" /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-mount1

rm -rf /tmp/valeNetrw-splitRadice

mkdir /tmp/valeNetrw-splitRadice
 
split -l1 /tmp/valeNetrw-mount1 /tmp/valeNetrw-splitRadice/

for a in $(ls /tmp/valeNetrw-splitRadice/)

 do

  cat /tmp/valeNetrw-splitRadice/$a | awk '$1 > 0 {print $7}' > /tmp/valeNetrw-ultimoCampo

  stat --format %s /tmp/valeNetrw-ultimoCampo > /tmp/valeNetrw-bytes

  leggoBytes=$(cat /tmp/valeNetrw-bytes)

  ## la radice ha 2 bytes
  if test $leggoBytes -eq 2
  
   then
  
    cat /tmp/valeNetrw-splitRadice/$a | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-deviceRadice0
   
    cat  /tmp/valeNetrw-deviceRadice0 | sed 's/└─//' > /tmp/valeNetrw-deviceRadice1

    cat /tmp/valeNetrw-deviceRadice1 | sed 's/├─//' > /tmp/valeNetrw-deviceRadice
  
  fi

done

leggoDeviceRadice=$(cat /tmp/valeNetrw-deviceRadice 2> /dev/null)

### eventuale device montato per il boot

grep "boot" /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-mount1

cat /tmp/valeNetrw-mount1 | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-deviceBoot0

cat /tmp/valeNetrw-deviceBoot0 | sed 's/└─//' > /tmp/valeNetrw-deviceBoot1

cat /tmp/valeNetrw-deviceBoot1 | sed 's/├─//' > /tmp/valeNetrw-deviceBoot

leggoDeviceBoot=$(cat /tmp/valeNetrw-deviceBoot)

cat /tmp/valeNetrw-lsblkOut1 | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-dischi1

cat /tmp/valeNetrw-dischi1 | sed '/^NAME/d' > /tmp/valeNetrw-dischi2

cat /tmp/valeNetrw-dischi2 | sed '/^├─/d' > /tmp/valeNetrw-dischi3

cat /tmp/valeNetrw-dischi3 | sed '/^└─/d' > /tmp/valeNetrw-dischi4

##  /tmp/valeNetrw-dischi4
## Questi sono i nomi dei device

### Ora le partizioni

comm -3 /tmp/valeNetrw-dischi4 /tmp/valeNetrw-dischi2 2> /dev/null | tee /tmp/valeNetrw-partizioni1 > /dev/null

cat /tmp/valeNetrw-partizioni1 | sed 's/├─//g' > /tmp/valeNetrw-partizioni2

cat /tmp/valeNetrw-partizioni2 | sed 's/└─//g' > /tmp/valeNetrw-partizioni3

cat /tmp/valeNetrw-partizioni3 | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-partizioni4

sort /tmp/valeNetrw-partizioni4 > /tmp/valeNetrw-partizioni5

cat /tmp/valeNetrw-partizioni5 > /tmp/valeNetrw-partizioni6
 


## Ora hai le partizioni in /tmp/valeNetrw-partizioni3

rm -fr /tmp/valeNetrw-splitDevice

mkdir /tmp/valeNetrw-splitDevice

rm -fr /tmp/ValeParted

mkdir /tmp/ValeParted

split -l1 /tmp/valeNetrw-dischi4 /tmp/valeNetrw-splitDevice/

rm -fr /tmp/valeNetrw-splitPartizioni

mkdir /tmp/valeNetrw-splitPartizioni

split -l1 /tmp/valeNetrw-partizioni6 /tmp/valeNetrw-splitPartizioni/

rm -f /tmp/valeNetrw-mountedPartTree	

touch /tmp/valeNetrw-mountedPartTree

rm -f /tmp/valeNetrw-ValeDiskTree

touch /tmp/valeNetrw-ValeDiskTree

## mi serve appendere un echo, altrimenti non legge il primo disco se è <<sda>>
echo " " >> /tmp/valeNetrw-ValeDiskTree

## a -> device
for a in $(ls /tmp/valeNetrw-splitDevice/)

 do

  leggoA=$(cat /tmp/valeNetrw-splitDevice/$a)

  mkdir /tmp/ValeParted/$leggoA

  ## b -> partizione
 
  for b in $(ls /tmp/valeNetrw-splitPartizioni/)
 
   do

    grep "$leggoA" /tmp/valeNetrw-splitPartizioni/$b > /tmp/valeNetrw-bGrepped

    stat --format %s /tmp/valeNetrw-bGrepped > /tmp/valeNetrw-bytes

    leggoBytes=$(cat /tmp/valeNetrw-bytes)

    if test $leggoBytes -gt 0

     then

      leggoB=$(cat /tmp/valeNetrw-splitPartizioni/$b)

      ## partizioni che possono essere trattate, escluse quindi la radice,
      ## e la posizione corrente del terminale.
      ## Non le rappresento nel gestore. 

      mkdir /tmp/ValeParted/$leggoA/$leggoB 2> /dev/null
		   
      sudo blkid /dev/$leggoB > /tmp/ValeParted/$leggoA/$leggoB/info

      echo " " >> /tmp/ValeParted/$leggoA/$leggoB/info

      ## No df per dischi non montati perché non sarebbe veritiero il responso.
      ## df -h /dev/$leggoB >> /tmp/ValeParted/$leggoA/$leggoB/info

      echo "|--/dev/$leggoA" >> /tmp/valeNetrw-ValeDiskTree

      cat /tmp/valeNetrw-ValeDiskTree | sed 's/\|\_\_\/dev\/'$leggoB'//g' > /tmp/valeNetrw-ValeDiskTree2

      rm /tmp/valeNetrw-ValeDiskTree
                    
      cp /tmp/valeNetrw-ValeDiskTree2 /tmp/valeNetrw-ValeDiskTree

      grep "$leggoB"  /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-BGrepped-umount-back

      cat /tmp/valeNetrw-BGrepped-umount-back | awk '$1 > 0 {print $4}' > /tmp/valeNetrw-dim
				  
      leggoDimensioni=$(cat /tmp/valeNetrw-dim)

	   sudo blkid /dev/$leggoB > /tmp/valeNetrw-blkidOut1

           cat /tmp/valeNetrw-blkidOut1 | sed 's/ /./g' |  tr '.\n' '\n' > /tmp/valeNetrw-blkidOut1V

           grep "^PARTLABEL" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-partlabel

	   stat --format %s /tmp/valeNetrw-partlabel > /tmp/valeNetrw-bytes

	   leggoBytes=$(cat /tmp/valeNetrw-bytes)

	   if test $leggoBytes -gt 0
	   
	   then
	
		   echo " " > /dev/null
	
	   else
        
	      	   grep "^LABEL" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-partlabel
           
	   fi

	   stat --format %s /tmp/valeNetrw-partlabel > /tmp/valeNetrw-bytes

	   leggoBytes=$(cat /tmp/valeNetrw-bytes)

	   if test $leggoBytes -gt 0
	    
	    then

	     leggoPartLabel=$(cat /tmp/valeNetrw-partlabel)
 
	    else

             leggoPartLabel="unknown"

	   fi
	   
	   grep "^TYPE" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-type

	   stat --format %s /tmp/valeNetrw-type > /tmp/valeNetrw-bytes

	   leggoBytes=$(cat /tmp/valeNetrw-bytes)

	   if test $leggoBytes -gt 0
	   
	     then
 
               leggoPartType=$(cat /tmp/valeNetrw-type)
                  
	     else
  
	      leggoPartType="unformatted"

	   fi
          
	   echo "  |__/dev/$leggoB/ $leggoPartLabel $leggoPartType $leggoDimensioni unmounted" >> /tmp/valeNetrw-ValeDiskTree		   

    fi


    if [ -f /tmp/valeNetrw-partMontate2 ]; then

     for c in $(ls /tmp/valeNetrw-splitDevMontati/)

      do

       leggoC=$(cat /tmp/valeNetrw-splitDevMontati/$c)

       if test $leggoB == $leggoC

        then

  	 if test $leggoDeviceBoot == $leggoB
			
	  then
                       
	   echo "boot" > /tmp/ValeParted/$leggoA/$leggoB/boot

	   echo " " >> /tmp/ValeParted/$leggoA/$leggoB/boot

	   sudo blkid /dev/$leggoB >> /tmp/ValeParted/$leggoA/$leggoB/boot
                                
	   echo " " >> /tmp/ValeParted/$leggoA/$leggoB/boot
				
	   df -h /dev/$leggoB >> /tmp/ValeParted/$leggoA/$leggoB/boot
                  
	   rm -f /tmp/ValeParted/$leggoA/$leggoB/info

	   echo "|--/dev/$leggoA" >> /tmp/valeNetrw-ValeDiskTree
  		                
	   cat /tmp/valeNetrw-ValeDiskTree | sed 's/\|\_\_\/dev\/'$leggoB'//g' > /tmp/valeNetrw-ValeDiskTree2

	   cat /tmp/valeNetrw-ValeDiskTree2 | sed 's/\|\/boot//g' > /tmp/valeNetrw-ValeDiskTree3

	   rm /tmp/valeNetrw-ValeDiskTree
                    
	   cp /tmp/valeNetrw-ValeDiskTree3 /tmp/valeNetrw-ValeDiskTree

	   grep "$leggoB"  /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-BGrepped-umount-back

           cat /tmp/valeNetrw-BGrepped-umount-back | awk '$1 > 0 {print $4}' > /tmp/valeNetrw-dim
				  
           leggoDimensioni=$(cat /tmp/valeNetrw-dim)


	   cat /tmp/valeNetrw-BGrepped-umount-back | awk '$1 > 0 {print $7}' > /tmp/valeNetrw-ptoM
				  
           leggoPtoM=$(cat /tmp/valeNetrw-ptoM)

	   sudo blkid /dev/$leggoB > /tmp/valeNetrw-blkidOut1

           cat /tmp/valeNetrw-blkidOut1 | sed 's/ /./g' |  tr '.\n' '\n' > /tmp/valeNetrw-blkidOut1V

           grep "^PARTLABEL" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-partlabel

	   stat --format %s /tmp/valeNetrw-partlabel > /tmp/valeNetrw-bytes

	   leggoBytes=$(cat /tmp/valeNetrw-bytes)

	   if test $leggoBytes -gt 0
	   
	   then
	
		   echo " " > /dev/null
	
	   else
        
	      	   grep "^LABEL" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-partlabel
           
	   fi

	   leggoPartLabel=$(cat /tmp/valeNetrw-partlabel)

	   grep "^TYPE" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-type
 
	   stat --format %s /tmp/valeNetrw-type > /tmp/valeNetrw-bytes

	   leggoBytes=$(cat /tmp/valeNetrw-bytes)
	   
	   if test $leggoBytes -gt 0
	   
	     then
  
	         leggoPartType=$(cat /tmp/valeNetrw-type)

             else
	      
		 leggoPartType="unformatted"

	   fi
	    
           echo "  |__/dev/$leggoB/boot $leggoPartLabel $leggoPartType $leggoDimensioni $leggoPtoM" >> /tmp/valeNetrw-ValeDiskTree

  	   rm -f /tmp/valeNetrw-splitDevMontati/$c
         
	 fi

 	 if test $leggoDeviceRadice == $leggoB

	   then
	    
            echo "radice" > /tmp/ValeParted/$leggoA/$leggoB/radice
	    
	    echo " " >> /tmp/ValeParted/$leggoA/$leggoB/radice

	    sudo blkid /dev/$leggoB >> /tmp/ValeParted/$leggoA/$leggoB/radice

	    echo " " >> /tmp/ValeParted/$leggoA/$leggoB/radice

	    df -h /dev/$leggoB >> /tmp/ValeParted/$leggoA/$leggoB/radice

	    echo "|--/dev/$leggoA" >> /tmp/valeNetrw-ValeDiskTree
				
	    cat /tmp/valeNetrw-ValeDiskTree | sed 's/\|\_\_\/dev\/'$leggoB'//g' > /tmp/valeNetrw-ValeDiskTree2

	    cat /tmp/valeNetrw-ValeDiskTree2 | sed 's/\|\/radice//g' > /tmp/valeNetrw-ValeDiskTree3

	    rm /tmp/valeNetrw-ValeDiskTree
                    
	    cp /tmp/valeNetrw-ValeDiskTree3 /tmp/valeNetrw-ValeDiskTree
	   
	    grep "$leggoB"  /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-BGrepped-umount-back

            cat /tmp/valeNetrw-BGrepped-umount-back | awk '$1 > 0 {print $4}' > /tmp/valeNetrw-dim
				  
            leggoDimensioni=$(cat /tmp/valeNetrw-dim)

	    cat /tmp/valeNetrw-BGrepped-umount-back | awk '$1 > 0 {print $7}' > /tmp/valeNetrw-ptoM
				  
            leggoPtoM=$(cat /tmp/valeNetrw-ptoM)

	   sudo blkid /dev/$leggoB > /tmp/valeNetrw-blkidOut1

           cat /tmp/valeNetrw-blkidOut1 | sed 's/ /./g' |  tr '.\n' '\n' > /tmp/valeNetrw-blkidOut1V

           grep "^PARTLABEL" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-partlabel

	   stat --format %s /tmp/valeNetrw-partlabel > /tmp/valeNetrw-bytes

	   leggoBytes=$(cat /tmp/valeNetrw-bytes)

	   if test $leggoBytes -gt 0
	   
	   then
	
		   echo " " > /dev/null
	
	   else
        
	      	   grep "^LABEL" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-partlabel
           
	   fi

	   leggoPartLabel=$(cat /tmp/valeNetrw-partlabel)

	   grep "^TYPE" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-type
  
	   stat --format %s /tmp/valeNetrw-type > /tmp/valeNetrw-bytes

	   leggoBytes=$(cat /tmp/valeNetrw-bytes)
	   
	   if test $leggoBytes -gt 0
	   
	     then
  
	         leggoPartType=$(cat /tmp/valeNetrw-type)

             else
	      
		 leggoPartType="unformatted"

	   fi
	    
            echo "  |__/dev/$leggoB/radice $leggoPartLabel $leggoPartType $leggoDimensioni $leggoPtoM" >> /tmp/valeNetrw-ValeDiskTree

	    rm -f /tmp/ValeParted/$leggoA/$leggoB/info

            rm -f /tmp/valeNetrw-splitDevMontati/$c

	 fi
		       
	 if test $leggoDevPWD == $leggoB

	  then
	
	    grep "$leggoB"  /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-BGrepped-umount-back

	    cat /tmp/valeNetrw-BGrepped-umount-back | awk '$1 > 0 {print $7}' > /tmp/valeNetrw-mountedPtoB
				  
	    leggoMountedPtoB=$(cat /tmp/valeNetrw-mountedPtoB)

	    echo "corrente posizione del terminale (\$PWD)" > /tmp/ValeParted/$leggoA/$leggoB/pwd

	    echo " " >> /tmp/ValeParted/$leggoA/$leggoB/pwd

	    sudo blkid /dev/$leggoB >> /tmp/ValeParted/$leggoA/$leggoB/pwd

	    echo " " >> /tmp/ValeParted/$leggoA/$leggoB/pwd

            df -h /dev/$leggoB >> /tmp/ValeParted/$leggoA/$leggoB/pwd

	    echo "|--/dev/$leggoA" >> /tmp/valeNetrw-ValeDiskTree

	    cat /tmp/valeNetrw-ValeDiskTree | sed 's/\|\_\_\/dev\/'$leggoB'//g' > /tmp/valeNetrw-ValeDiskTree2

	    cat /tmp/valeNetrw-ValeDiskTree2 | sed 's/\|\/pwd//g' > /tmp/valeNetrw-ValeDiskTree3

	    rm /tmp/valeNetrw-ValeDiskTree
                    
	    cp /tmp/valeNetrw-ValeDiskTree3 /tmp/valeNetrw-ValeDiskTree
	    
	    grep "$leggoB"  /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-BGrepped-umount-back

            cat /tmp/valeNetrw-BGrepped-umount-back | awk '$1 > 0 {print $4}' > /tmp/valeNetrw-dim
				  
            leggoDimensioni=$(cat /tmp/valeNetrw-dim)

	    cat /tmp/valeNetrw-BGrepped-umount-back | awk '$1 > 0 {print $7}' > /tmp/valeNetrw-ptoM
				  
            leggoPtoM=$(cat /tmp/valeNetrw-ptoM)


	   sudo blkid /dev/$leggoB > /tmp/valeNetrw-blkidOut1

           cat /tmp/valeNetrw-blkidOut1 | sed 's/ /./g' |  tr '.\n' '\n' > /tmp/valeNetrw-blkidOut1V

           grep "^PARTLABEL" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-partlabel

	   stat --format %s /tmp/valeNetrw-partlabel > /tmp/valeNetrw-bytes

	   leggoBytes=$(cat /tmp/valeNetrw-bytes)

	   if test $leggoBytes -gt 0
	   
	   then
	
		   echo " " > /dev/null
	
	   else
        
	      	   grep "^LABEL" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-partlabel
           
	   fi

	   
	   leggoPartLabel=$(cat /tmp/valeNetrw-partlabel)

	   grep "^TYPE" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-type
	   
	   stat --format %s /tmp/valeNetrw-type > /tmp/valeNetrw-bytes

	   leggoBytes=$(cat /tmp/valeNetrw-bytes)
	   
	   if test $leggoBytes -gt 0
	   
	     then
  
	         leggoPartType=$(cat /tmp/valeNetrw-type)

             else
	      
		 leggoPartType="unformatted"

	   fi
  
            echo "  |__/dev/$leggoB/pwd $leggoPartLabel $leggoPartType $leggoDimensioni $leggoPtoM" >> /tmp/valeNetrw-ValeDiskTree

            rm -f /tmp/ValeParted/$leggoA/$leggoB/info

	    rm -f /tmp/valeNetrw-splitDevMontati/$c
	
	 fi
       fi

      done

      for d in $(ls /tmp/valeNetrw-splitDevMontati/)
      
       do

        leggoD=$(cat /tmp/valeNetrw-splitDevMontati/$d)

	if test $leggoB == $leggoD
	  
	 then

	  grep "$leggoD"  /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-BGrepped-umount-back

	  cat /tmp/valeNetrw-BGrepped-umount-back | awk '$1 > 0 {print $4, $7}' > /tmp/valeNetrw-mountedPtoB
				  
	  leggoMountedPtoB=$(cat /tmp/valeNetrw-mountedPtoB)

          if [ -d /tmp/ValeParted/$leggoA/$leggoB ]; then
			       
 	   ## echo "pto. di mount: $leggoMountedPtoB" > /tmp/ValeParted/$leggoA/$leggoB/mounted

	   ## echo " " >> /tmp/ValeParted/$leggoA/$leggoB/mounted

	   sudo blkid /dev/$leggoB >> /tmp/ValeParted/$leggoA/$leggoB/mounted

	   echo " " >> /tmp/ValeParted/$leggoA/$leggoB/mounted

           df -h /dev/$leggoB >> /tmp/ValeParted/$leggoA/$leggoB/mounted

	   cat /tmp/ValeParted/$leggoA/$leggoB/mounted | sort > /tmp/valeNetrw-mountedSort

           cat /tmp/valeNetrw-mountedSort | uniq > /tmp/valeNetrw-mountedUniq1

	   cat /tmp/valeNetrw-mountedUniq1 | tail -n3 > /tmp/valeNetrw-mountedEmpty

	   cat /tmp/valeNetrw-mountedEmpty | sed 's/$/\n/g' > /tmp/valeNetrw-mountedInsertEmptyLine

	   cat /tmp/valeNetrw-mountedInsertEmptyLine | head -n3 > /tmp/valeNetrw-mountedHead3

	   cat /tmp/valeNetrw-mountedInsertEmptyLine | tail -n2 > /tmp/valeNetrw-mountedHeader1

	   cat /tmp/valeNetrw-mountedHeader1 | sed '/^$/d' > /tmp/valeNetrw-mountedHeader

	   cat /tmp/valeNetrw-mountedHeader /tmp/valeNetrw-mountedHead3 > /tmp/ValeParted/$leggoA/$leggoB/mounted

	   echo "|--/dev/$leggoA" >> /tmp/valeNetrw-ValeDiskTree

	   grep "$leggoB"  /tmp/valeNetrw-lsblkOut1 > /tmp/valeNetrw-BGrepped-umount-back

           cat /tmp/valeNetrw-BGrepped-umount-back | awk '$1 > 0 {print $4}' > /tmp/valeNetrw-dim
				  
           leggoDimensioni=$(cat /tmp/valeNetrw-dim)

	   cat /tmp/valeNetrw-BGrepped-umount-back | awk '$1 > 0 {print $7}' > /tmp/valeNetrw-ptoM
				  
           leggoPtoM=$(cat /tmp/valeNetrw-ptoM)

	   sudo blkid /dev/$leggoB > /tmp/valeNetrw-blkidOut1

           cat /tmp/valeNetrw-blkidOut1 | sed 's/ /./g' |  tr '.\n' '\n' > /tmp/valeNetrw-blkidOut1V

           grep "^PARTLABEL" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-partlabel

	   stat --format %s /tmp/valeNetrw-partlabel > /tmp/valeNetrw-bytes

	   leggoBytes=$(cat /tmp/valeNetrw-bytes)

	   if test $leggoBytes -gt 0

	   then
		   echo " " > /dev/null

	   else

      		   grep "^LABEL" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-partlabel
      
      	   fi

	   leggoPartLabel=$(cat /tmp/valeNetrw-partlabel)

	   grep "^TYPE" /tmp/valeNetrw-blkidOut1V | cut -d= -f2 | sed 's/\"//g' > /tmp/valeNetrw-type

	   stat --format %s /tmp/valeNetrw-type > /tmp/valeNetrw-bytes

	   leggoBytes=$(cat /tmp/valeNetrw-bytes)
	   
	   if test $leggoBytes -gt 0
	   
	     then
  
	         leggoPartType=$(cat /tmp/valeNetrw-type)

             else
	      
		 leggoPartType="unformatted"

	   fi
  
	  ### per non avere ripetizioni 
	   cat /tmp/valeNetrw-ValeDiskTree | sed 's/\|\_\_\/dev\/'$leggoB'//g' > /tmp/valeNetrw-ValeDiskTree2

	   rm /tmp/valeNetrw-ValeDiskTree
                    
	   cp /tmp/valeNetrw-ValeDiskTree2 /tmp/valeNetrw-ValeDiskTree
	   
           echo "  |__/dev/$leggoB/mounted $leggoPartLabel $leggoPartType $leggoDimensioni $leggoPtoM" >> /tmp/valeNetrw-ValeDiskTree

	   rm -f /tmp/ValeParted/$leggoA/$leggoB/pwd

	   rm -f /tmp/ValeParted/$leggoA/$leggoB/info

#	   echo "/dev/$leggoB 	 $leggoMountedPtoB" >> /tmp/valeNetrw-mountedPartTree
	   	             
	 
	fi


	

       fi
	
      done
   
   fi
  
		 
   done

done

sleep 1



sort /tmp/valeNetrw-ValeDiskTree > /tmp/valeNetrw-ValeDiskTreeS

rm /tmp/valeNetrw-ValeDiskTree

cat /tmp/valeNetrw-ValeDiskTreeS | uniq > /tmp/valeNetrw-ValeDiskTreeS1

cat /tmp/valeNetrw-ValeDiskTreeS1 | sed '/^  |\/mounted/d' > /tmp/valeNetrw-ValeDiskTree

grep -n "\-\-\/" /tmp/valeNetrw-ValeDiskTree | head -n1 | awk '$1 > 0 {print $1}' | cut -d: -f1,1 > /tmp/valeNetrw-Idisco

leggoIdisco=$(cat /tmp/valeNetrw-Idisco)

echo $leggoIdisco -1| bc > /tmp/valeNetrw-lineaPrimaDelIDisco

leggoLineaPrimaDelIDisco=$(cat /tmp/valeNetrw-lineaPrimaDelIDisco)

echo "$leggoLineaPrimaDelIDisco dd" > /tmp/valeNetrw-preCommand

vim -c '%s/[\ ]//g' /tmp/valeNetrw-preCommand -c :w -c :q

leggoPreCommand=$(cat /tmp/valeNetrw-preCommand)

echo "1G$leggoPreCommand
ZZ" > /tmp/valeNetrw-commandDelFirstLine

vim -s /tmp/valeNetrw-commandDelFirstLine /tmp/valeNetrw-ValeDiskTree

cat /tmp/valeNetrw-ValeDiskTree | awk '$1 > 0 {print $1}' > /tmp/valeNetrw-ValeDiskTreeIcampo

#read -p "testing 835" EnterNull

cat /tmp/valeNetrw-ValeDiskTree | awk '$1 > 0 {print $2}' > /tmp/valeNetrw-ValeDiskTreeIIcampo

cat /tmp/valeNetrw-ValeDiskTree | awk '$1 > 0 {print $3}' > /tmp/valeNetrw-ValeDiskTreeIIIcampo

cat /tmp/valeNetrw-ValeDiskTree | awk '$1 > 0 {print $4}' > /tmp/valeNetrw-ValeDiskTreeIVcampo

cat /tmp/valeNetrw-ValeDiskTree | awk '$1 > 0 {print $5}' > /tmp/valeNetrw-ValeDiskTreeVcampo

cat /tmp/valeNetrw-ValeDiskTreeIcampo |  sed 's/$/............../' > /tmp/valeNetrw-ValeDiskTreeIcampo1

cat /tmp/valeNetrw-ValeDiskTreeIcampo1 | cut -c 1-20 > /tmp/valeNetrw-ValeDiskTreeIparte

paste /tmp/valeNetrw-ValeDiskTreeIparte /tmp/valeNetrw-ValeDiskTreeIIcampo > /tmp/valeNetrw-ValeDiskPaste1

cat /tmp/valeNetrw-ValeDiskPaste1 |  sed 's/$/................../' > /tmp/valeNetrw-ValeDiskTreePostPaste1

cat /tmp/valeNetrw-ValeDiskTreePostPaste1 | cut -c 1-40 > /tmp/valeNetrw-ValeDiskTreePreIIICampo

paste /tmp/valeNetrw-ValeDiskTreePreIIICampo /tmp/valeNetrw-ValeDiskTreeIIIcampo > /tmp/valeNetrw-ValeDiskPaste2

cat /tmp/valeNetrw-ValeDiskPaste2 |  sed 's/$/................../' > /tmp/valeNetrw-ValeDiskTreePostPaste2

cat /tmp/valeNetrw-ValeDiskTreePostPaste2 | cut -c 1-55 > /tmp/valeNetrw-ValeDiskTreePreIVCampo

paste /tmp/valeNetrw-ValeDiskTreePreIVCampo /tmp/valeNetrw-ValeDiskTreeIVcampo > /tmp/valeNetrw-ValeDiskPaste3

cat /tmp/valeNetrw-ValeDiskPaste3 |  sed 's/$/................../' > /tmp/valeNetrw-ValeDiskTreePostPaste3

cat /tmp/valeNetrw-ValeDiskTreePostPaste3 | cut -c 1-65 > /tmp/valeNetrw-ValeDiskTreePreVCampo

paste /tmp/valeNetrw-ValeDiskTreePreVCampo /tmp/valeNetrw-ValeDiskTreeVcampo > /tmp/valeNetrw-ValeDiskTreePunti


cat /tmp/valeNetrw-ValeDiskTreePunti | sed 's/\./ /g' > /tmp/valeNetrw-ValePartedTree

#vim -c /|_/\-\-\/dev/g /tmp/valeNetrw-ValePartedTree -c :w -c :q

## notazione scientifica delle cifre decimali
vim -c :%s/\,/\./g /tmp/valeNetrw-ValePartedTree -c :w -c :q


grep "|--" /tmp/valeNetrw-ValePartedTree > /tmp/valeNetrw-pipeTrattini

rm -fr /tmp/valeNetrw-splitPipeTrattini

mkdir /tmp/valeNetrw-splitPipeTrattini

split -l1 /tmp/valeNetrw-pipeTrattini /tmp/valeNetrw-splitPipeTrattini/

rm -f /tmp/valeNetrw-blocco

for e in $(ls /tmp/valeNetrw-splitPipeTrattini/)
do
	cat /tmp/valeNetrw-splitPipeTrattini/$e | sed 's/|\-\-//g' > /tmp/valeNetrw-chiaveE

	leggoChiaveE=$(cat /tmp/valeNetrw-chiaveE)

	grep $leggoChiaveE /tmp/valeNetrw-ValePartedTree > /tmp/valeNetrw-bassi

	leggoBassi=$(cat /tmp/valeNetrw-bassi)

	echo "|
$leggoBassi" >> /tmp/valeNetrw-blocco

done


echo "e2 98 85" | xxd -r -p > /tmp/valeNetrw-star

echo " " >> /tmp/valeNetrw-star


echo | cat /tmp/valeNetrw-blocco >> /tmp/valeNetrw-star


mv /tmp/valeNetrw-star /tmp/valeNetrw-ValePartedTree 

clear

echo " "

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ValeParted ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

cat /tmp/valeNetrw-ValePartedTree
 
#cat /tmp/valeNetrw-mountedPartTree | uniq > /tmp/valeNetrw-mountedPartTreeM	

#echo " "
#echo "** /tmp/valeNetrw-mountedPartTreeM
#* Dimensioni massime e pti. di montaggio di partizioni che non sono ovviamente:
#* radice, boot."
#echo " "

#cat /tmp/valeNetrw-mountedPartTreeM

echo " "
echo " "
echo " "

echo "Se tu volessi conoscere più dettagli riguardo a una o più partizioni,
dovresti montarla/e e riavviare valeparted.

Invece i dischi privi di partizioni, seppur aventi una tabella di partizionamento,
non vengono stampati nello stdout del terminale ma compaiono solo nella finestra
di valeparted; puoi intervenire anche con tali dischi privi di partizionamento.

Eventuale contenuto dello stderr è ininfluente.

"

echo " "

######## Apertura di ValeParted
gvim -f -geometry 20x30 /tmp/ValeParted/

### Ripristino di netrw file manager
cp /usr/local/share/valentine/fileManager/plugin/Valentine.vim.file ~/.vim/plugin/Valentine/Valentine.vim

sudo cp /usr/local/share/valentine/fileManager/autoload/netrw.vim.file /usr/share/vim/vim82/autoload/netrw.vim

sudo cp -r /usr/local/share/valentine/fileManager/etc/vim /etc

sudo chown root:root /etc/vim 2> /dev/null

sudo chmod ugao-xrw /etc/vim 2> /dev/null

sudo chmod uga+r /etc/vim 2> /dev/null

sudo chmod ga+x /etc/vim 2> /dev/null

sudo chmod g-w /etc/vim 2> /dev/null

sudo chmod u+w /etc/vim 2> /dev/null

sudo chmod ugao-xrw /etc/vim/* 2> /dev/null

sudo chmod uga+r /etc/vim/* 2> /dev/null

sudo chmod u+w /etc/vim/* 2> /dev/null

rm -r /tmp/valeNetrw*

rm -r  ~/.vim/plugin/Valentine/netrw/commands/valeparted

exit


