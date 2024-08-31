#!/bin/bash




echo $PWD > /tmp/devskio-pos



################### Inizio Elenca le partizioni montate
################# Alternativa  a ~$ mount
################# mount stampa tutti i punti di montaggio anche quelli virtuali i.e.


#### Disco della radice

#findmnt -n -l -M / > /tmp/devskio-radice1




#### Disco di /boot/efi
#findmnt -n -l -M /boot/efi > /tmp/devskio-bootEfi1




#### Le reali partizioni montate (/, /boot/efi/, i.e. /mnt/sourceData5)
findmnt -n -l --real -o TARGET > /tmp/devskio-real1

################ Fine Elenca partizioni montate



############### Inizio scarto dallo smontaggio e dallo spegnimento le partizioni
############# radice, boot e posizione corrente del terminale.

rm -rf /tmp/devskio-splitReal

mkdir /tmp/devskio-splitReal


split -l 1 /tmp/devskio-real1 /tmp/devskio-splitReal/

for a in $(ls /tmp/devskio-splitReal/)

 do
	 
	 leggoA1="$(cat /tmp/devskio-splitReal/$a)"


	####################### Scarto della radice 
  if test $leggoA1 == "/"
 
  then

     rm /tmp/devskio-splitReal/$a
  fi

  ############################ Scarto di /boot/efi
  if test $leggoA1 == "/boot/efi"

  then

      	  rm /tmp/devskio-splitReal/$a

  fi


  ############################# Scarto di $PWD
	  ##### se il punto di montaggio è contenuto nella posizione corrente del mio terminale 
	  #### non devo né smontare la partizione associata né spegnere il disco associato:

### con terminalPos la stampa effettuata con $PWD 
## escludo dallo smontaggio la directory in cui sono posizionato.

### i.e. con il terminale sono posizionato in /mnt/stock/test, contenuto in /tmp/devskio-pos
cat /tmp/devskio-pos | sed -e 's/\//\\\//g' > /tmp/devskio-posed

cut -d/ -f2,3 /tmp/devskio-posed > /tmp/devskio-posed1

### devo togliere l'ultima << \ >> perché il punto di montaggio non ha l'ultima << / >>
cut -d'\' -f2,1 /tmp/devskio-posed1 > /tmp/devskio-posed2

## ora ho mnt\/stock indipendentemente dalla profondità della mia posizione del terminale,
## in quanto  taglio sempre alla seconda << / >> ossia alla profondità del pto. di montaggio
## che voglio escludere perché in esso è contenuto la mia posizione nel terminale.

### ristabilisco la << / >> per avere << mnt/stock >>
cat /tmp/devskio-posed2 | sed -e 's/\\//g' > /tmp/devskio-posed3

posTagliato="/$(cat /tmp/devskio-posed3)"

Itermine="$posTagliato"


if test $Itermine == $leggoA1
 then


	  rm /tmp/devskio-splitReal/$a

fi

rm /tmp/devskio-posed /tmp/devskio-posed1 /tmp/devskio-posed2 /tmp/devskio-posed3

done



######## smontaggio e spegnimento delle partizioni generiche


for b in $(ls /tmp/devskio-splitReal/)

 do
   
   #### per smontare una partizione posso utilizzare sia il suo punto di montaggio che il suo nome di device
   leggoMountedGenericPart="$(cat /tmp/devskio-splitReal/$b)"


   #### per spegnere invece ho bisogno del nome del device: SOURCE
   ## !!! Va letto prima il device ancora prima di smontare la partzione a esso associata altrimenti
   ## findmnt legge sempre il device di sistema come device falsato.
   findmnt -n --target $leggoMountedGenericPart -o SOURCE > /tmp/devskio-nomeDevice

   leggoNomeDevice="$(cat /tmp/devskio-nomeDevice)"


   sudo umount -l $leggoMountedGenericPart

   sleep 3
########### Inizio test 
    sudo udisksctl power-off -b $leggoNomeDevice 2> /dev/null

   sleep 2
  ################ fine test


done

########## Tutti anche quelli non montati, ma mai quelli:
##### in cui sono posizionato con il terminale;
##### quello della radice.
##### In realtà dovrei anche eseguire lo stesso discorso se avessi /tmp/ montato su un altro disco,
##### ossia se avessi il sistema partizionato ma questo script lo utilizzo per spegnere il pc soprattutto ->
##### quindi per ora va bene così.

lsblk > /tmp/devskio-lsblkOut1

cat /tmp/devskio-pos | sed -e 's/\//\\\//g' > /tmp/devskio-posed

cut -d/ -f2,3 /tmp/devskio-posed > /tmp/devskio-posed1

## devo togliere l'ultima << \ >> perché il punto di montaggio non ha l'ultima << / >>
cut -d'\' -f2,1 /tmp/devskio-posed1 > /tmp/devskio-posed2

## ora ho mnt\/stock indipendentemente dalla profondità della mia posizione del terminale,
## in quanto  taglio sempre alla seconda << / >> ossia alla profondità del pto. di montaggio
## che voglio escludere perché in esso è contenuto la mia posizione nel terminale.

## ristabilisco la << / >> per avere << mnt/stock >>
cat /tmp/devskio-posed2 | sed -e 's/\\//g' > /tmp/devskio-posed3

posTagliato="/$(cat /tmp/devskio-posed3)"

Itermine="$posTagliato"

grep "$Itermine"  /tmp/devskio-lsblkOut1 | awk '$1 > 0 {print $1}' > /tmp/devskio-devicePWD0

cat /tmp/devskio-devicePWD0  | sed 's/└─//' > /tmp/devskio-devicePWD1

cat /tmp/devskio-devicePWD1 | sed 's/├─//' > /tmp/devskio-devicePWD

leggoDevPWD=$(cat /tmp/devskio-devicePWD)

### device montato della radice

grep "/" /tmp/devskio-lsblkOut1 > /tmp/devskio-mount1

rm -rf /tmp/devskio-splitRadice

mkdir /tmp/devskio-splitRadice
 
split -l1 /tmp/devskio-mount1 /tmp/devskio-splitRadice/

for a in $(ls /tmp/devskio-splitRadice/)

 do

  cat /tmp/devskio-splitRadice/$a | awk '$1 > 0 {print $7}' > /tmp/devskio-ultimoCampo

  stat --format %s /tmp/devskio-ultimoCampo > /tmp/devskio-bytes

  leggoBytes=$(cat /tmp/devskio-bytes)

  ## la radice ha 2 bytes
  if test $leggoBytes -eq 2
  
   then
  
    cat /tmp/devskio-splitRadice/$a | awk '$1 > 0 {print $1}' > /tmp/devskio-deviceRadice0
   
    cat  /tmp/devskio-deviceRadice0 | sed 's/└─//' > /tmp/devskio-deviceRadice1

    cat /tmp/devskio-deviceRadice1 | sed 's/├─//' > /tmp/devskio-deviceRadice
  
  fi

done

leggoPartRadice=$(cat /tmp/devskio-deviceRadice 2> /dev/null)

### eventuale device montato per il boot

grep "boot" /tmp/devskio-lsblkOut1 > /tmp/devskio-mount1

cat /tmp/devskio-mount1 | awk '$1 > 0 {print $1}' > /tmp/devskio-deviceBoot0

cat /tmp/devskio-deviceBoot0 | sed 's/└─//' > /tmp/devskio-deviceBoot1

cat /tmp/devskio-deviceBoot1 | sed 's/├─//' > /tmp/devskio-deviceBoot

leggoPartBoot=$(cat /tmp/devskio-deviceBoot)

cat /tmp/devskio-lsblkOut1 | awk '$1 > 0 {print $1}' > /tmp/devskio-dischi1

cat /tmp/devskio-dischi1 | sed '/^NAME/d' > /tmp/devskio-dischi2

cat /tmp/devskio-dischi2 | sed '/^├─/d' > /tmp/devskio-dischi3

cat /tmp/devskio-dischi3 | sed '/^└─/d' > /tmp/devskio-dischi4

##  /tmp/devskio-dischi4
## Questi sono i nomi dei device

### Ora le partizioni

comm -3 /tmp/devskio-dischi4 /tmp/devskio-dischi2 2> /dev/null | tee /tmp/devskio-partizioni1 > /dev/null

cat /tmp/devskio-partizioni1 | sed 's/├─//g' > /tmp/devskio-partizioni2

cat /tmp/devskio-partizioni2 | sed 's/└─//g' > /tmp/devskio-partizioni3

cat /tmp/devskio-partizioni3 | awk '$1 > 0 {print $1}' > /tmp/devskio-partizioni4

sort /tmp/devskio-partizioni4 > /tmp/devskio-partizioni5

cat /tmp/devskio-partizioni5 > /tmp/devskio-partizioni6


sudo fdisk -l > /tmp/devskio-fdisk1

grep "Disk /" /tmp/devskio-fdisk1 > /tmp/devskio-fdisk2

cat /tmp/devskio-fdisk2 | awk '$1 > 0 {print $2}' > /tmp/devskio-fdisk3

cat /tmp/devskio-fdisk3 | sed 's/://g' > /tmp/devskio-fdisk4

mkdir /tmp/devskio-splitAll


split -l1 /tmp/devskio-fdisk4 /tmp/devskio-splitAll/

for c in $(ls /tmp/devskio-splitAll)
 do

  leggoDevice="$(cat /tmp/devskio-splitAll/$c)"

  cat /tmp/devskio-splitAll/$c | cut -d/ -f3,3 > /tmp/devskio-nomeDeviceCut

  leggoNomeDeviceCut="$(cat /tmp/devskio-nomeDeviceCut)"

  grep "$leggoNomeDeviceCut" /tmp/devskio-devicePWD > /tmp/devskio-bytesDevicePWD
 
  stat --format %s /tmp/devskio-bytesDevicePWD > /tmp/devskio-bytesDevicePWDStat

  leggoBytesPWD=$(cat /tmp/devskio-bytesDevicePWDStat)

  if test ! $leggoBytesPWD -gt 0
 
   then
 
	   grep "$leggoNomeDeviceCut" /tmp/devskio-deviceRadice > /tmp/devskio-bytesDeviceRadice
 
           stat --format %s /tmp/devskio-bytesDeviceRadice > /tmp/devskio-bytesDeviceRadiceStat

           leggoBytesRadice=$(cat /tmp/devskio-bytesDeviceRadiceStat)

           if test ! $leggoBytesRadice -gt 0
 
              then

		      #### Spengo anche l'eventuale  device  di boot, quindi non effettuo il test per esso
#	  	   grep "$leggoNomeDeviceCut" /tmp/devskio-deviceBoot > /tmp/devskio-bytesDeviceBoot
 
#           stat --format %s /tmp/devskio-bytesDeviceBoot > /tmp/devskio-bytesDeviceBootStat

#           leggoBytesBoot=$(cat /tmp/devskio-bytesDeviceBootStat)

#          if test ! $leggoBytesBoot -gt 0
 
#              then


          sudo udisksctl power-off -b $leggoNomeDevice 2> /dev/null

#	   fi

    fi

  fi


done







rm -fr /tmp/devskio*



exit


