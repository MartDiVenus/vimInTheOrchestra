" Intro: Vim global plugin about script/program executing for fd*
" Title: Netrw script/program executing for fd*
" Name: NetrwBd.vim 
" Help: :he Vale-netrw_bd
" Last Change:	2022 Mar 04
" Author: Mario Fantini "MartDiVenus" <marfant7@gmail.com> 
"         https://github.com/MartDiVenus/
" Copyright: Mario Fantini's copyright: Creative Commons by-nc-sa-eu.
"            Bram Moolenaar's  copyright  applies  to all  Mario Fantini's  vim
"            files, see << :he copyright >>.
"            Charles E. Campbell's copyright applies  to  all  Mario  Fantini's
"            netrw codex "brushstrokes"  and  netrw  colours  brushstrokes, see
"            Copyright (C) 2016 - Charles E. Campbell -. 
"            /usr/share/vim/vim*/autoload/netrw.vim
"            :he pi_netrw 

fun! NetrwBd#Bd()

silent ! rm -f /tmp/valeNetrw-inputWritten

silent ! touch /tmp/valeNetrw-inputWritten

silent ! rm -f /tmp/bdValeNetrw-choise

silent ! touch /tmp/bdValeNetrw-choise

silent ! gview -geometry 70x70 /tmp/valeNetrw-SMarked

let interlinea = " "

let avviso = "Digita il numero associato alla tua scelta \n 1. paranoid \n 2. non paronoid"

echohl WarningMsg | echo avviso | echohl None

function! Input()
  
        let var1 = input(":")

	call writefile(split(var1, "\n", 1), glob('/tmp/valeNetrw-inputWritten'), 'b')

	silent ! ~/.vim/vimfiles/Valentine/netrw/bookmarks/asciiBinPara.sh "$(cat /tmp/valeNetrw-inputWritten)" > /tmp/valeNetrw-inputWrittenBin

	let var2 = "/tmp/valeNetrw-inputWrittenBin"

	let leggoVar2 = readfile(glob(var2))

	call writefile([var1], "/tmp/bdValeNetrw-choise", "a")

	unlet var1

	unlet var2

  endfunction

  call Input()
	
	! ~/.vim/vimfiles/Valentine/netrw/commands/NetrwBd.sh
   
   	redraw

endfun

