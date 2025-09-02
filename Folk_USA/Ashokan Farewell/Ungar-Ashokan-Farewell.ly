\version "2.20"
\language "english"

\paper {
 %   paper-width = 15\cm 
%     paper-height = 3\cm 
}

\header {
  title = "Ashokan Farewell"
  composer = "Jay Ungar"
}

global = {
  \key d \major
  \time 3/4
  \partial 4
}

violin_I = \relative c'' {
  \global
  a16\upbow( cs8.) 
  
    \repeat volta 2 {

  \acciaccatura cs8 d4.(\downbow cs8 b16  a8.)
  | fs4\upbow ( ~ fs8  g16 fs  e16 fs8.) 
  \acciaccatura fs8 g4.\downbow fs8( e16 d8.) 
  b4 \acciaccatura {b16 cs} d4.( b8)
  
  \break 

  a4( d-4) fs
 % \break
  a4 d fs
  }
\alternative {
 {
    fs4.( g8 fs4) 
    e2-4(  a,16\( cs8.\) )
    \break
 }
 {   a4 cs e
   d2 fs,8( g) 
 }
}
  
  
 % \break


 | <d a'>4.  fs8 d4
 | \acciaccatura {b'16 cs} d2( a4)  
 \break
 | b4.( cs8) d4
 | a8 ( fs4.) \acciaccatura {g16 fs(} e4)
 | fs4. e8 \acciaccatura {fs16 e} d4
 | \acciaccatura {a} b2 a8 g 
 | a2 ~ a8 ( a'8 ~ \upbow) 
 \break
 a2 fs8( e) 
 | d4 fs( a)
 | c2 ( d4) 
 | b4. cs8 d4
 \break
 | a4 ( fs4) d
 | a d fs
 | a d fs,
 | e4. d8 cs4
 | d2. \bar "|."
}




chordNames = \chordmode {
  s4 | 
  d2.   d2.    c2.   e2.:m
  d2.   b2.:m  d2.   a2. 
  a2.   d2.    d2.   d2.
  g2.   d2.    d2.   b2.:m
  a2. 
}


scoreAViolinIPart = \new Staff \with {
  midiInstrument = "violin"
} \violin_I



\score {
  <<
      \new ChordNames \chordNames
  \scoreAViolinIPart
  %  \scoreAViolinIIPart
  %  \scoreAViolinIIIPart
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}