\version "2.24.4"
\language "english"

\header {
  title = "Quizás, quizás, quizás"
}

global = {
  \time 4/4
  \key a \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  r1
  a:m        d2:m e2:7  a1:m  
  d2:m e2:7  a1:m    f2:9 e:9
  a2:m  d2:m  
}

melody = \relative c' {
  \global
  r4 r8 e8 fs gs a b
  c4. a8 ~ a4 a4
  d2 \tuplet 3/2 {b4 d b }
  c4. a8 ~ a4 a4
  \break
  d2 \tuplet 3/2 {b4 d b }
  e4. c8 ~c4 e,4   
  c'4 r8 a8 b4 r8 gs
  a1
  
  
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
