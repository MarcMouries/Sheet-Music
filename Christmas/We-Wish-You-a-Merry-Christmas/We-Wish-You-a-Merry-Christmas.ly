\version "2.24.4"
\language "english"

\header {
  title = "We Wish You a Merry Christmas"
  subtitle = "XVI Century"
  composer = "Traditional English"
  country = "England"
  style = "christmas carol"
}

\include "../../common/common-header.ily"


chordNames = \chordmode {
  s4
  g2. c2. a2.:m 
  d2.   b2. e2.:m c2 d4
  g2.  g2. d2. e2.:m d2.
  g2.   b2.:m  c2. c2 d4
  g2. c2. a2.:m 
  d2.   b2. e2.:m c2 d4
  g2.  
  
}

melody = \relative d' {
  \key g \major
  \time 3/4
\partial 4   d4                         % pickup

  % We wish you a merry Christmas...
  g4 g8 a g8 fs 
  e4 e  e 
  a4 a8 b a g
  \break
  fs4 d4 fs4
  b4 b8 c b8 a 
  g4 e4 d8 d8            
  e4 a4 fs4
  \break
  g2 d4 g4 g4 g4 
  fs2 fs4 
  g4 fs e
  d2 a'4
  \break
  b4 a g
  d'4 d,4 d8 d8            
  e4 a4 fs4
  g2 d4 
  \break
          

  % We wish you a merry Christmas (repeat)
  g4 g8 a g8 fs 
  e4 e  e 
  a4 a8 b a g
  \break
  fs4 d4 fs4
  b4 b8 c b8 a 
  g4 e4 d8 d8  
  e4 a fs 
  g2 r4
}

lyrics = \lyricmode {
  We wish you a Mer -- ry Christ -- mas,
  We wish you a Mer -- ry Christ -- mas,
  We wish you a Mer -- ry Christ -- mas
  and a Hap -- py New Year.

  Good ti -- dings we bring to you and your kin,
  Good ti -- dings for Christ -- mas
  and a Hap -- py New Year.

  We wish you a Mer -- ry Christ -- mas,
  We wish you a Mer -- ry Christ -- mas,
  We wish you a Mer -- ry Christ -- mas
  and a Hap -- py New Year.
}

\score {
  <<
    \new ChordNames { \chordNames }
    \new Staff { \melody }
    % \new Lyrics \lyricsto melody { \lyrics }
  >>
  \layout { }
  \midi { \tempo 4 = 120 }
}
