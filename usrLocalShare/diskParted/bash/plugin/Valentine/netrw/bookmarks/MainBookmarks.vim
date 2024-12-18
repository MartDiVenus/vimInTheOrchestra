" Vim global plugin about Bookmarks Upgrading.
" Title: Main Bookmarks
" Name: MainBookmarks.vim 
" Help: :he Vale-netrw_bookmarks_history
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


fun! MainBookmarks#Bookmarks()

silent ! rm -f ~/.vim/.netrwbook

silent ! rm -f /tmp/valeNetrw-uscitaEspressa

silent ! rm -f /tmp/valeNetrw-incremental

silent ! touch /tmp/valeNetrw-incremental

silent ! rm -f /tmp/valeNetrw-stockVar0

silent ! touch /tmp/valeNetrw-stockVar0

silent ! rm -f /tmp/valeNetrw-inputWritten

silent ! touch /tmp/valeNetrw-inputWritten

silent ! ~/.vim/vimfiles/Valentine/netrw/bookmarks/varWorking.sh

silent ! rm -f /var/local/netrw/bookmarks/bookmarksList

silent ! touch /var/local/netrw/bookmarks/bookmarksList

silent ! rm -f /var/local/netrw/bookmarks/bookmarksListRaw
silent ! touch /var/local/netrw/bookmarks/bookmarksListRaw


silent ! echo "01110001" > /tmp/valeNetrw-uscitaBin



echo "Type the path will be a bookmark or type << q  >> to stop inserting"


function! Input()
	let var2 = "."
	let var3 = " "
	let var4 = input("")
	call writefile(split(var4, "\n", 1), glob('/tmp/valeNetrw-inputWritten'), 'b')
        silent ! ~/.vim/vimfiles/Valentine/netrw/bookmarks/asciiBinPara.sh "$(cat /tmp/valeNetrw-inputWritten)" > /tmp/valeNetrw-inputWrittenBin
       	let var5 = "/tmp/valeNetrw-inputWrittenBin"
        let leggoVar5 = readfile(glob(var5))
	let var6 = "/tmp/valeNetrw-uscitaBin"
	let leggoVar6 = readfile(glob(var6))
	if leggoVar5 == leggoVar6
		silent ! echo "uscita" > /tmp/valeNetrw-uscitaEspressa
		redraw
	else
		let stock = "/tmp/valeNetrw-stockVar0"
		redir => var1
		let var0 = readfile(glob(stock))
		silent echo var0
		redir END
		call writefile([var1 . var2 . var3 . var4], "/var/local/netrw/bookmarks/bookmarksList", "a")
		call writefile([var4], "/var/local/netrw/bookmarks/bookmarksListRaw", "a")
        endif
endfunction


"" i.e. 10 iterazioni a partire da 1, il limite di netrw per i bookmarks mi
" pare essere 10, 12 per questione tecniche che risolvono sempre al limite di
" 10. 

let i = "1"

execute 'while i < 12 | 
			\ let uscitaEspressa = "/tmp/valeNetrw-uscitaEspressa" |
			\ if !filereadable(glob(uscitaEspressa)) |
			\ echo i |
                        \ call writefile([i], "/tmp/valeNetrw-stockVar0", "b") |
			\ call Input() |
			\ let i = i + 1 |
			\ if i == "11" | 
			\ echo "inserting end" |
			\ break |
			\ endif |
			\ else |
			\ break |
			\ endif |
			\ endwhile'

echo "Wait some seconds"

silent ! ~/.vim/vimfiles/Valentine/netrw/bookmarks/editBUpdateGvim.sh

echo "1. Chiudi tutte le finestre di vim/gvim e netrw, compresa questa di netrw;\n
			\2. Esegui esclusivamente dal terminale, né da netrw né da vim/givm:\n
			\rm -f ~/.vim/.netrwbook"
endfun

