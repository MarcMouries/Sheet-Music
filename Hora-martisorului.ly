\version "2.24.1"
\language "english"

\header {
  title = "Hora Mărțișorului"
  subtitle = "(Little March Hora)"
  composer = "Grigoraș Dinicu"
}

global = {
  \time 4/4
  \key a \major
  %\tempo 4=100
}

chordNames = \chordmode {
  \global
  fs1:m
}

melody = \relative c'' {
  \global
  fs16 gs a fs 
  bs  a gs a 
  fs gs a gs
  fs e d cs 
  b cs d b 
  es d cs d
  b cs d cs 
  b a gs fs 
  es fs gs a 
  b cs d cs
  b a gs fs 
  es! d cs bs
  cs d es fs
  gs a bs cs
  d es fs gs
  a fs cs a'
  
  % 2nd time
  

  
}

words = \lyricmode {
  
  
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
%  \midi { }
}
