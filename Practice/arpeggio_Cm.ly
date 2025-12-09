\version "2.19.83"
\language "english"

\header {
  title = ""
  composer = "Marc Mouries"
  genre = "Exercise"
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1:m
  
}

melody = \relative c' {
  \global
  c8   ef g c
  ef,8 g  c ef
  g,8  c ef g
  
  
}

words = \lyricmode {
  
  
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
