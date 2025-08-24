\version "2.24.4"

\header {
  title = ""
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1
  
}

melody =  {
  \global
 % << g d' >>  
  << b_2 d' >> 
  << b_2 e'-1 >> 
  << c'_3 e'-1 >> 
  << c'_3 f'-2 >> 
  << d'_3 f'-2 >> 
  << d'_3 g'-2 >> 
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
