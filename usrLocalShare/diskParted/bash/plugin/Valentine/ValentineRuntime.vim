" Vim global plugin to load Valentine's plugins.
" Title: ValentineRuntime.vim
" Last Change:	2022 jul 18
" Author:  Mario Fantini "MartDiVenus" <ing.mariofantini@gmail.com> 
"          https://github.com/MartDiVenus/
" Copyright: Mario Fantini's copyright: Creative Commons by-nc-sa-eu.
"            Bram Moolenaar's  copyright  applies  to all  Mario Fantini's  vim
"            files, see << :he copyright >>.
"            Charles E. Campbell's copyright applies  to  all  Mario  Fantini's
"            netrw codex "brushstrokes"  and  netrw  colours  brushstrokes, see
"            Copyright (C) 2016 - Charles E. Campbell -. 
"            /usr/share/vim/vim*/autoload/netrw.vim
"            :he pi_netrw 


" Main Plugin: Valentine  {{{1

" App: netrw {{{2

" Theme: bookmarks {{{3

" Task: Making bookmarks
" name: MainBookmarks.vim {{{4
" status: testing
runtime! plugin/Valentine/netrw/bookmarks/MainBookmarks.vim

" Others: Directly loaded by Valentine.vim (see Theme:  boookmarks e cronologia) 

"4}}}

" Theme: marking and commands {{{3
"
"" Task: bd: execute script/program for fd*; 
" name: NetrwBd.vim 
runtime! plugin/Valentine/netrw/commands/NetrwBd.vim
"
"" Task: bm: execute script/program for fm*; 
" name: NetrwBm.vim 
runtime! plugin/Valentine/netrw/commands/NetrwBm.vim
"
" Task: h: Remarking current folder; 
" name: NetrwMarkedCurrentFolder.vim 
runtime! plugin/Valentine/netrw/marks/NetrwCurrentFolder.vim

" Task: fd: Remarking cp destination folders; 
"       Remarking mv destination folder;
"       Remarking opening terminal folder.
" name: NetrwMarkedDest.vim 
runtime! plugin/Valentine/netrw/marks/NetrwMarkedDest.vim

" Task: fm: Remarking cp, mv, rm source files/folders 
" name: NetrwFlushMarkedSource.vim 
runtime! plugin/Valentine/netrw/marks/NetrwMarkedSource.vim

" Task: fsd: Flushing of destination remarked folders
" name: NetrwFlushMarkedDest.vim
runtime! plugin/Valentine/netrw/marks/NetrwFlushMarkedDest.vim

" Task: fs#d: Flushing of some destination remarked folders
" name: NetrwFlushSomeMarkedDest.vim
runtime! plugin/Valentine/netrw/marks/NetrwFlushSomeMarkedDest.vim

" Task: fsm: Flushing of source remarked files/folders
" name: NetrwFlushMarkedSource.vim 
runtime! plugin/Valentine/netrw/marks/NetrwFlushMarkedSource.vim

" Task: fs#m: Flushing of some source remarked files/folders
" name: NetrwFlushSomeMarkedSource.vim 
runtime! plugin/Valentine/netrw/marks/NetrwFlushSomeMarkedSource.vim

" Task: fc: Copio nella cartella rimarcata con fd, i file rimarcati con fm
" name: NetrwCopy.vim
runtime! plugin/Valentine/netrw/commands/NetrwCopy.vim
"
" Task: Script che necessita a NetrwCopy (digitazione manuale di una o più
" cartelle di destinazione) 
" name: TypeCopyDest.vim
runtime! plugin/Valentine/netrw/commands/TypeCopyDests.vim
"
" Task: fv: Taglio nella cartella rimarcata con fd, i file rimarcati con fm.
" name: NetrwMv.vim
runtime! plugin/Valentine/netrw/commands/NetrwMv.vim

" Task: fR: Elimino i file rimarcati con fm.
" name: NetrwRm.vim 
" TESTING LOADING PLUGIN, NetrwRm.vim funziona bene in autoload.
runtime! plugin/Valentine/netrw/commands/NetrwRm.vim

" Task: ft: (In fase di sviluppo)
" Strappo nella clipboard il contenuto di /tmp/valeNetrw-SMarked
" name: NetrwTear.vim
runtime! plugin/Valentine/netrw/commands/NetrwTear.vim

" Task: ot: Apri un terminale nella cartella marcata con fd
" name: NetrwOpenTerm.vim
runtime! plugin/Valentine/netrw/commands/NetrwOpenTerm.vim


"" Valedisks: Faccio caricare le funzioni direttamente a
"Valedisks per alleggerire il cervello di vim/Valentine.

" Task: mo: Partitions mounting [mo]
" name: NetrwMountPart.vim
"runtime! plugin/Valentine/netrw/commands/valedisks/NetrwMountPart.vim

" Task: mu: Partitions umounting [mu]
" name: NetrwUmountPart.vim
"runtime! plugin/Valentine/netrw/commands/valedisks/NetrwUmountPart.vim

" Task: bu: disk suspension (disk stand-by mode) [bu]
" name: NetrwSuspendDisk.vim
"runtime! plugin/Valentine/netrw/commands/valedisks/NetrwSuspendDisk.vim

" Task: bo: disk sleep mode [bo]
" name: NetrwSleepDisk.vim
"runtime! plugin/Valentine/netrw/commands/valedisks/NetrwSleepDisk.vim

" Task: ba: turning off all disks [ba]
" name: NetrwOffAllDisks.vim
"runtime! plugin/Valentine/netrw/commands/valedisks/NetrwOffAllDisks.vim
"


"" Valeparted: per alleggerire il cervello di vim/Valentine.
" Task: mo: Partitions mounting [mo]
" name: NetrwMountPart.vim
" info: differente da quello di valedisks perché monto in sola lettura.
"runtime! plugin/Valentine/netrw/commands/valeparted/NetrwMountPart.vim
"
"" Task: mu: Partitions umounting [mu]
" name: NetrwUmountPart.vim
" info: uguale a quello di valedisks, ma per ordine separo.
"runtime! plugin/Valentine/netrw/commands/valeparted/NetrwUmountPart.vim


" Task: cc: windows owner recovering [cc]
" name: NetrwRecover1.vim
runtime! plugin/Valentine/netrw/commands/NetrwRecover1.vim

