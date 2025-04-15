\version "2.19.83"
\language "english"

\header {
  title = "Paganini "
  subtitle = "Centone di Sonate"
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1
  
}

melody = \relative c'{
  \global
  \repeat volta 2 {
  \partial 4
  e8 r8
  a8. gs16 a8. b16 c8. b16 c8. d16 
  e8 r8 r4 a2
  a,8. gs16 a8. b16 d8. c16 b8. a16
  b8 r8   r4 e,2
  
  a8. gs16 a8. b16 c8. b16 c8. d16 
  \break
  e8 r8 r4 a2
  g8 b e, g fs b ds, fs
  e2 ( e'8) r8
  
  }
  \repeat volta 2 {
    g,,4
    c8. b16 c8. d16-1 e8. d16 e8. fs16 
    g2 g,2
    bf8 a bf c 
    d c d e 
    f2 f,2
    a8 gs a b c b c d
    e4 ( b8) r16 b16 d8. c16 b8. a16
    b4 ( e8.) b16 d8 c b a
    gs e' gs  b e8-0 r8 e,,4 
    
  }
  
}
  

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
%  \midi { }
}
