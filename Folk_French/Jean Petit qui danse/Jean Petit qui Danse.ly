
\include "../../stylesheets/stylesheet_fiddle.ly"

\version "2.19.13"
\language "english"
\header {
  title = "Jean Petit qui danse"
  composer = "Traditional French"
  country = "France"
  style = "children's song"
  tagline = ""
}

global = {
  \time 4/4
  \key f \major
  \tempo 4=100
}



chordNames = \chordmode {
  \global
  d1:m  a2:7 d2:m  d1:m  a2:7 d2:m
  d1:m  a2:7 d2:m  d1:m  a2:7 d2:m
  
}

melody = \relative c' {
  \global
  d8 a' a g a4 f4 
  g8 g g a f( e) d4
  d8 a' a g a4 f4 
  g8 g g a f( e) d4
  \break
  d8 e f4 e4 d4    
  d8 e f4 e4 d4
  d8 e f4 g4 a4    
  d4 a8 bf a g f e 
  d2 r2
  \break
}

words = \lyricmode {
  Jean Pe -- tit qui dan -- se
  Jean Pe -- tit qui dan__ se
  De son doigt il dan -- se
  De son doigt il dan -- se
  
  De son doigt, doigt, doigt 
  De son doigt, doigt, doigt 
  De son doigt, doigt, doigt 
  Hey! Ain -- si dan -- se Jean Pe -- tit
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

\relative d'' {
 d8 d d f a2 
 g8 a g f e c d4 
 r4 f8 a 
 c2 d8 c a f d2
 \break
 d'16 d d d d8 c8  a2
 d,16 e f g a8 bf a2
 g8 a16 g f8 g16 f e8 f 
 g8 a g f e c d2 
 
}