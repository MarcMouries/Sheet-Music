\version "2.19.83"
\language "english"

\header {
  title = "Bublitchki"
}

global = {
  \time 2/4
  \key d \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  s4.      d2:m   d:m    d:m
  d:m      d:m    d:m    d:m
  d:m      f      f      f
  f4  c:7  f2     f      d:m
  f        f      f      f
  f        f      f      a:7
  d:m      d:m    d:m    d:m 
  
}

melody = \relative c' {
  \global
  \partial 8*3
  a8 d e f4 e8 d ~ 
  d g f g f4 e8 d8 ~
  \break
  d8 d8 f a 
  d4 cs8 d ~ d f e d a2
  \break
  r8 a bf b c4 bf8 a8~
  a8 d c bf a4 g8 f ~
  \break 
  f8 a8  c bf 
  a4 g8 f ~ f g f e d2
  r8 c f g 
  \break
  a4 g8 f8 ~ 
  f8 c' b bf
  a4 g8 f ~
  f8 c f a   
  \break
  c4 b8 c~ 
 c8 f e d 
 a2
 r8 a d e 
 \break
 f4 e8 d8~ 
 d8 a c bf
 a4 g8 f8~
 f8 a c bf
 \break
 a4 g8 f8~
 f8 g f e
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
