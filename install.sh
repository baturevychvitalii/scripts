#/bin/bash

cat .deps | sudo pacman -S --asdeps --needed -;

if [ -e Vglobals ]; then
	mv Vglobals Vglobals.old;
fi

cp Vglobals_template Vglobals;

