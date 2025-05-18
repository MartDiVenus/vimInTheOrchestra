" Intro: Vim script about current folder printing and remarking.
" Title: Current folder files/dirs selection.
" Name: NetrwMarkedCurrentFolder.vim 
" Help: :he Vale-netrw_h
" Last Change: 2021 Oct 15
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

function! NetrwCurrentFolder#CurrentFolder()
	echo "remarking and printing the current folder"
        let currentFolder = readfile(glob('/tmp/valeNetrw-CMarked'))
	echo currentFolder
endfunction
