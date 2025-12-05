\version "2.24.0"
\language "english"
\header {
  title = "Summertime"
  composer = "G. Gershwin"
  country = "USA"
  subtitle = "(from Porgy and Bess)"
    style = "jazz"
}

\include "../../common/common-header.ily"

Chords = \chordmode {
  \partial 2  s2
  \repeat "volta" 2 {
    |  a1:min7          |  a2:min7      e2:7.9+ | a1:min7       | a1:min7
    |  d1:min7          |  f:9                  | b1:min7.5+    | e:7.9+    
    |  a1:min7          |  e:7.5+               | a1:min7       | d1:min7
    |  c2:maj7  a2:min7 |  b2:min7.5+   e:7.5+  | s1            | s1
    | s1                |                       | s1            | s1
    | s1                |                       | s1            | s1
  }
}

Tune = \relative c''{
  \partial 2
  \tempo 4 = 76
  e4 c4 |
  \repeat "volta" 2 {
  | e1 ~  
  | e4  d8 c8 d8 e8 c4  
  | a2 e2 ~  
  | e4 r e' c |  
  \break
  | d8 d4. ~ d2 
  | r4 c8 a8 c4 a8 c8
  | b1 ~ 
  | b2   r8 e4 c8 
  \break
  | e8 e4 e8 ~ e2 
  | r4 d8 c8 d e8 c4
  | a2 e2 ~ 
  | e2 r4 e4
  \break
  | g4 e8 g8 a4 c4
  | e8 ( d4.) c2 
  | a1 ~ 
  | a4 r4 \tuplet 3/4 {e'8 e8 c8 }

    \break
| s1                |                       | s1          | s1     | s1    

  }
}

\score {
  <<
    \new ChordNames \Chords
    \new Staff { \Tune }
  >>
  \layout { }
  \midi { \tempo 4 = 76 }
}