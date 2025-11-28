\version "2.19.53"
\language "english"

\header {
  title = "Blues en Mineur"
  country = "France"
  style = "gypsy jazz"
}

global = {
  \time 4/4
  \key c \major
}

chordNames = \chordmode {
  \global
}




melody = \relative c'' {
  \global
%  r2 r2
%  r4 r r r
  r4  a,8  bf  d  g  bf  g 
  bf  d  fs  a  d4. a8 c8 bf8 g4 g4 r4
  r4 r4 r4 
   
  
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout {indent = 0 }
%  \midi { }
}
