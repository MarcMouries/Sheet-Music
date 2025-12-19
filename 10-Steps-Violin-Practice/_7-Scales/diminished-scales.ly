\version "2.24.4"
\language "english"

\header {
  title = "Diminished Scales"
  composer = "Marc Mouries"
  genre = "Exercise"
}

\include "../../common/common-header.ily"

global = {
  \time 4/4
  \key c \major
}

chordNames = \chordmode {
  \global
  
}

melody = \relative c' {
  \global
  a8 c ef fs a c ef fs a fs ef c a fs ef c
  
 
  
}

words = \lyricmode {
  
  
}

\score {
    \new Staff { \melody }
  \layout { }
}

\score {
    \new Staff { \transpose a g \melody }
  \layout { }
}
