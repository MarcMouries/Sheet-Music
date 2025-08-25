\version "2.19.18"
\language "english"

\header {
  title = "Si Tu Savais COPY HAS MORE NOTES"
}

global = {
  \time 4/4
  \key b \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  b1:m
  
}

melodyA = \relative c' {
  \global 
 \acciaccatura a8
 b8 cs d a' ~ a4. \tuplet 3/2 {g16( a g)} 
 f8 
}

melodyB = \relative c'' {
  \global 
 %\acciaccatura a8
 b8 cs d a' ~ a4. \tuplet 3/2 {g16( a g)} 
 f8 
}
\score {
  <<
    \new ChordNames {\chordNames}
    \new Staff       { \melodyA }
  >>
  \layout { }
  \midi { }
}

\score {
  <<
    \new ChordNames {\chordNames}
    \new Staff       { \melodyB }
  >>
  \layout { }
  \midi { }
}