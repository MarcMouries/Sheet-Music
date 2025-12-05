\version "2.19.54"
\language "english"

global = {
  \time 4/4
  \key d \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
}

melody = \relative c' {
  \global
 % \repeat volta 2 {
  d4 d a' a
  g8( f) g( a)  g4( f)
  d4 d g g
  f2 r2

  \break
    d4 d a' a
  g8( f) g( a)  g4( f)
  c4 c f ef
  d2 r2
%  }

%   \alternative {
%    {  d2 r2 }
%    {  d2 r4 d4 }
%   }
  \break
  g4. d8 g d g a
  g2. f4
  g f bf a
  g2. d4
  \break
g4. d8 g a  bf a
  g2. f4
  g f c' bf
  a1
}

words = \lyricmode {


}
