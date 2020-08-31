#/bin/bash

cat .deps | sudo pacman -S --asdeps --needed -;
cp Vglobals_template Vglobals;

