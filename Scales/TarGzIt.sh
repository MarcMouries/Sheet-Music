#!/bin/bash

tar -cf GenerateScales.tar \
	README.txt \
	$0 \
	*.ly \
	GenerateScales.sh \
	RemoveGeneratedScales.sh \
	\
	en fr \
	en/gis_TrebleAndBass.ly \
	en/gis_TrebleAndBass.pdf \
	gis_TrebleAndBass_Locrian.png

gzip GenerateScales.tar

ls -sal GenerateScales.tar.gz
