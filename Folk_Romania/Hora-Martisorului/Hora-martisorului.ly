\version "2.24.1"
\include "../../common/stylesheet_fiddle.ly"
\language "english"

\header {
  title = "Hora Mărțișorului"
  subtitle = "(Little March Hora)"
  composer = "Grigoraș Dinicu (1889-1949)"
  country = "Romania"
  style = "hora"
}

\include "../../common/common-header.ily"

global = {
  \time 4/4
  \key a \major
  %\tempo 4=100
}

chordNames = \chordmode {
  \global
  fs1:m    b1:m  cs1:7 cs2.:7 fs4:m 
  fs1:m    b1:m  cs1:7 cs2.:7 fs4:m 

}

melody = \relative c'' {
  \global
  \mark "A1"
  fs16 gs a fs 
  c'  a gs a 
  fs gs a gs
  fs e d cs! 
  b cs d b 
  es d cs d
  b cs d cs 
  b a gs fs 
  es fs gs a 
  b cs d cs
  b a gs fs 
  es! d cs bs
  cs d es fs
  gs a b cs
  d es fs gs
  a fs cs a'
  

  % 2nd time
  \mark "A2"
  fs16 gs a fs 
  c'  a gs a 
  fs gs a gs
  fs e d cs! 
  b cs d b 
  es d cs d
  b cs d cs 
  b a gs fs 
  es fs gs a 
  b cs d cs
  b a gs fs 
  es! d cs bs
  cs d es fs
  gs a b! a
  gs fs es! gs
  \appoggiatura {fs8 gs } fs8 fs

  
}

words = \lyricmode {
  
  
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout {indent =0 }
%  \midi { }
}
