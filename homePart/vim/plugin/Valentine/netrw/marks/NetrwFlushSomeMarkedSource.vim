" Intro: Vim global plugin about some source files/dirs flushing list.
" Title: Netrw some source fm* (remarked files/dirs) flushing list.
" Name: NetrwFlushSomeMarkedSource.vim 
" Help: :he Vale-netrw_fs#m
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

fun! NetrwFlushSomeMarkedSource#FlushSomeMarkedSource()
	silent ! gvim /tmp/valeNetrw-SMarked
	redraw
endfun

