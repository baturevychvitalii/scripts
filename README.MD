This repository contains set of scripts I use for interactions
with my ArchLinux.
Some scripts store cache, so go to Vglobals.sh, and set
PATH_TO_CACHE_FOLDER

Here is short description of them:

	AURupdate
		Goes into folder, where you git clone your AUR
		packages, does $ git pull, and if there were any updates
		does $ makepkg -sic;
		( for correct work AUR_GIT_FOLDER variable must
		be set in Vglobals.sh )

	Vap
		Creates access point
	
	Vbrightness
		Changes brightness by writing some values to a specific
		/sys/class/backlight file. Works on my Asus X555LB, might
		not work on yours.

	Vlesswire
		Prints available networks beautifully

	Vvnc
		Startx x11vnc server, use it alot with ssh while sitting
		on my bed

	Vvolume
		Alter volume with pactl
		Example:
			$ Vvolume +					# will make a volume a bit louder

	Vxinerama
		Manipulate 2 screen setup.
		Example:
			$ Vxinerama -l ext			# external monitor only
			$ Vxinerama -l left			# both monitors, external is on the left

	A
		Forwards arguments to interactive shell. I use it to call aliases from AwesomeWM's Run prompt (Win+R)

