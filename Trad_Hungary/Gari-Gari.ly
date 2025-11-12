\version "2.19.64"
\language "english"

\header {
  title = "Gari Gari"
}


global = {
  \time 2/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  \partial 4. s4. a1:m
  
}

melody = \relative c''' {
  \global
  \partial 4. a8 bf b 
  c2 ~ c8 ef8 d c 
  bf8.  a16 g4 ~ 
  g8 g g a 
  \break
  bf4 d c bf a8. g16 
  f4 ~ f8 f8 f8 g8 
  
  
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
