#!/bin/sh

echo "Please enter Night Light Temperature value."
echo "(min 1000 ~ MAX 10000)"
read TEMP
if [ "$TEMP" -ge 1000 ]
then
	if [ "$TEMP" -le 10000 ]
	then
		echo "You enter $TEMP. Are you sure? (y/N)"
		read YN
		case $YN in
			"y" | "Y" | "yes" | "Yes" | "YES" ) gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature $TEMP;;
			* ) echo "ERROR: Illegal Value";;
		esac
	else
		echo "ERROR: A value is higher than 10000."
	fi
else
	echo "ERROR: A value is lesser than 1000."
fi
