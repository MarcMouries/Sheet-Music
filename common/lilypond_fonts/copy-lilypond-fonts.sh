#!/bin/bash

FIRST_ARGUMENT="$1"
echo "Hello, world $FIRST_ARGUMENT!"

LILYPOND_PATH="/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/fonts/otf"
OTF=$LILYPOND_PATH"/otf"
echo $OTF
echo "Copy fonts to $LILYPOND_PATH"
cp otf/* $OTF
#cp svg/* $LILYPOND_PATH/svg

