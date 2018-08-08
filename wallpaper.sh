#!/bin/bash

cd ~/Downloads/daily-wallpaper-script
rm *.jpg *.txt index.html
wget http://www.backgroundimageshd.com/gallery/full-hd-1080p-nature-wallpapers/
grep 'img class="wp' index.html > tmp1.txt
awk -F "\"" '{print $18}' tmp1.txt > tmp2.txt
rm tmp1.txt
N=$(wc -l tmp2.txt)
N=$(echo $N | awk '{print $1}' )
rand=$(shuf -i 1-$N -n 1)
echo $rand > rand.txt
a=$(awk "FNR==$rand" tmp2.txt )
wget $a
imname=$(ls | grep *.jpg)
/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imname


