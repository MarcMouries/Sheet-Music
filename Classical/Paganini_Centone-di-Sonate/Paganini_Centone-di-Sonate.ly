\version "2.19.83"
\language "english"

\header {
  title = "Centone di Sonate"
  composer = "Niccolò Paganini (1782-1840)"
  country = "Italy"
  opus = "Op. 64"
  genre = "Classical"
}

\include "../../common/common-header.ily"

global = {
  \time 4/4
  \key a \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1
  
}

melody = \relative c'{
  \global
  \repeat volta 2 {
  \partial 4
  e8 r8
  a8[ r16 gs16]  a8[ r16 b16] c8[ r16 b16] c8[ r16 d16] 
  e8 r8 r4 a2\accent
  a,8[ r16 gs16]  a8[ r16 b16] d8[ r16 c16] b8[ r16 a16]
  b8 r8   r4 e,2-\accent
  \break
  a8[ r16 gs16]  a8[ r16 b16]  c8[ r16 b16]  c8[ r16 d16] 
  e8 r8 r4 a2\accent
  g8[ r16 b]  e,8[ r16 g]  fs8[ r16 b]  ds,8[ r16 fs]
  e2 ( e'8) r8
  }
  \break
  \repeat volta 2 {
    g,,4
    c8[ r16 b16] c8[ r16 d16-1] e8[ r16 d16] e8[ r16 fs16] 
    g2\accent g,2\accent
    bf8 a bf c 
    d c d e 
    f2\accent f,2\accent
    a8 gs a b c b c d
    e4 ( b8) r16 b16 d8[ r16 c16] b8[ r16 a16]
    b4 ( e8[ r16) b16]  d8 c b a
    gs e' gs  b e8-0 r8 e,,4 
    
  }
  
}
  

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { \tempo 4 = 100 }
}
