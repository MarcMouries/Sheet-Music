\version ""

\header {
  title = ""
  composer = "Marc Mouries"
  style = "practice exercise"
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  
  
}

melody = \relative c' {
  \global
  a c_3 a c_1 e_3 
  c_1 e_1 g  e_1 g a
  
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
