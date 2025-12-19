\version "2.19.53"
\language "english"
\include "../../common/bars-per-line-engraver.ly"


\header {
  title =  "Bistro Fada"
  subtitle =  "From \"Midnight in Paris\""
  encodingdate =  "2018-10-19"
  composer =  "Stephane Wrembel"
  country = "France"
  video = ""
  genre = "Jazz"
  subgenre = "Gypsy Jazz"
}

\include "../../common/common-header.ily"

global = {
  \time 3/4
  \key g \major
  \tempo 4=200
}

melody =  \relative c' {
%  \clef "treble" 
%  \key g \major | % 1
%  \tempo "" 4=200 -
\global
R2. R R
  b'8 -\f  c8 -\>  b8  a8  g8
   fs8 | % 4
   e4 r4 r4 -\!  | % 5
  R2. R
  r8 -\mp  b8 -\<  cs8  ds8  e8
   fs8 | % 7
   
   \repeat volta 2 {
   g4. -\! -\mf  g8  fs8  g8 
  as8  b8    c8  b8  as8  b8 
  g'4.  ds8 
   fs8  f8  e8  b8
   cs8  ds8  e8  fs8 |
   g8  a16  g16  fs8 g8  as8  b8  
   
   c8 b8  as8  b8  d8  c8
   fs,4.  fs8 
   fs4 ~ fs2.| % 13
   ds8  e8  fs8  ds8
   e8  fs8  
   c4 ~ c4 r4  a8  b8  c8 a8 
   b8  c8  fs,2 r4
   b,8  c16  b16  as8  b8  ds8  fs8  
  a8  b8  ds8  fs8  a8  fs8
   g8  b8  e,4 ~  e4 
   r8  b,8  cs8  ds8  e8
   fs8 | % 19
   g4.  a16  g16  fs8  g8
   as8  b8 
   c8  b8  as8  b8  g'4.  ds8 
   fs8  f8  e4.  f16
   e16  ds8  e8 
   f8  e8  b'8  gs8
   f8  e8  
   d8  c8  b  c a8  a a c8 fs4 ~
   fs4 r4 r4  r4
   g8  fs8  e8  g8 fs8  e8  
   c4 ~  c8  c8  c8 r8  
   fs8 e8  ds8  fs8  e8  ds8  
   b4.  b8 b8 r8 
   b8  c16  b16  as8  b8  c4 
   r8  b8  as8  b8  cs8  ds8
   e2   r4 
   r8  b,8  cs8  ds8  e8 fs8
   }
   g4.  a16  g16  fs8  g8
   as8  b8  c8  b8  as8  b8 
  g'4.  ds8 
   fs8  f8  e8  b8
   cs8  ds8  e8  fs8 | % 34
   g8  ds8  e8  fs8
   g8  as8  b8  c16
   b16
   as8  b8  d8  c8
   fs,4.  fs8 
   fs4 r2 r4 
   ds8  e8  fs8  ds8
   e8  fs8  c4 ~  c4 
   r4  a8  b8  c8 a8 
   b8  c8  fs,2 r4 
   b,8  c16  b16  as8  b8 
  ds8  fs8  a8  b8
   ds8  fs8  a8  fs8
   g8  b8  e,4 ~ e4 r8  b,8  cs8  ds8  e8
   fs8 | % 43
   g4.  a16  g16  fs8  g8
   as8  b8 
   c8  b8  as8  b8 
  g'4.  ds8 
   fs8  f8  e4.  f16
   e16  ds8  e8 | % 46
   f8  e8  b'8  gs8
   f8  e8  d8  c16
   d16
   c8  b8  a8  gs8  b8
   gs8  a4 ~ a4 r2 r4 | % 49
   g'8  fs8  e8  g8
   fs8  e8  c4 ~  c8  c8  c8 r8  fs8
   e8  ds8  fs8
   e8  ds8  b4.  b8
   b8 r8 | % 52
   b16  c16  b8  as8
   b8  c4 r8  b8 
   as8  b8  cs8  ds8
   e2 ~  e4 r4 r8  ds,8  e8  f8 | % 55
   fs8  ds8  c8  as8  b8
   ds8  fs8  a8 
   b8  ds8  fs8  a8
   g16  a16  g8  fs8
   g8 
   b8  g8  e2 r4 | % 58
   ds8  e8  fs8  b,8
   b'4 r8  a8 
   g8  fs8  a8  gs8
   g4 r8  g8 
   e4 r4 r8  ds,8  e8  f8 | % 61
   fs8  ds8  c8  b8  as8
   b8  ds8  fs8
   a8  c8  d8  fs8
   e16  fs16  e8  ds8
   e8 
   fs8  g8  b,4.  b8 
  as8  b8 | % 64
   d4.  df8  c4 ~  c8
   b8 
   a8  g8  fs8  g8  e8 r4 r8
  r2 r8  ds8  e8  f8 | % 67
   fs8  ds8  c8  as8  b8 ds8  
   fs8  a8 
   b8  ds8  fs8  a8
   g16  a16  g8  fs8
   g8 b8  g8  
   e2 r4
   ds8  e8  fs8  b,8 b'4 
   r8  a8 
   g8  fs8  a8  gs8
   g4 r8  g8
   e4 r4 r8  ds,8  e8  f8
   fs8  ds8  c8  b8  as8 b8  
   ds8  fs8
   a8  c8  d8  fs8
   e16  fs16  e8  ds8 e8
   fs8  g8  b,4.  b8 
  as8  b8 | % 76
   d4.  df8  c4 ~  c8
   b8 
   a8  g8  fs8  g8  
   e2 ~ e4 r4  b4  c4 | % 79
   d8  e8  fs8  d8  e8
   fs8  d8  e8 
   fs8  d8  e8  fs8  ds8
   e8  fs8  ds8
   e8  fs8  ds8  e8  fs8
   ds8  e8  fs8 | % 82
   e16  f16  e8  ds8  e8
   gs8  b8  d8  c8
   b8  c8  e8  c8 
  a4 r8  a8
   a4 r2 r4 | % 85
   fs8  g8  a8  fs8  g8
   a8  d,8  d'8
   d8  c8  c8  b8 
  b4.  a8 
   a8  g8  g2 r4 | % 88
  r8  as,8 r8  cs8 r8  fs8  as8
   a8
   as2 r8  b,8 r8  ds8 
  r8  fs8  fs8  e8  e4  ds4
  | % 91
   d8  e8  fs8  d8  e8
   fs8  d8  e8 
   fs8  d8  e8  fs8  ds8
   e8  fs8  ds8
   e8  fs8  ds8  e8  fs8
   ds8  e8  fs8 | % 94
   e16  f16  e8  ds8  e8
   gs8  b8  d8  c8 
   b8  c8  e8  c8 
  a8 r4  a8 
   a4 ~  a8  e8  a8  c8
   d8  ds8 | % 97
   e8 r4  e8  g4 ~  g8
   g8
   fs8  a8  g8  fs8
   d8 r4  d8 
   fs4 ~  fs8 r8  e8 
  fs16  e16  ds8  e8 |
   g8  e8  c8 r4  a8 
  as8  b8 
   d8 r4  d,8  g4 r4
  r4  a,8  b8  cs8  d8  e8
   fs8 | % 103
   g4.  a16  g16  fs8  g8
   as8  b8
   c8  b8  as8  b8 
  g'4.  ds8 
   fs8  f8  e8  b8
   cs8  ds8  e8  fs8 | % 106
   g8  a16  g16  fs8
   g8  as8  b8  c8
   b8
   as8  b8  d8  c8
   fs,4.  fs8
   fs4 r2 r4 | % 109
   ds8  e  fs  ds  e8  fs8  
   c4 ~ c4 r4  a8  b8  c8
   a8 
   b8  c8  fs,2 r4 | % 112
   b,8  c16  b16  as8  c8 
  ds8  fs8  a8  b8 
   ds8  fs8  a8  fs8
   g8  b8  e,4 ~
   e4 r8  b,8  cs8  ds8  e8
   fs8 | % 115
   g4.  a16  g16  fs8  g8
   as8  b8
   c8  b8  as8  b8 
  g'4.  ds8 
   fs8  f8  e4.  f16
   e16  ds8  e8 | % 118
   f8  e8  b'8  gs8
   f8  e8  d8  c16
   d16 
   c8  b8  a8  gs8  b8
   gs8  a4 ~ a4 r2 r4 | % 121
   g'8  fs8  e8  g8
   fs8  e8  c4 ~ c8  c8  c8 r8  fs8
   e8  ds8  fs8 
   e8  ds8  b4.  b8
   b8 r8 
   b16  c16  b8  as8
   b8  c4 r8  b8 
   as8  b8  cs8  ds8
   e2 r4  
   e'2 r4 \bar "|."
}

chordNames = \chordmode {
  e2.:m g b:7 b:7 
  e:m g b:7 b:7
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff {    \melody }
  >>
\layout {
    \context {
      \Score
      %use the line below to insist on your layout
      %\override NonMusicalPaperColumn.line-break-permission = ##f
      \consists #(bars-per-line-engraver '(4))
    }
  }
}
