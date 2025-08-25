\version "2.19"
\language "english"

%\include "profondo.ily"
%\include "LilyJAZZ.ily"
\include "improviso.ily"
%\include "paganini.ily"

\header {
  title = "from the Movie 'Swing'"
  composer = ""
}




global = {
  \time 4/4
  \key c \major
  \tempo 4=200
}

chordNames = \chordmode {
  \global
  a1:7 d2:7 a1:9

}

melody = \relative c'' {
  \global
  a'2 cs,8 d fs a
  c2 b4 a g2 fs8 g gs a
  bf2 a4 g
  \break
fs4

  %\tuplet 3/2
  {d'8-4 c b } a8 fs
  d8
  %\tuplet 3/2
  {b8 bf a} gs8  fs'4 cs8 d8~
  d2 cs8 r8 r4

}

words = \lyricmode {
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout {indent=0 }
  \midi { }
}

\score {
  <<
  % \new ChordNames \chordNames
    \new Staff { \transpose d b, \melody }
  >>
  \layout {indent=0 }
  \midi { }
}

arpeggioMajorSixth  = \relative c'' {
d fs a b d fs a b
}


\score {
  <<
  %  \new ChordNames \chordNames
    \new Staff { \transpose d fs \arpeggioMajorSixth }
  >>
  \layout {indent=0 }
  \midi { }
}