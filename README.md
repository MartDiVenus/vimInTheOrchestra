# Abstract
Hexadecimal Vim Writing: hexadecimal syntax, colours, gvim and vim configuration.

  There are not Decimal/Hexadecimal Numbers, Ascii/Hexadecimal Digit Numbers
highlight groups because they are simply recognizable.


# Installing in the system
sed 's/hexmartColors/hexmart/g' hexmartColors.vim > hexmart.vim

mv hexmart.vim /usr/share/vim/vim82/colors/

sed 's/hexmartSyntax/hexmart/g' hexmartSyntax.vim > hexmart.vim

mv hexmart.vim /usr/share/vim/vim82/syntax/


# vim and gvim configuration
Make your /etc/vim/vimrc.local and /etc/vim/gvimrc.local like mine.

  If you don't use them:

~$ mv gvimrc.local ~/.gvimrc

~$ mv vimrc.local  ~/.vimrc

 
# Colours test
:e /usr/share/vim/vim82/colors/hexmart.vim | :so /usr/share/vim/vim82/colors/tools/check_colors.vim

The missing colour references are not a problem for me.

