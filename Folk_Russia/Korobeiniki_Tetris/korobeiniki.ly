\version "2.19.32"
\include "../../stylesheets/stylesheet_fiddle.ly"
\include "italiano.ly"

\header {
	title = "Коробейники (Korobeiniki)"
	poet = "Nikolaï Alekseïevitch Nekrassov"
	composer = "Trad. Russe"
  country = "Russia"
	arranger = ""
	  style = "russian traditional"
}

\include "../../common/common-header.ily"

melody = \relative si' {
	\clef "treble"
	\key do \major
	\time 4/4
	
	\repeat volta 2 {
	 mi4 si8 do re4 do8 si
	 la4 la8 do mi4 re8 do 
	 si4 si8 do re4 mi
	 do4 la  la2 
	\break
	r8 re re fa
	 la4 sol8 fa
	 mi4 mi8 do
	 mi4 re8 do
	 si4 si8 do
	 re4 mi
	 do la
	 la2
	\break
	}
	<do mi>2 <la do>2 re2 si 	do la sold si
	mi2 do2 re2 si 	la4 do mi mi sold1
}

chordNames = \chordmode {
  la1:m    la1:m  sol1  la1:m
  re1:m    do1    sol1  la1:m
}

   
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
