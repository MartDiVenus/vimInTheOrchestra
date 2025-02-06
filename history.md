# History

	v1.0.0: Oct 15, 2021	* First version.


_______________

	v2.0.0 Feb 27, 2022

				* New feature #1
Added netrw based disk manager ValeDisks, see Vale-netrw help.

				* Improvement #1
Changed   Recover  (Windows  owners)  mapping  from  [re]  to  [cc]; improved 
NetrwRecover1.sh .

				* Mistake #1
I missed some important files of /etc/vim .


_______________

	v2.1.0 Mar 2, 2022

				* Improvement #1
Improved Vale-disks help.

				* Improvement #2
Improved ValeDisks stdout last message.
		
				* Action #1
Valentine.vim v.1 history flushing.


_______________
		

	v2.2.0 Mar 4, 2022

				* Improvement #1
Improved and corrected [bd], [bm].

				* Improvement #2
Permissive mounting for ext3, ext4, ntfs, vfat, xfs file systems.

				* Improvement #3
Added Vale-valedisks
				
				* Improvement #4
Short valedisks' help shifted from stdout to Vale-valedisks' help

 				* Mistake #1
Corrected <<~$ hdparm>> to <<~$ sudo hdparm>>


	v2.3.0 Jul 18, 2022
				* New feature #1
Added [ba]: Turn off all disks softly.


_______________
		

	v2.4.0 27 9, 2022
				* Mistake #1
Corrected the absence of filemanager syntax.

				* Improvement #1
Valedisks prints <</dev/sda>>, the new Microsoft Windows disk.


_______________


	v2.5.0 27 10, 2022
				* Improvement #1
Improved Vale-netrw_h help.

				* Improvement #2
Improved Vale-valedisks help.



_______________


	v2.6.0 12 04, 2023
				* Improvement #1
Improved/corrected NetrwFileHandlers.


				* Improvement #2
Improved Vale-netrw_mo help.



_______________


	v2.7.0 30 04, 2023
				* Improvement #1
valedisks: improved mounting point input.



_______________


	v2.7.1 01 05, 2023
				* Mistake #1
valedisks: corrected partitions mounting.



_______________


	v3.0.0  Jul 08, 2023	* Third version.

				* New feature #1
Added     netrw/fdisk based    disk     partition   table   manipulation,  see 
Vale-valeparted  help.

				* Improvements #1, #2, #3, #4
Improved copy, move/cut, remove/delete input.
	Deleted  superfluous fragments of codex,  due  to lack  of attention,
in input scripts.

				* Improvement #5
Lent more order to "commands filesystem" in ~/.vim.

				* Mistake #1
Corrected an ortographic mistake in
usrLocalShare/diskManager/plugin/Valentine.vim.disk

				* Mistake #2
Corrected "mu unmark all" in
usrLocalShare/fileManager/autoload/netrw.vim.file

				* Mistake #3 
Corrected, and expunged the original "mu map" in
usrLocalShare/diskManager/autoload/netrw.vim.disk

				* Mistake #4
Corrected
usrLocalShare/fileManager/plugin/Valentine.vim.file
homePart/plugin/Valentine.vim.file

there were mapping for valedisks.

				* Mistake #5
valedisks: corrected Vale-netrw_bo, now it turns off not mounted partitions too.

				* Mistake #6
Corrected the filesystem type print when partition is mounted.



_______________


	v3.1.0  Aug 22, 2023

				* Improvement #1
Improved ValeParted.

				* Improvemente #2
Improved  valeparted help [:he Vale-valeparted].

				* Improvemente #3
ValeDisks: added some clarification to the stdout.

_______________

	v3.2.0  Sep 10, 2023

				* Mistake #1
Again, for distraction reasons, I missed some syntax files.

				* Improvement #1
Added vim-plug plugin, a useful light plugin handler.
	You  have to  read  vim-plug  doc,  some  plugins  need  your  manual 
operation [e.g. see my tagbar directive in Valentine.vim].

				* Improvement #2
Added tagbar plugin, and its dependency universal-ctags.

_______________

	v3.3.0  Sep 13, 2023

				* Improvement #1
Valentine help: added <External plugin> section.

_______________
	
	v3.4.0  Oct 05, 2023

				* Improvement #1
Files copy and cut improved.

				* Improvement #2
! my netrwFileHandlers.vim is xfce4 oriented.

netrwFileHandlers.vim improved

jpeg, JPEG, JPG, md, xml, webp added.

				* Improvement #3
Paragraph settings improved.

				* Improvement #4
reconfigure.sh added.

Now,  to  install  Valentine package,  you  don't need  to  install  vimplug,
ctags, tagbar again; you have to execute reconfigure.sh only.

! vimplug, ctags, tagbar are not my products obviously.


_______________
	
	v3.5.0  Feb 04, 2024

				* Correction #1
Valedisks, Umount parts: Restored original netrw [mu]. 
Corrected in Valentine.vim the title of past Valedisks [mu], and [mu] changed
with [mn].

				* Correction #2
ValeNetrw: Bookmarks editing corrected.

				* Improvement #1
ValeNetrw: Given priority to chromium as regard as XML files rendering.

				* Improvement #2
Valedisks: Stdout and stderr, improved.


_______________
	
	v4.0.0  Aug 31, 2024

Various improvements and corrections; new features in ValeParted.


_______________
	
	v4.0.1  Nov 04, 2024

usrLocalShare/diskParted/bash/valeparted.sh has been corrected.


_______________
	
	v4.0.2  Feb 01, 2025
usrLocalShare corrected, adding \
usrLocalShare/trattamentoFiles.sh \
usrLocalShare/trattamentoCartelle.sh

usrLocalShare/diskParted/bash/valeparted.sh has been corrected.

usrLocalShare/diskParted/bash/Dir/* have been corrected.


_______________
	
	v4.1.0  Feb 06, 2025

usrLocalShare/diskParted/bash/valeparted.sh help section has been corrected.

homePart/vim/vimfiles/Valentine/netrw/bash/properm ininfluent mistake has been corrected.

homePart/vim/doc/Valentine.txt bookmarks section has been improved.


	
