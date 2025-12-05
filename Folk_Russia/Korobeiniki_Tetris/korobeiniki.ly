\version "2.19.32"
\include "../../stylesheets/stylesheet_fiddle.ly"
\include "italiano.ly"

% This file is the PREVIEW WRAPPER for editing
% MASTER FILE for music content: korobeiniki_music.ily
% Edit the .ily file to change the melody/chords

\include "korobeiniki_music.ily"

\header {
	title = "Коробейники (Korobeiniki)"
	poet = "Nikolaï Alekseïevitch Nekrassov"
	composer = "Trad. Russe"
  country = "Russia"
	arranger = ""
	  style = "russian traditional"
}

\include "../../common/common-header.ily"

   
\markup "A minor"

\score {
  <<
    \new ChordNames \chordNames
    \new Staff      { \transpose do do \melody }
  >>
  \layout { }
}

\markup "Ré"

\score {
  <<
    \new ChordNames { \transpose do re \chordNames}
    \new Staff      { \transpose do re \melody }
  >>
  \layout { }
}
\markup "Mi"
\score {
  <<
    \new ChordNames { \transpose do mi \chordNames}
    \new Staff      { \transpose do mi \melody }
  >>
  \layout { }
}

\markup "Fa"
\score {
  <<
    \new ChordNames { \transpose do fa, \chordNames}
    \new Staff      { \transpose do fa, \melody }
  >>
  \layout { }
}

\markup "Sol"
\score {
  <<
    \new ChordNames { \transpose do sol \chordNames}
    \new Staff      { \transpose do sol \melody }
  >>
  \layout { }
}

\markup "La"
\score {
  <<
    \new ChordNames { \transpose do la, \chordNames}
    \new Staff      { \transpose do la, \melody }
  >>
  \layout { }
}
