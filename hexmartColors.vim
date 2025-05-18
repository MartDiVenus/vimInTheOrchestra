" Vim colours
" Title: Hexadecimal writing colours
" Version: 1.0.0 
" Author: Mario Fantini <marfant7@gmail.com>
" Date: 2021/10/15
" Name: hexmart.vim 
" Vim version: 2:8.2.2434-3 (82)
" OS: Debian 11


set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="hexmart"



""" Chromatic Legend

"" gui
" Aquamarine	#7FFFD4

"" terminal
" 1	brown
" 3	bright brown
" 7	gray
 


hi Normal			guifg=white     guibg=grey20		ctermbg=black	ctermfg=white

"" Highlight syntax groups
hi NonText					guifg=magenta					ctermfg=lightMagenta
hi label					guifg=yellow					ctermfg=yellow
hi operator	gui=bold			guifg=orange		ctermbg=darkGreen	ctermfg=lightRed	
hi ErrorMs			guibg=white	guifg=red					ctermfg=lightRed
hi WarningMsg	gui=bold	guibg=darkGreen	guifg=orange					ctermfg=cyan	
hi ModeMsg	gui=NONE			guifg=yellow					ctermfg=yellow
hi MoreMsg	gui=NONE			guifg=yellow					ctermfg=yellow
hi Cursor			guibg=white	guifg=black		ctermbg=white		ctermfg=black
hi Search			guibg=peru	guifg=wheat		ctermbg=darkYellow	ctermfg=black	
hi IncSearch			guibg=yellow	guifg=black		ctermbg=darkYellow	ctermfg=black	
hi LineNr					guifg=cyan
hi title	gui=bold			guifg=white	cterm=bold			ctermfg=cyan
hi StatusLineNC	gui=NONE	guibg=blue	guifg=black		ctermbg=blue		ctermfg=black		
hi StatusLine	gui=bold	guibg=blue	guifg=cyan		ctermbg=blue		ctermfg=cyan
hi VertSplit	gui=none	guibg=blue	guifg=blue		ctermbg=blue		ctermfg=blue
hi Visual	term=reverse	guibg=darkCyan	guifg=black		ctermbg=darkCyan	ctermfg=black 		 		
hi DiffChange			guibg=darkGreen	guifg=black		ctermbg=darkGreen	ctermfg=black
hi DiffText			guibg=olivedrab	guifg=black		ctermbg=lightGreen	ctermfg=black
hi DiffAdd			guibg=slateblue	guifg=black		ctermbg=blue		ctermfg=black
hi DiffDelete			guibg=coral	guifg=black		ctermbg=lightRed	ctermfg=black
hi Folded			guibg=SeaGreen	guifg=black		ctermbg=yellow		ctermfg=black
hi FoldColumn			guibg=gray50	guifg=tan		ctermbg=gray		ctermfg=black

" Highlight comment (ascii text)
hi comment					guifg=pink					ctermfg=lightMagenta

" Highlight hexdecimal syntax group
hi formatPrimary		guibg=grey30	guifg=gold					ctermfg=darkYellow
hi formatSecondary		guibg=grey30	guifg=lightBlue 				ctermfg=lightBlue
hi capital			 		guifg=lightRed					ctermfg=lightRed
hi symbolsPunctuation				guifg=lightMagenta  				ctermfg=lightMagenta
hi symbolsScience				guifg=#7FFFD4					ctermfg=lightBlue
hi symbolsQuotes				guifg=lightGreen				ctermfg=lightGreen
hi symbolsList			guibg=grey50	guifg=white					ctermfg=7
hi symbolsSpecial				guifg=lightCyan					ctermfg=lightCyan
hi sreekLower					guifg=khaki	 				ctermfg=3
hi sreekCapital					guifg=brown					ctermfg=1

"vim: sw=8
