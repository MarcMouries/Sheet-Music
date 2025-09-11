#!/bin/bash

#
#
lilypondLILYPOND frontpage.ly
lilypond version.ly

lilypond gymnopedie.ly

echo "fixing broken pdfs"

qpdf --linearize gymnopedie.pdf s.pdf

mv s.pdf gymnopedie.pdf

qpdf --empty \
     --pages \
	frontpage.pdf \
	version.pdf \
	title.pdf \
	images/satie.pdf \
	images/debussy.pdf \
	images/ss1.pdf \
	gymnopedie.pdf \
	blank2.pdf \
      -- Gymnopedie.pdf

