\version "2.19.15"
\language "english"

\header {
  title = "Tsiganisky"
}

global = {
  \time 4/4
  \key g \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1
}

melody = \relative bf' {
  \global
  \partial 8*3
  g'8 g g g4 ef8 c8 ~ c8
  g'8 g g g4 d8 bf8 ~ bf8
  g'8 g g g4 fs8 g a g f ef
  d
}


targetKey = a

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
 % \midi { }
}
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \transpose g \targetKey \melody }
  >>
  \layout { }
 % \midi { }
}