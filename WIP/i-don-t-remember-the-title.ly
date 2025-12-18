\version "2.24.4"
\language "english"

\header {
  title = "i don't remember the title"
}

global = {
  %\tempo 4=100
}

chordNames = \chordmode {
  \global
  
  
}

melody = \relative d' {
  \time 4/4
  \key d \minor
  \partial 4. 
 d8 e f 
 g4 g8 g4 g8 f8 e8 
 f4 f8 f4 f8 e8 d8 
 e4 e8 e4 e8 d8 cs8
 d4 e f 
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
