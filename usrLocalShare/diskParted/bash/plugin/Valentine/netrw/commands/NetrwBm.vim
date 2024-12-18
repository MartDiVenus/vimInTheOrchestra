" Intro: Vim global plugin about script/program executing for fm*
" Title: Netrw script/program executing for fm*
" Name: NetrwBm.vim 
" Help: :he Vale-netrw_bm
" Last Change:	2022 Mar 04
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

fun! NetrwBm#Bm()

silent ! rm -f /tmp/valeNetrw-Bm

silent ! touch /tmp/valeNetrw-Bm

let interlinea = " "

echo interlinea

let var1 = "Type path and name of the script/program to execute for fm*"

echohl WarningMsg | echo var1 | echohl None

let var2 = input(":")

call writefile(split(var2, "\n", 1), glob('/tmp/valeNetrw-Bm'), 'b')

silent ! leggoFile="$(cat /tmp/valeNetrw-Bm)" && $leggoFile

echo interlinea

let var4 = "Read /tmp/valeNetrw-BmOutput at the end of the script/program"

echo var4

endfun

