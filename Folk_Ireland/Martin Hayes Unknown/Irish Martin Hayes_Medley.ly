\version "2.19.49"
\language "english"
\header {
  title = "Irish  Medley"
  composer = "Martin Hayes"
  style = "medley"
}

global = {
  \time 6/8
  \key f \major
}

chordNames = \chordmode {
  \global
  c1

}

melody = \relative c'' {
  \global
  f8-1\upbow e \acciaccatura f e d4.  c8
  a-0 c \acciaccatura c d
  c r8
  a-0\downbow \acciaccatura a  bf a
  f4.  a4. g4 e8( f8)
  f16( e) f8 f16( e) f4
  c'4 bf'2 bf4 bf bf a g
}

words = \lyricmode {


}

\score {
  <<
%    \new ChordNames \chordNames
    \new Staff { \melody }
%    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
