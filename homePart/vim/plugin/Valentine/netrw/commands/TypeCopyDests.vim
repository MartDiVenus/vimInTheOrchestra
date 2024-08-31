" Intro: Vim global plugin about copying files/dirs, manually inserting one or more
"        destination folders, if you have not type [fd].
"        This is the subplugin about the task, there is the main plugin NetrwCopy.vim too.
" Title: Netrw destination dirs not automatic inserting
" Name: TypeCopyDests.vim 
" Help: :he Vale-netrw_fc
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


fun! TypeCopyDests#CopyDests()

silent ! rm -f /tmp/valeNetrw-DMarked

silent ! touch /tmp/valeNetrw-DMarked

silent ! rm -f /tmp/valeNetrw-inputWritten

silent ! touch /tmp/valeNetrw-inputWritten

" from ascii to binary: q -> 01110001
silent ! echo "01110001" > /tmp/valeNetrw-uscitaBin

silent ! rm -f /tmp/valeNetrw-cimiceNetrwCopy

let var00 = " "

let var01 = "Type path and name of the copying destination folder/s or << q >> to stop inserting"

echo var00

echo var01

function! Input()
 	let var1 = input(":")
	call writefile(split(var1, "\n", 1), glob('/tmp/valeNetrw-inputWritten'), 'b')
        silent ! ~/.vim/vimfiles/Valentine/asciiBinPara.sh "$(cat /tmp/valeNetrw-inputWritten)" > /tmp/valeNetrw-inputWrittenBin
       	let var2 = "/tmp/valeNetrw-inputWrittenBin"
        let leggoVar2 = readfile(glob(var2))
	let var4 = "/tmp/valeNetrw-uscitaBin"
	let leggoVar4 = readfile(glob(var4))
	if leggoVar2 == leggoVar4
	         echo "Fine immissione delle cartelle di destinazione"
            silent ! sed '/^q/d' /tmp/valeNetrw-DMarked > /tmp/valeNetrw-DMarked2
	    silent ! sed '/^$/d' /tmp/valeNetrw-DMarked2 > /tmp/valeNetrw-DMarked3
	    silent ! cp /tmp/valeNetrw-DMarked3 /tmp/valeNetrw-DMarked
	    silent ! echo "cimice" > /tmp/valeNetrw-cimiceNetrwCopy
	else
            call writefile([var1], "/tmp/valeNetrw-DMarked", "a")
        endif
endfunction


let i = "1"

execute 'while i < 5 |
	\ call Input() |
	\ let i = i + 1 |
	\ let checkFile = "/tmp/valeNetrw-cimiceNetrwCopy" |
	\ if filereadable(checkFile) |
	\ break |
	\ endif |
	\ endwhile'
endfun

