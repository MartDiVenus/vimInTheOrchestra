# History

		v1.0.0: Oct 15, 2021	* First version.
________________

		v1.0.1: Nov 06, 2021    * Mistake #1. 
	autoload/netrw.vim and syntax/netrw.vim 
	were the same file.
________________

		v1.0.2: Nov 10, 2021	* Mistake #2.
	/usr/share/vim/vim82/colors/mart.vim 
	wrong colour name,  << mart >>  not  << martLux >>.
________________

		v1.0.3 Nov 10, 2021	*Mistake #3.
	~/.vim/plugins/Valentine/netrw/commands/inverseMarkedSource.sh 
	~/.vim/plugins/Valentine/netrw/commands/inverseMarkedDest.sh 
	cut in 
	~/.vim/vimfiles/Valentine/netrw/commands/ 
	~/.vim/vimfiles/Valentine/netrw/commands/ 
	and, in them, I've added << sort >>  before  << comm >>, they need it in some 
	cases.
________________

		v1.1.1: Nov 11, 2021	* Mistake #1
	<< QuickHelp2: (actions5) ot:open term here >> not << ... term in !fd >> 
	(see Vale-netrw_ot). 
					* Improvement #1
	*.eps, *.jpg, *.htm, *.html, *.pdf, *.png, *.ps, *.svg  handling set.

_______________

	v1.2.0 Nov 27, 2021     * Mistake #1
Now you can use dest folders inverse selection like generic folders inverse selection too.

				* Mistake #2
<< Vale-netrw__fd >> not << Vale-netrw__fn >>

				* Mistake #3
_fm, _fm: you don't need to type [h]

				* improvement #1
all files/dirs selection added

				* improvement #2
Quick Help1, Quick Help2 improved.

_______________

	v1.3.0 Feb 11, 2022

				* "mistake" #1
<<5.2 VALENTINE IN NETRW/
	Some Notes About Official Netrw/
		[Shift-mouse left button]>>

				* improvement #1
[ot] help section improved

				* improvement #2
<<Warnings>>          *Vale-netrw_warnings*
added.


				* improvement #3
<<5.2 VALENTINE IN NETRW/
	Some Notes About Official Netrw/
		[mf]:>> added.

				* improvement #4
Warning Msg highlight group added in:
	.vim/plugin/Valentine/netrw/commands/NetrwMv.vim
	.vim/plugin/Valentine/netrw/commands/NetrwCopy.vim
I've corrected the message too.

				* improvement #5
<<3.1 MAIN SETTINGS>>	*Vale-main_settings*

<<How to copy, to paste from gvim to mlterm, and from a window of gvim to
another its window>> added.


				* improvement #6
<WINDOWS OWNERS>>      *Vale-netrw_windows_owners*
added.
			

_______________

	v1.4.0 Feb 18, 2022

				* Improvement #1
Temporary files and dirs:
Now all Vale-netrw split folders are located  only  in /tmp dir  and they have 
the prefix <<valeNetrw->>.
Now all temporary Vale-netrw files have the prefix <<valeNetrw->>.


				* Improvement #2
Now there will  be  ~/.vim, /etc/vim, ~/.vimrc removals,  installation  needs 
them.


				* improvement #3
<<5.2 VALENTINE IN NETRW/
	Some Notes About Official Netrw/
		[mf]:>>.


				* mistake #1
bookmarks:
/home/mart/.vim/vimfiles/Valentine/netrw/bookmarks/varWorking.sh
Now you don't have to create  /var/local/netrw/bookmarks folder, the  creation
will be happen automatically.
	
