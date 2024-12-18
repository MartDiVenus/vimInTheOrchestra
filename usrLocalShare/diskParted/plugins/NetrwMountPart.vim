" Intro: Vim global plugin about partition mounting.
" Title: Netrw partition mounting 
" Name: NetrwMountPart.vim 
" Help: :he Vale-netrw_m
" Last Change:	2023 May 01
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


function! NetrwMountPart#Mount()
	
silent ! rm -f /tmp/valeNetrw-mountingPoint

silent ! touch /tmp/valeNetrw-mountingPoint

  let interlinea = " "
  
  let avvisoStampaDest = "Type the mounting point, e.g. /mnt/dev1"
  
  echohl WarningMsg | echo avvisoStampaDest | echohl None
  
  echo interlinea
  
  function! Input()
  
        let var1 = input(":")

	call writefile([var1], "/tmp/valeNetrw-mountingPoint", "a")

	unlet var1

  endfunction

  call Input()

  ! ~/.vim/vimfiles/Valentine/netrw/commands/valeparted/NetrwMountPart.sh
  
  redraw

endfunction

