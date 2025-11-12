\version "2.24.4"
\language "english"

\header {
  title = "Vivaldi-Style"
  subtitle = "https://www.facebook.com/share/r/1GYw3dLfA3/"
}

global = {
  \time 4/4
  \key c \major
}

chordNames = \chordmode {
  \global
  d2:m  g2:m a2:7  d2:m  
  d2:m  g2:m a2:7  d2:m  
  
}

melody = \relative c'' {
  \global
  d32   a   d   a    f'   d   f   a
  d32   a   d   a    f    d   f   a,
  
  bf32  g   bf  g    d'   bf  d   g
  bf32  g   bf  g    d    bf  g   g
  \break
  a32   e   a   e    cs'  a   cs  e
  g32   e   g   e    cs!   a   cs  e
  d,32  a'  d   a    f'   d   f   a
  d32   a   d   a    f    d   f   ,a
  \break
  
  d16   f   a   f    d16   f   a   f   
  d16   g   bf  g    d16   g   bf  g   
  cs,16  e   a   e    cs16  e   a   e    
  d16   f   a   f    d16   f   a   f   
  \break
  d16 e32 f a f e d 
  cs32
r4 r4 r4 r4

}

words = \lyricmode {
  
  
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
