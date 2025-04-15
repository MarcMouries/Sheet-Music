\version "2.19.83"
\language "english"

\header {
  title = "Wrong Roads"
  composer = "Steve Kroeger x Skye Holland"
  
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  e1
  
}

melody = \relative c' {
  \global
  b8 cs  e fs fs b cs e 
  gs gs fs fs e b 
  
}

words = \lyricmode {
  
  
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
