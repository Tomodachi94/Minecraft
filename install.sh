#!/usr/bin/sh

echo "[install requirements]"
pip install -r requirements.txt >> /dev/null
echo "[register]"
python3 register.py
echo "[copy files]"
if test -d $MCPYPATH
then
	cp data/json/settings.json $MCPYPATH/settings.json
	if test ! -d $MCPYPATH/save
	then
		mkdir $MCPYPATH/save
	else
		echo "$0: $MCPYPATH/save existed"
	fi
	if test ! -d $MCPYPATH/screenshot
	then
		mkdir $MCPYPATH/screenshot
	else
		echo "$0: $MCPYPATH/screenshot existed"
	fi
	if test ! -d $MCPYPATH/texture/default
	then
		mkdir $MCPYPATH/texture/default -p
		cp data/texture/* $MCPYPATH/texture/default -r
	else
		rm $MCPYPATH/texture/default/* -r
		cp data/texture/* $MCPYPATH/texture/default -r
	fi
else
	echo "$0: MCPYPATH path not found"
fi
