%=============================================
%   Created by Marc
%   December 10, 2010
%=============================================
\version "2.12"
\include "english.ly"
\header {
	title     = "Petit Papa Noël"
	composer  = "Raymond Vincy & Henri Martinet"
	poet      = "Raymond Vincy"
	country   = "France"
	style     = "christmas song"
}

\include "../../common/common-header.ily"

% LAYOUT
#(set-global-staff-size 22)
#(set-default-paper-size "letter")
\paper {
    indent = 0.0
}

firstPart = {
     | g   g   g   a
     | g2. g8  a
     | b4  b   b   c
     | b2. a4
     | g4. g8  g8 g8  fs e
     | d2. d8  d8
}

melody = {
	  \clef treble
	  \time 4/4
	  \key g \major
	  \relative c' {

	    \partial 8*4  r8 d g a
        | b b b b  b b b  a
        | g g g g  g g g  fs
        | e e e e  e fs g  e
        | d d d d  d4  r8 d8
        | e e e e  g4  g4
        | b2 g2
        | d8 d d d d4 e8 a8
        | g2 r4 d4
	    \firstPart
        | g2  g8  g fs g
%\break
        | a2.     d,4
	     \firstPart
        | g2  g8  g a a
        | g2. r4
\break
        | e8  e   e  e  e4 e8 fs
        | g4. e8  e4 d4
        | g8  g   g  g  g4 fs8 g
%{ 20 %}| a2. r4
        | bf8  bf  bf  bf  bf4 a8 bf
        | c4. a8  g4  f
        | bf4  bf8 bf8 c4 c8 c8
        | d2.  d,4
	    \firstPart
        | g2  g8  g a a
        | g2. r4
        | r2. d4
        | e4  g  a  c
        | d\fermata
        \bar "|."
	}
}

acc = \chords {
       | \partial 2 s2
       | s1
       | s1
       | s1
       | s1
       | s1
       | s1
       | s1
       | s2
        \partial 2 d2:7
       | g2  c
       | g2  c2
       | g2  c2
       | g2  g2:7
       | c1
       | g2  e:m
       | a1:7
       | d2:sus4 d4 d4:7
       |
       |


}

\score {
	<<
%	   \new ChordNames { \transpose c g { \acc} }
	   \new Voice  { \melody }
%	   \new Voice      { \transpose c g { \melody} }
	>>
    \layout  {}
    \midi {
    \context {\Score tempoWholesPerMinute = #(ly:make-moment 120 4 ) } }
}