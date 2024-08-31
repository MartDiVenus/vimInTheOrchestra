#!/bin/bash


### Do la priorità dello strappo a copyq, perché per questo scopo
## non ha pari a mio avviso.

if [ -f /usr/bin/copyq ]; then
   /usr/bin/copyq copy - < $(cat /tmp/valeNetrw-SMarked)
else
   vim -c :%y+ /tmp/valeNetrw-SMarked -c :q
fi



