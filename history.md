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



