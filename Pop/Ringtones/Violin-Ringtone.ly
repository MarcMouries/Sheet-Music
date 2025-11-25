\version "2.19.38"

\header {
  title = "Violin Ringtone"
  composer = "composer ?"
  subsubtitle = "music sheet: marc@mouries.net"
  poet = "December 24, 2016"
}

global = {
  \key c \major
  \time 4/4
}

violin = \relative c'' {
  \global
  
  a'8-. g-. f-. e-. d-. c-. b-. a-. 
  d-. c-. b-. a-. g-. f-. e-. d-. 
  e4 e8 e e4 e8 e e4 e8 e e4 r4
  \break
  c''4. b8 c b c4  r8 b8 c b c b  
  e4 b4.  a8 b a b4
  r8 a8 b a b a d4 
  a4. g8 a g a4
  r8 g8 a g b4 g4
  \tuplet 3/2 4 {
    f8( g f)  
    e( f e) 
    d( e d)
    c( d c)
    b( c b)
    a( b a)
    g( a g )
    f( g f)
  }
}


\score {
  \new Staff \with {
    instrumentName = "Violin"
    midiInstrument = "violin"
  } \violin
  \layout { }
  \midi {
    \tempo 4=120
  }
}
