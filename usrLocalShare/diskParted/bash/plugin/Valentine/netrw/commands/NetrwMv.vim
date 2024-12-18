" Intro: Vim global plugin about files/dirs cut.
" Title: Netrw fm* cutting 
" Name: NetrwMv.vim 
" Help: :he Vale-netrw_fv
" Last Change:	2021 Oct 15
" Author: Mario Fantini "MartDiVenus" <ing.mariofantini@gmail.com> 
"         https://github.com/MartDiVenus/
" Copyright: Mario Fantini's copyright: Creative Commons by-nc-sa-eu.
"            Bram Moolenaar's  copyright  applies  to all  Mario Fantini's  vim
"            files, see << :he copyright >>.
"            Charles E. Campbell's copyright applies  to  all  Mario  Fantini's
"            netrw codex "brushstrokes"  and  netrw  colours  brushstrokes, see
"            Copyright (C) 2016 - Charles E. Campbell -. 
"            /usr/share/vim/vim*/autoload/netrw.vim
"            :he pi_netrw 

function! NetrwMv#Mv()
	let var1 = "/tmp/valeNetrw-DMarked"
 if !filereadable(var1)
 let var2 = input("\n Type path and name of the cutting destination folder: \n")
 silent ! touch /tmp/valeNetrw-DMarked
 call writefile(split(var2, "\n", 1), glob('/tmp/valeNetrw-DMarked'), 'b')
 unlet var2
 else
	 let var3 = "/tmp/valeNetrw-DMarked"
	 let var4 = readfile(glob(var3))
  let avvisoStampaDest = "\n Path and name of the cutting destination folder:"
  echohl WarningMsg | echo avvisoStampaDest | echohl None
  echo var4
unlet var1
unlet var3
unlet var4
endif


silent ! rm -f /tmp/valeNetrw-inputWritten

silent ! touch /tmp/valeNetrw-inputWritten

silent ! rm -f /tmp/valeNetrw-moving

silent ! touch /tmp/valeNetrw-moving

silent ! gview -geometry 70x70 /tmp/valeNetrw-SMarked

  let interlinea = " "
  
  let avvisoStampaDest = "See, into the new gview window, the list of files/dirs to move; \n Do you confirm the cut? y/n"
  
  echohl WarningMsg | echo avvisoStampaDest | echohl None
  
  echo interlinea
  
  function! Input()
  
        let var5 = input(":")

	call writefile([var5], "/tmp/valeNetrw-moving", "a")

	unlet var5

  endfunction

  call Input()

  ! ~/.vim/vimfiles/Valentine/netrw/commands/NetrwMvMart.sh
  
  redraw

endfunction
 


