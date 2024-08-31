" Intro: Vim script about source file/dirs flushing.
" Title: Source files/dirs flushing
" Name: NetrwFlushMarkedSource.vim 
" Help: :he Vale-netrw_fsm
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

function! NetrwFlushMarkedSource#FlushMarkedSource()
	silent ! rm -f /tmp/valeNetrw-SMarked
endfunction

