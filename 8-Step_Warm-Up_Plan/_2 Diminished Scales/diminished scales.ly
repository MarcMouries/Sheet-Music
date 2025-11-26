\version "2.19.14"
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
