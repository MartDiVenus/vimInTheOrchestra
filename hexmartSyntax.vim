" Vim syntax file
" Title: Hexadecimal writing syntax
" Version: 1.0.0 
" Author: Mario Fantini <marfant7@gmail.com>
" Date: 2021/10/15
" Name: hexmart.vim 
" Vim version: 2:8.2.2434-3 (82)
" OS: Debian 11



if exists("b:current_syntax")
  finish
endif

hi def link hexmartComment		comment
hi def link hexmartFormatPrimary	formatPrimary
hi def link hexmartFormatSecondary	formatSecondary
hi def link hexmartCapital		capital
hi def link hexmartSymbolsPunctuation	symbolsPunctuation
hi def link hexmartSymbolsScience	symbolsScience
hi def link hexmartSymbolsQuotes	symbolsQuotes
hi def link hexmartSymbolsList		symbolsList
hi def link hexmartSymbolsSpecial	symbolsSpecial
hi def link hexmartGreekLower	 	greekLower
hi def link hexmartGreekCapital		greekCapital



""" Comment (ascii text)
syn region hexmartComment start="%" end="^" contains=comment



""" Formatting

"" Primary
" Horizontal Tab
syn match hexmartFormatPrimary "09"
" Space
syn match hexmartFormatPrimary "20"
" Line Feed
syn match hexmartFormatPrimary "0a"
" Vertical Tab
syn match hexmartFormatPrimary "0b"

"" Secondary
" Back Space
syn match hexmartFormatSecondary "08"
" Form Feed
syn match hexmartFormatSecondary "0c"
" Carriage Return
syn match hexmartFormatSecondary "0d"



""" Symbols

"" Punctuation
" ! Exclamation point
syn match hexmartSymbolsPunctuation "21"
" ? Question mark
syn match hexmartSymbolsPunctuation "3f"
" , Comma
syn match hexmartSymbolsPunctuation "2c"
" . Period
syn match hexmartSymbolsPunctuation "2e"
" ; Semicolon
syn match hexmartSymbolsPunctuation "3b"
" : Colon
syn match hexmartSymbolsPunctuation "3a"


"" Science
" * asterisk
syn match hexmartSymbolsScience "2a"
" + plus sign
syn match hexmartSymbolsScience "2b"
" - minus sign/hyphen
syn match hexmartSymbolsScience "2d"
" / Forward Slash
syn match hexmartSymbolsScience "2f"
" ÷ Division
syn match hexmartSymbolsScience "\<c2\ b7\>"
" ^ Caret
syn match hexmartSymbolsScience "5e"
" ° Degree
syn match hexmartSymbolsScience "\<c2\ b0\>"
" ± Plus or Minus
syn match hexmartSymbolsScience "\<c2\ b1\>"
"  Equals sign
syn match hexmartSymbolsScience "3d"
" ∀ For All
syn match hexmartSymbolsScience "\<e2\ 88\ 80\>"
" ∂ Partial Differential
syn match hexmartSymbolsScience "\<e2\ 88\ 82\>"
" ∃ Exists
syn match hexmartSymbolsScience "\<e2\ 88\ 83\>"
" ∈ Be Part Of
syn match hexmartSymbolsScience "\<e2\ 88\ 88\>"
" ≈ Approximate
syn match hexmartSymbolsScience "\<e2\ 89\ 88\>"
" ∞ Infinity
syn match hexmartSymbolsScience "\<e2\ 88\ 9e\>"
" ∠ Angle
syn match hexmartSymbolsScience "\<e2\ 88\ a0\>"
" ( Left parenthesis
syn match hexmartSymbolsScience "28"
" ) Right parenthesis
syn match hexmartSymbolsScience "29"
" [ Left bracket
syn match hexmartSymbolsScience "5b"
" ] Right bracket
syn match hexmartSymbolsScience "5d"
" { Left brace
syn match hexmartSymbolsScience "7b"
" } Right brace
syn match hexmartSymbolsScience "7d"
" < Less-Than Sign
syn match hexmartSymbolsScience "3c"
" > Greater-Than Sign
syn match hexmartSymbolsScience "3e"
" ≤ Less-Than Equals Sign
syn match hexmartSymbolsScience "\<e2 89\ a4\>"
" ≥ Grater-Than Equals Sign
syn match hexmartSymbolsScience "\<e2 89\ a5\>"


"" Quotes
" " Double Quote
syn match hexmartSymbolsQuotes "22"
" ' Apostrophe, Single Quote 
syn match hexmartSymbolsQuotes "27"
" ` Back Quote 
syn match hexmartSymbolsQuotes "60"
" « Left Quotes Direct Speech
syn match hexmartSymbolsQuotes "\<c2 ab\>"
" » Right Quotes Direct Speech
syn match hexmartSymbolsQuotes "\<c2 bb\>"


"" Special "Escapable" Characters
" Pound/Number Sign #
syn match hexmartSymbolsSpecial "23"
" Dollar Sign $
syn match hexmartSymbolsSpecial "24"
" Percent Sign %
syn match hexmartSymbolsSpecial "25"
" Ampersand &
syn match hexmartSymbolsSpecial "26"
" At Sign @
syn match hexmartSymbolsSpecial "40"
" Backward Slash \
syn match hexmartSymbolsSpecial "5c"
" Underscore _
syn match hexmartSymbolsSpecial "5f"
" Vertical Bar |
syn match hexmartSymbolsSpecial "7c"
" Tilde ~
syn match hexmartSymbolsSpecial "7e"
" Euro €
syn match hexmartSymbolsSpecial "\<e2\ 82\ ac\>"
" Barbanera flag ☠
syn match hexmartSymbolsSpecial "\<e2\ 98\ a0\>"
" Left arrow ←
syn match hexmartSymbolsSpecial "\<e2\ 86\ 90\>"
" Right arrow →
syn match hexmartSymbolsSpecial "\<e2\ 86\ 92\>"
" Down arrow ↓
syn match hexmartSymbolsSpecial "\<e2\ 86\ 93\>"
" Copyright ©
syn match hexmartSymbolsSpecial "\<c2\ a9\>"
" Heart ♥
syn match hexmartSymbolsSpecial "\<e2\ 99\ a5\>"
" Star ★
syn match hexmartSymbolsSpecial "\<e2\ 98\ 85\>"
" Christ ✝
syn match hexmartSymbolsSpecial "\<e2\ 9c\ 9d\>"


"" List
" Section §
syn match hexmartSymbolsList "\<c2\ a7\>"
" Paragraph ¶
syn match hexmartSymbolsList "\<c2\ b6\>"
" bullet •
syn match hexmartSymbolsList "\<e2\ 80\ a2\>"
" Circle ◦
syn match hexmartSymbolsList "\<e2\ 97\ a6\>"
" Black Square ■
syn match hexmartSymbolsList "\<e2\ 96\ a6\>"
" Dag †
syn match hexmartSymbolsList "\<e2\ 80\ a0\>"



""" Capital Letters
syn match hexmartCapital "41"
syn match hexmartCapital "\<41\ 60\>"
syn match hexmartCapital "42"
syn match hexmartCapital "43"
syn match hexmartCapital "44"
syn match hexmartCapital "45"
syn match hexmartCapital "\<45\ 60\>"
syn match hexmartCapital "\<c3\ 89\>"
syn match hexmartCapital "46"
syn match hexmartCapital "47"
syn match hexmartCapital "48"
syn match hexmartCapital "49"
syn match hexmartCapital "\<49\ 60\>"
syn match hexmartCapital "4a"
syn match hexmartCapital "4b"
syn match hexmartCapital "4c"
syn match hexmartCapital "4d"
syn match hexmartCapital "4e"
syn match hexmartCapital "\<4f\ 60\>"
syn match hexmartCapital "\<4f\ 60\>"
syn match hexmartCapital "50"
syn match hexmartCapital "51"
syn match hexmartCapital "52"
syn match hexmartCapital "53"
syn match hexmartCapital "54"
syn match hexmartCapital "55"
syn match hexmartCapital "\<55\ 60\>"
syn match hexmartCapital "56"
syn match hexmartCapital "57"
syn match hexmartCapital "58"
syn match hexmartCapital "5a"



""" Greek Alphabet

"" Greek Lower-case Letters
" α alpha ce b1
syn match hexmartGreekLower "\<ce\ b1\>"
" β beta ce b2
syn match hexmartGreekLower "\<ce\ b2\>"
" γ gamma ce b3
syn match hexmartGreekLower "\<ce\ b3\>"
" δ delta ce b4
syn match hexmartGreekLower "\<ce\ b4\>"
" ε epsilon  ce b5
syn match hexmartGreekLower "\<ce\ b5\>"
" ζ zeta ce b6
syn match hexmartGreekLower "\<ce\ b6\>"
" η eta ce b7
syn match hexmartGreekLower "\<ce\ b7\>"
" θ theta ce b8
syn match hexmartGreekLower "\<ce\ b8\>"
" ι iota ce b9
syn match hexmartGreekLower "\<ce\ b9\>"
" κ kappa ce ba
syn match hexmartGreekLower "\<ce\ ba\>"
" λ lambda ce bb
syn match hexmartGreekLower "\<ce\ bb\>"
" μ mu ce bc
syn match hexmartGreekLower "\<ce\ bc\>"
" ν nu ce bd
syn match hexmartGreekLower "\<ce\ bd\>"
" ξ xi  ce be
syn match hexmartGreekLower "\<ce\ be\>"
" o o 6f
syn match hexmartGreekLower "6f"
" π pi cf 80
syn match hexmartGreekLower "\<cf\ 80\>"
" ρ rho cf 81
syn match hexmartGreekLower "\<ce\ 81\>"
" ς varsigma cf 82
syn match hexmartGreekLower "\<cf\ 82\>"
" σ sigma cf 83
syn match hexmartGreekLower "\<cf\ 83\>"
" τ tau cf 84
syn match hexmartGreekLower "\<cf\ 84\>"
" υ upsilon cf 85
syn match hexmartGreekLower "\<cf\ 85\>"
" φ phi cf 86
syn match hexmartGreekLower "\<cf\ 86\>"
" χ chi cf 87
syn match hexmartGreekLower "\<cf\ 87\>"
" ψ psi cf 88
syn match hexmartGreekLower "\<cf\ 88\>"
" ω omega cf 89
syn match hexmartGreekLower "\<cf\ 89\>"

"" Greek Capital Letters
" A Alpha ce 91
syn match hexmartGreekCapital "\<ce\ 91\>"
" B Beta ce 92
syn match hexmartGreekCapital "\<ce\ 92\>"
" Γ Gamma ce 93
syn match hexmartGreekCapital "\<ce\ 93\>"
" ∆ Delta ce 94
syn match hexmartGreekCapital "\<ce\ 94\>"
" E  Epsilon ce 95
syn match hexmartGreekCapital "\<ce\ 95\>"
" Z Zeta ce 96
syn match hexmartGreekCapital "\<ce\ 96\>"
" Η Eta ce 97
syn match hexmartGreekCapital "\<ce\ 97\>"
" Θ Theta ce 98
syn match hexmartGreekCapital "\<ce\ 98\>"
" Ι Iota ce 99
syn match hexmartGreekCapital "\<ce\ 99\>"
" Κ Kappa ce 9a
syn match hexmartGreekCapital "\<ce\ 9a\>"
" Λ Lambda ce 9b
syn match hexmartGreekCapital "\<ce\ 9b\>"
" Μ Mu ce 9c
syn match hexmartGreekCapital "\<ce\ 9c\>"
" Ν Nu ce 9d
syn match hexmartGreekCapital "\<ce\ 9d\>"
" Ξ Xi ce 9e
syn match hexmartGreekCapital "\<ce\ 9e\>"
" Π Pi ce a0
syn match hexmartGreekCapital "\<ce\ a0\>"
" Ρ Ro ce a1
syn match hexmartGreekCapital "\<ce\ a1\>"
" Σ Sigma ce a3
syn match hexmartGreekCapital "\<ce\ a3\>"
" Τ Tau ce a4
syn match hexmartGreekCapital "\<ce\ a4\>"
" Υ Upsilon ce a5
syn match hexmartGreekCapital "\<ce\ a5\>"
" Φ Phi ce a6
syn match hexmartGreekCapital "\<ce\ a6\>"
" Χ Chi ce a7
syn match hexmartGreekCapital "\<ce\ a7\>"
" Ψ Psi ce a8
syn match hexmartGreekCapital "\<ce\ a8\>"
" Ω Omega ce a9
syn match hexmartGreekCapital "\<ce\ a9\>"



let b:current_syntax = "hexmart"

"vim: sw8
