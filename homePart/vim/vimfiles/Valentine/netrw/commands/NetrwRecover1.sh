#!/bin/bash

### Per non avere problemi con future finestre di netrw con utente normale

sudo rm -f /tmp/curuserechoed

echo $USER > /tmp/curuserechoed

curuser=$(cat /tmp/curuserechoed)

sudo chown $curuser:$curuser /tmp/valeNetrw* 2> /dev/null

sudo chown -R $curuser:$curuser /tmp/valeNetrw-split* 2> /dev/null


sudo chmod uga+rw /tmp/valeNetrw* 2> /dev/null

sudo chmod -R uga+xrw /tmp/valeNetrw-split* 2> /dev/null

sudo rm -fr /tmp/valeNetrw-split* 2> /dev/null

exit


