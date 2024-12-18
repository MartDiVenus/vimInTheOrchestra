" Intro: Vim global plugin about files/dirs copy.
"        This is the main plugin about the task, there is the subplugin TypeCopyDests.vim too.
" Title: Netrw fm* Copy 
" Name: NetrwCopy.vim 
" Help: :he Vale-netrw_fc
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


function! NetrwCopy#Copy()
	let var1 = "/tmp/valeNetrw-DMarked"
 if !filereadable(var1)
	call TypeCopyDests#CopyDests()
 else
	 let var3 = "/tmp/valeNetrw-DMarked"
	 let var4 = readfile(glob(var3))
	 let interlinea = " "
  let avvisoStampaDest = "Path and name of the copying destination folder:"
  echohl WarningMsg | echo avvisoStampaDest | echohl None
  echo var4
  echo interlinea
unlet var1
unlet var3
unlet var4
endif


silent ! rm -f /tmp/valeNetrw-inputWritten

silent ! touch /tmp/valeNetrw-inputWritten

silent ! rm -f /tmp/valeNetrw-copying

silent ! touch /tmp/valeNetrw-copying

silent ! gview -geometry 70x70 /tmp/valeNetrw-SMarked

  let interlinea = " "
  
  let avvisoStampaDest = "See, into the new gview window, the list of files/dirs to copy; \n Do you confirm the copy? y/n"
  
  echohl WarningMsg | echo avvisoStampaDest | echohl None
  
  echo interlinea
  
  function! Input()
  
        let var5 = input(":")

	call writefile([var5], "/tmp/valeNetrw-copying", "a")

	unlet var5

  endfunction

  call Input()

  ! ~/.vim/vimfiles/Valentine/netrw/commands/NetrwCopyMart.sh
  
  redraw

endfunction
 
