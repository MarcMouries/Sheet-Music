\version "2.24.4"
\language "english"

\header {
  title = ""
  composer = "Marc Mouries"
  style = "practice exercise"
}

global = {
  \time 4/4
  \key c \major
}

chordNames = \chordmode {
  \global
  c1
  
}

waterfall_arpeggio_C = \relative c''' {
  \global
  g8 e c d   e8 c g a  c8 g e f   
  g8 e c d   e8 c g a  c2
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \waterfall_arpeggio_C }
  >>
}