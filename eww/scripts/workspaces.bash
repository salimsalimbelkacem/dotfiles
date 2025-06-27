#!/bin/bash

WORKSPACES=$(hyprctl workspaces | grep -Po "(?<=ID )\\d+" | xargs)

echo '(box'
for i in $WORKSPACES; do 
	echo '(button :onclick "notify-send a" "'$i'")';
	# echo '"'$i'"';
done
echo ')'
