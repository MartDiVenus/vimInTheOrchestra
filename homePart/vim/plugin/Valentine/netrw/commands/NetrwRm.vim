" Intro: Vim global plugin about files/dirs removing.
" Title: Netrw files/dirs removing 
" Name: NetrwRm.vim 
" Help: :he Vale-netrw_fR
" Last Change:	2021 Oct 15
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

function! NetrwRm#Rm()

silent ! rm -f /tmp/valeNetrw-inputWritten

silent ! touch /tmp/valeNetrw-inputWritten

silent ! rm -f /tmp/valeNetrw-deleting

silent ! touch /tmp/valeNetrw-deleting

silent ! gview -f -geometry 70x70 /tmp/valeNetrw-SMarked

  let interlinea = " "
  
  let avvisoStampaDest = "See, into the new gview window, the list of files/dirs to delete; \n Do you confirm the removing? y/n"
  
  echohl WarningMsg | echo avvisoStampaDest | echohl None
  
  echo interlinea
  
  function! Input()
  
        let var1 = input(":")

	call writefile([var1], "/tmp/valeNetrw-deleting", "a")

	unlet var1

  endfunction

  call Input()
	
	! ~/.vim/vimfiles/Valentine/netrw/commands/NetrwRmMart.sh
        redraw
endfunction

