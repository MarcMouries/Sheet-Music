\version "2.19.83"
\language "english"

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
  c1:m6        c1:m6         g1:m6       g1:m6
  d1:7         ef2:7 d2:7   g2:m6 c2:m6   g2:m6 d2:7
  ef1:7  d1:7 g2:m d2:7 g1:m 
  
}

melody = \relative c' {
  \global
  ef''2. d8 c 
  bf8 a g fs ef d c bf
  a8 g fs g bf d d c
  ef4 d8 g8 ~ g4 r4 
  r4 \tuplet 3/2 {fs,8 a c} ef8 d c bf 
  a g fs ef d c bf a 
  g bf d4 c8 ef fs a 
  g2 r2
  \break
  
}

  

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
