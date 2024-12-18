" Vim global plugin about Valentine's art in Vim's art.
" Title: Velentine
" Name: Valentine.vim for Vim
" Help: :he Valentine
" Last Change:	2021 Nov 27
" Author:  Mario Fantini "MartDiVenus" <ing.mariofantini@gmail.com> 
"          https://github.com/MartDiVenus/
" Copyright: Mario Fantini's copyright: Creative Commons by-nc-sa-eu.
"            Bram Moolenaar's  copyright  applies  to all  Mario Fantini's  vim
"            files, see << :he copyright >>.
"            Charles E. Campbell's copyright applies  to  all  Mario  Fantini's
"            netrw codex "brushstrokes"  and  netrw  colours  brushstrokes, see
"            Copyright (C) 2016 - Charles E. Campbell -. 
"            /usr/share/vim/vim*/autoload/netrw.vim
"            :he Valentine 


if exists("g:loaded_Valentine")
  finish
endif

let g:loaded_Valentine = 1

" Settings: {{{1

" Main Settings: {{{2


" Compatibility: {{{3
set nocompatible


" Encoding: {{{3

" Per visualizzare bene la maggior parte dei testi, è meglio utilizzare utf-8
set encoding=utf-8

" Per stampare simboli come l'euro mi serve latin9. latin9 è la codifica del mondo occidentale prettamente, 
" non uso esso anche per la digitazione perché non contempla i.e. la << à >>.
" Questo metodo di digitare in utf-8 e stampare in latin9, ma mi crea problemi con la stampa su terminale
" per i file che non apro sempre con ctesto.sh.
" Quindi quest'opzione falla manualmente quando ti occorre stampare l'euro.
" set printencoding=latin9
set printencoding=utf-8


" Lines And Columns: {{{3

"" Writed lines numbers
" useful to detect not wrapped lines too
set number

"" Lines and Column Cursor position
" Show the line and column number of the cursor position, separated by a comma
set ruler


" Text Formatting: {{{3

" Fonts
set guifont=DejaVu\ Sans\ Mono\ 12

" Paragraph
packadd justify


" Stdout And Stderr: {{{3

""" Per troncare e non avere alcuni messagi nello standard error, 
"" anche se non sono errori, tipo l'innocuo 
"" << Hit Enter ... to continue >>
"set shortmess=a

"" Number of screen lines to use for the command-line.  Helps avoiding
" |hit-enter| prompts.
set cmdheight=2

"" Per separare lo standard out dallo standard error
" :he shellredir


" Command Line: {{{3

" command line history (he: cmdline-history)
set history=7      " history: keep 7 lines of command line history


" X Clipboard: {{{3
"
" Spiegazione ->
"""" xclip tear (strappo)
"
""" 1. Strappo dal terminale (bash in vi mode avviata con [Esc-v]):
"" 1.1 [Esc] 
"" 1.2 Seleziona contenuto con [v-cursore] o [Shift-v] per l'intera riga
"" 1.3 [y+]
"" 1.4 Se non vuoi eseguire il contenuto nella shell:
""      [dd] [ZZ]]
"" 1.5 Incolla dove vuoi il contenuto strappato
"
""" 2. Strappo da file
"" 2.1 fileTo="percorso e nome del file di cui strappare il contenuto"
"" 2.2 ~$ vim -c :%y+ $fileTo -c :q
"" 2.3 Incolla
"
" Strappo -> 
" Copio del contenuto dei file nella X clipboard:
" unnamedplus (se in dotazione) copia anche i contenuti rimossi, i.e.
" se io volessi eliminassi un blocco di testo da un file, esso verrebbe
" strappato automaticamente nella X11 clipboard, per poter essere incollato
" altrove. 
" Potrei anche stabilire un condizionale, in modo da attivare unnamedplus
" se in dotazione nel sistema:
"
" if has('unnamedplus')
"  set clipboard=unnamedplus
" else
"  set clipboard=unnamed
" endif
"
" Ma preferisco l'impostazione classica unnamed:
" 1. seleziono un blocco di testo
" 2. Modifica -> Copia 
" 3. Incollo altrove.

set clipboard=unnamed

autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xclip -selection c")


" Geometry: {{{3

""" Per il launcher imposto il file ~/.config/xfce4/panel/launcher.../gvim
"" con l'opzione << -geometry 100x100 >> alla voce << Exec >>.
"" Il file ~/.config/xfce4/panel/launcher.../gvim lo trovi posizionandoti con il terminale in
"" ~/.config/xfce4/panel/ ed eseguendo << ~$ grep -r "gvim" >>
""
"" Per aprire i file manualmente alla massima espansione della finestra, spingi la finestra in alto verso il pannello superiore.
""
"" Per aprire i file manualmente nella geometria designata puoi trascinarli in gvim aperto dopo essere stato lanciato dal pannello.
""
"" Da linea di comando esegui << gvim -geometry 100x100 file >>
"" 
"" Dalle shell, subshell miei tools anche potrei avviare gvim con la suddetta opzione, opzione che entrerebbe in conflitto
"" se esprimessi il numero di linee e colonne qui. In caso di particolari necessità impostale manualmente in gvim una volta
"" aperto.
""
"" No impostare qui << set lines=55 >>
"" Non impostare qui << set columns=120 >>


" Syntax And Colours: {{{3

"" Global E File Di Testo: {{{4
" Le sintassi e i colori per i file di testo, quindi anche per codi, 
" li faccio caricare da pdflux/B/B3 tramite ctesto, gtesto, ltesto, luxtesto.
" Cmq lo schema di colore mart.vim e la sintassi mart.vim sono quelli miei di
" default.

"colorscheme mart

syntax enable

syntax on

"runtime! syntax/mart.vim

"" Netrw: {{{4
" La sintassi migliore per netrw è netrw.vim
" Lo schema di colori migliore per netrw è mart o ugualmente martLux
" quindi potrei creare una funzione NetrwFileTypeX() da richiamare con un gruppo netrw-filetype, i.e.
" <<
" function! NetrwFileType()
" 	colorscheme mart
" 	syntax enable
" 	syntax on
" 	runtime! syntax/netrw.vim
" 	endfunction
" >>
"
" <<
" augroup netrw-filetype
"  autocmd!
"  autocmd filetype netrw call NetrwFileType()
"augroup END 
" >>
" 
" Ma aprendo con netrw file di codici, compresi i miei *.lux, non avrei la sintassi giusta per quel
" tipo di file, quindi lascio la sintassi a ctesto tanto netrw lavora bene
" anche con le sintassi proprie dei codici e con la mia << mart >> (oltre al
" colore << mart >> ho anche la sintassi omonima << mart >>).
" Per quanto riguarda invece i colori, il problema non si pone tanto per
" ciascuna tipologia di file aperto con ctesto, gtesto, ltesto, luxtesto
" avrò sempre uno schema mia buono anche per netrw.
"
"
" Di sotto commentati quelli miei e di vim di default, << commentati >> per
" non aver sovrapposizione di istruzioni visto che carico le sintassi e gli
" schemi opportuni a pdflux/B/B3/..., a sua volta i gvimrc.local e vimrc.local
" caricata da pdflux/B/B3/... richiamano gValentine.vim. 
" Invece in Valentine.vim decommento tale sezione, visto che pedflux/B/B3/...
" l'ho pensata solo per gvim. Conviene separare anche sotto questo aspetto
" l'uso di gvim e vim. Con gvim avrò una stretta dipendenza con pdflux, mentre
" con vim avrò esso più indipendente.
"
" miei:
"colorscheme mart

"syntax enable

"syntax on

"runtime! syntax/mart.vim


" File Type: {{{3

"" Io uso anche ctesto di pdflux per aprire i differenti tipi di file,  tipo anche 
" quelli non riconosciuti da Vim quali i.e. i miei *.lux, *.edr, *.hex.
" C'è compatibilità tra << filetype on >> e pdflux/B/B3.
" i.e. in ctesto istruisco vim a leggere i miei file *.hex con la sintassi hexmart
" << autocmd BufNewFile,BufRead *.lux set ft=hexmart >>
"
" Riconoscimento automatico dei file (*filetypes* *file-types* *filetype-overview*),
"  è richiesta da molti plugin [anche non miei] tale opzione su on.
filetype on

"" Official help
" To see the current status, type:
" :filetype
"
"" Official help (*:filetype-plugin-on* *add-filetype-plugin* *ftplugins* *vimrc-filetype*
" *filetype-plugin-off* *filetype-indent-on* *filetype-indent-off* *filetype-overview*
" *filetype-detect* *filetype-overrule*	*filetype-ignore* *new-filetype* *ftdetect*
" *new-filetype-scripts* *remove-filetype* *autocmd-osfiletypes*)
" The Vim distribution comes with a set of plugins for different filetypes that
" you can start using with this command (*ftplugin-overrule*	*filetype-plugins*
filetype plugin on


" Vim
"colorscheme martLux

"syntax enable

"syntax on

"runtime! syntax/vim.vim


" Vim Coding Settings: {{{2

" Leader: {{{3
let mapleader = "_"


" Vimscript File Settings:  {{{2

" Folding Method: {{{3
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END



" Plugins Loading: {{{1
runtime! plugin/Valentine/ValentineRuntime.vim

call plug#begin('~/.vim/plugged')
Plug 'preservim/tagbar', { 'on': 'TagbarOpen', 'do': 'cp -r autoload/* ~/.vim/autoload' }
call plug#end()


" App: {{{1

" Netrw: {{{2

" Theme: {{{3

" Settings: {{{4

" Stili Di Navigazione E Apertura File: {{{5
" browser netrw: i:style di default: Informazioni dei file e delle cartelle
let g:netrw_liststyle=1

" browser netrw: Apertura dei file in nuove tab
let g:netrw_browse_split=3

" Special File Handling: {{{5
""" Di default il comando x << special >> apre i file *.pdf con okular,
"" i file *.html con google chrome.
" :he netrw_browsex_viewer
" con "-" rimando alle impostazioni di /usr/share/vim/vim82/autoload/netrwFileHandlers.vim
let g:netrw_browsex_viewer="-"
"
" Un'altra alternativa è quella manuale.
" 1. posizionati sul file e marcalo [mf]
" 2. [mx]
" 3. okular


" Boookmarks And History: {{{4
" Runtime: Dir di runtime {{{4
" di default hai i file:
" /home/mart/.vim/.netrwbook
" /home/mart/.vim/.netrwhist
" Non cambiare directory altrimenti hai l'errore antipatico ogni volta che
" esci da gvim, errore che puoi leggere solo con ~$ gvim . -V 
" :q 
" visto che uscendo senza l'opzione V, noti solo avvisi evidenziati in rosso
" e che non riesci a leggere perché troppo veloci ma cmq antipatici
" Questo perché ~/.gvim verrebbe creata da sola se utilizzassi netrw_home. 

" Mapping: {{{4
" Here Called Functions: {{{5
function! NetrwShowHistory()
	! grep "'" ~/.vim/.netrwhist > /tmp/valeNetrw-history1
	! cut -d_ -f1,3 /tmp/valeNetrw-history1 > /tmp/valeNetrw-history2
	! cut -d_ -f2,2 /tmp/valeNetrw-history2 > /tmp/valeNetrw-netrwHistory
	! rm /tmp/valeNetrw-history1 /tmp/valeNetrw-history2
	! gview -geometry 80x11 /tmp/valeNetrw-netrwHistory
	redraw
endfunction

function! NetrwFlushHistory()
	echo "1. Close all vim/gvim and netrw windows, the netrw current too;\n
			\2. Execute only by terminal:\n
			\rm  ~/.vim/.netrwhist"

endfunction

function! NetrwShowBookmarks()
	silent ! gview -geometry 70x20 /var/local/netrw/bookmarks/bookmarksList
	redraw
endfunction

function! NetrwEditBookmarks()
	silent ! gvim -geometry 70x20 /var/local/netrw/bookmarks/bookmarksListRaw
	redraw
	silent ! ~/.vim/vimfiles/Valentine/netrw/bookmarks/editBUpdateGvim.sh
        redraw
	echo "1. Close all vim/gvim and netrw windows, the netrw current too;\n
			\2. Execute only by terminal:\n
			\rm  ~/.vim/.netrwbook"

endfunction
	

" Mother Function: NetrwBookmarksHistory and its augroup {{{5

function! NetrwBookmarksHistory()
"
"" fh
" Mostra la cronologia
 nmap <buffer> fh :call NetrwShowHistory()<CR>
"
"" fsh
" Flushing della cronologia
 nmap <buffer> fsh :call NetrwFlushHistory()<CR>
"
"" flb
" Elenca i bookmarks
 nmap <buffer> flb :call NetrwShowBookmarks()<CR>
"
"" fb
" Modifica i bookmarks
 nmap <buffer> fb :call NetrwEditBookmarks()<CR>
"
"" fsb
" Flushing dei bookmarks
 nmap <buffer> fsb :call NetrwFlushBookmarks()<CR>
"
"" fu
" Definisci i bookmarks
 nmap <buffer> fu :call MainBookmarks#Bookmarks()<CR>
endfunction

augroup Vale-netrw_bookmarks_history
  autocmd!
  autocmd filetype netrw call NetrwBookmarksHistory()<CR>
augroup END


" Marking And Actions: {{{4

" Mapping: {{{5
"
" Tutte le funzioni aventi il << # >> nel loro nome sono "pesanti", quindi presenti in
" ~/.vim/plugin/Valentine/netrw/* 
" e sono caricate da ValentineRuntime.vim
" Di sotto invece nella fold << Here Called Functions >> sono presenti 
" quelle brevi per cui non vale la pena scrivere uno script.

" Here Called Functions: {{{6
function! NetrwMarkedSourcePrint()
silent ! gview -geometry 90x70 /tmp/valeNetrw-SMarked
endfunction

function! NetrwMarkedDestPrint()
silent ! gview -geometry 90x30 /tmp/valeNetrw-DMarked
endfunction

function! NetrwEditBySudo()
	! leggoFile="$(cat /tmp/valeNetrw-SMarked)" && sudo -S gvim -geometry 80x80 $leggoFile
endfunction

" Mother Function: NetrwMapping and its augroup {{{6
function! NetrwMapping()
"" bd
" Esecuzione di script/programmi per le directory selezionate in fd (fd*)
nmap <buffer> bd :call NetrwBd#Bd()<CR>
"
"" bm
" Esecuzione di script/programmi per i file selezionati in fm (fm*)
nmap <buffer> bm :call NetrwBm#Bm()<CR>
"
"" h 
" Scrivo su /tmp/valeNetrw-CMarked la directory madre in cui sono posizionato con il cursore,
" chiudo essa ma non esco da netrw. 
" con:
" [h] chiamo l'istanza;
" [:e .] mi posiziono sulla directory madre
" [<CR>] do l'invio
" [mf] marco la directory madre;
" [fpph] stampo il file /tmp/valeNetrw-CMarked e l'avvio sullo standard error.
" In questo modo stampo la dir precedentemente visitata
"nmap <buffer> h :e .<CR> mf fpph :call NetrwCurrentFolder#CurrentFolder()<CR>
"
" Stampo e marco la riga corrente
" Il mio banner consta di 9 righe, la decima è \.., la undicesima è la
" corrente \.. Quindi mi sposto di 11 righe con << 11G >>.
nmap <buffer> h 11G fgtw<CR> mf fpph :call NetrwCurrentFolder#CurrentFolder()<CR>
"" ff  
" Apri con privilegi sudo il file marcato con mf.
 nmap <buffer> ff :call NetrwEditBySudo()<CR>
 "
"" fn 
" Author of fn: https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
" << Will create a file. But like create it for real.
" This time, after doing % we use :w<CR> to save the empty file
" and :buffer #<CR> to go back to Netrw. >>
 nmap <buffer> fn %:w<CR>:buffer #<CR>
"
"" fm 
" Scrivo su /tmp/valeNetrw-SMarked i file/directory marcati con mf e sorgenti dell'azione, 
" i.e. i file da copiare o da tagliare o da rimuovere o da stampare.
" Attenzione: fm  assegnato dopo ogni mf (mf fm): Corretto
"             fm assegnato dopo più mf (mf mf fm): Sbagliato   
 nmap <buffer> fm fpps :call NetrwMarkedSource#MarkedSource()<CR>
"
"" _fm 
" Eseguo la selezione inversa che scrivo su /tmp/valeNetrw-SMarked
" Rimarco con fm i file che voglio escludere dalla selezione, nel suddetto file
" saranno presenti invece i file/directory non rimarcati con fm e sorgenti dell'azione, 
" i.e. i file da copiare o da tagliare o da rimuovere o da stampare.
 nmap <buffer> _fm h :call NetrwInverseMarkedSource#InverseMarkedSource()<CR>
"
"" fa 
" Seleziono tutto e scrivo su /tmp/valeNetrw-SMarked
 nmap <buffer> fa h :call NetrwSelectAllMarkedSource#SelectAllMarkedSource()<CR>
"
"" fsm
" Flushing dei file marcati come sorgente con fm
 nmap <buffer> fsm :call NetrwFlushMarkedSource#FlushMarkedSource()<CR>
"
"" fs#m
" Flushing di soli alcuni fm
 nmap <buffer> fs#m :call NetrwFlushSomeMarkedSource#FlushSomeMarkedSource()<CR>
"
"" flm
" Stampa in gview i file rimarcati con fm, questo perché la copia da gview è
" migliore rispetto a quella fatta dalla barra dei comandi.
 nmap <buffer> flm :call NetrwMarkedSourcePrint()<CR>
"
"" fd 
" Scrivo su /tmp/valeNetrw-DMarked la directory marcata con mf e destinazione dell'azione,
" i.e.  la cartella di destinazione della copia o del taglio.
" " Attenzione: fd  assegnato dopo ogni mf (mf fd): Corretto
"             fd assegnato dopo più mf (mf mf fd): Sbagliato   
 nmap <buffer> fd fppd :call NetrwMarkedDest#MarkedDest()<CR>
"
"" _fd 
" Eseguo la selezione inversa che scrivo su /tmp/valeNetrw-DMarked
" Rimarco con fd le directory che voglio escludere dalla selezione, nel suddetto file
" saranno presenti invece le directory non rimarcate con fd e detinazione dell'azione, 
" i.e. directories in cui copiare o in cui tagliare.
 nmap <buffer> _fd h :call NetrwInverseMarkedDest#InverseMarkedDest()<CR>
"
"" fsd
" Flushing della cartella rimarcata con fd.
 nmap <buffer> fsd :call NetrwFlushMarkedDest#MarkedDest()<CR>
"
"" fs#d
" Flushing di soli alcuni fd
 nmap <buffer> fs#d :call NetrwFlushSomeMarkedDest#FlushSomeMarkedDest()<CR>
"
"" fld 
" Stampa in gview la cartella rimarcata con fd,
" questo perché la copia da gview è migliore rispetto a quella fatta dalla barra dei comandi.
 nmap <buffer> fld :call NetrwMarkedDestPrint()<CR>
"
"" fc 
" Copia nella cartella rimarcata con fd, i file rimarcati con fm
 nmap <buffer> fc :call NetrwCopy#Copy()<CR>
"
"" fv
" Taglio nella cartella rimarcata con fd, i file rimarcati con fm.
" Invece per rinominare hai il comodo [R] builtin.
" Attenzione: Per usare [R] non devi marcare con mf il file, basta
" posizionarsi sopra il file con il cursore e pigiare [R], con mf non funziona.
 nmap <buffer> fv :call NetrwMv#Mv()<CR>
"
"" fR 
" Elimino i file rimarcati con fm.
 nmap <buffer> fR :call NetrwRm#Rm()<CR>
"
"" ft
"  (In fase di sviluppo)
" Strappo nella clipboard il contenuto di /tmp/valeNetrw-SMarked
 nmap <buffer> ft :call NetrwTear#Tear()<CR>
"
"" ot 
" Apri un terminale nella cartella marcata con fd
 nmap <buffer> ot h :call NetrwOpenTerm#OpenTerm()<CR> 
"
"" cc
" Ripristina i permessi in /tmp ed elimina la cartella splitNetrw*
 nmap <buffer> cc :call NetrwRecover1#Recover1()<CR>
" 
endfunction


augroup Vale-netrw_mappings
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END



