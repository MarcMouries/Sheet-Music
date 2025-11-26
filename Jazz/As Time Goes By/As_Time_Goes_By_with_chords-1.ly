\version "2.19.49"
%\pointAndClickOff
\language "english"


\header {
 title="As Time Goes By"
 composer = ""
  style = "jazz"
}

melody =  \relative a' {
  \clef "treble" 
  \key d \major 
  \numericTimeSignature
  \time 4/4 | % 1
   \partial 8  fs8 \repeat volta 2 {
     g8.  fs16  e8.  d16  e4.  fs8 
     a8.  g16  fs8.  e16  g4.
     a8
     d8.  cs16  b8.  a16  b2
   
    r2 r4  cs4 
    
    \break
     e8  d8  cs8  b8  cs4
     d4 
     a4  a4  d,4  e4
  }
  \alternative {
    {
      fs1 ~ | % 9
       fs2 r8 r8 r8  fs8
       \break
    }
    {
      d1 ~ | % 11
       d2 r2
    }
  } \bar "||"
   d8  e8  d8  b'8 ~  b4
   b4 | % 13
   b8  c8  b8  as8  b2
   
   \break
   e,8  fs8  e8  b'8 ~  b4
   b4 | % 15
   b8  cs8  b8  as8  b2 | % 16
   fs8  g8  fs8  d'8 ~  d4
   d4 | % 17
   d8  cs8  d8  cs8  e4
   cs4 | % 18
   \break
   b4  b4  fs4  fs4 | % 19
   a2. r8  fs8 | 
   g8  fs8  e8  d8  e8  e4
   fs8 | % 21
   a8  g8  fs8  e8  g8 
  g4  a8 | % 22
  \break
   d8  cs8  b8  a8  b2 | % 23
  r2 r4  cs4 | % 24
   e8  d8  cs8  b8  cs4
   d4 | % 25
   a4  a2  fs4 | % 26
   a2  a2 | % 27
   d2. r4 \bar "||"
}



\score {
  \new Staff \with {
    instrumentName = "Violin"
    midiInstrument = "violin"
  } \melody
  \layout { }
  \midi {
    \tempo 4=120
  }
}

