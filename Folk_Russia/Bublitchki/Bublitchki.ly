\version "2.19.83"
\language "english"

\header {
  title = "Bublitchki"
  subtitle = "Бублички" 
  composer = "Traditional Russian"
  country = "Russia"
  genre = "Folk"
}

\include "../../common/common-header.ily"

global = {
  \time 2/4
  \key d \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  s4.      d 2:m    a 2:7    d2:m
  d2:m     bf2      bf2      f2
  a2:7     c:7 f 2  a 2:7    f2
  f4  c:7  f 2      a 2:7    c2
  f        f 2      f 2      f
  f        f 2      bf2      a:7
  d:m      d 2:m    g 2:m    d:m 
  g 2:m    d 2:m    a 2:7    d2:m
}

melody = \relative c' {
  \global
  \partial 8*3
  a8 d e 
  f4 e8 d  
  r8 g f e 
  f4 e8 d8 
  \break
  r8 d8 f a 
  d4 cs8 d  r8 f e d a2
  \break
  r8 a bf b c4 bf8 a8~
  a8 d c bf a4 g8 f 
  \break 
  r8 a8  c bf 
  a4 g8 f 
  r8 g f e 
  d2
  \break
  r8 c f g 
  a4 g8 f8  
  r8 c' b bf
  a4 g8 f 
  \break
  r8 c f a   
  c4 b8 c 
 r8 f e d 
 a2
 
 r8 a d e
 
 \break
 f4 e8 d8 
 r8 a c bf
 a4 g8 f8
 r8 a c bf
 \break
 a4 g8 f8
 r8 g f e
 d2
 r8 a8 d e 

 
  

  
  
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
