\version "2.24.4"
\language "english"

\header {
  title = "Vivaldi-Style"
  subtitle = "Baroque style exercise"
  composer = "Marc Mouries"
  genre = "Exercise"
  video = "https://www.facebook.com/share/r/1GYw3dLfA3/"
}

\include "../../common/common-header.ily"


\markup "Shifting"
\relative c' {
 < d_0 d'-3>2 < d_0 d'-1>2   
 g'8-4  d   bf g-1
 \stemDown
 d'8-3  bf  g  d
}

global = {
  \time 4/4
  \key c \major
}

chordNames = \chordmode {
  \global
  d1:m  g1:m a1:7  d1:m  
  d1:m  g1:m a1:7  d1:m  

  d1:m  g1:m a1:7  d1:m  
  g1:m 
}

melody = \relative c'' {
  \global
  d16   a   d   a    f'   d   f   a
  d16   a   d   a    f    d   f   a,
  
  bf16  g   bf  g    d'   bf  d   g
  bf16  g   bf  g    d    bf  g   g
  \break
  a16   e   a   e    cs'  a   cs  e
  g16   e   g   e    cs!   a   cs  e
  d,16  a'  d   a    f'   d   f   a
  d16   a   d   a    f    d   f   a,
  \break
  
  d8   f   a   f    d8   f   a   f   
  d8   g   bf  g    d8   g   bf  g   
  cs,8  e   a   e    cs8  e   a   e    
  d8   f   a   f    d8   f   a   f   
  \break
  d8 e16 f a f e d      cs16 d f a d a f  d 
  g8 bf,16 d bf' g f e  d 16 g bf d g d bf g
  \break
  e8    cs16   a    cs  a  cs e
  cs16  e 16   g    cs  e  cs a e 
  d8    a 16   a16  d   a  f'  d f a d a f d a f 
  
  <g, d'>1 r1 


}

\score {
  <<
    %\new ChordNames \with { midiInstrument = "string ensemble 1" } 
    \new ChordNames \with { midiInstrument = "choir aahs" } 
    
    
      { 
        \chordNames
      }
    
    \new Staff \with { midiInstrument = "violin" } 
      {
        \melody 
      }
  >>
  \layout { }
  \midi { }
}
