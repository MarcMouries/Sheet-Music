% slur collides with the sharp sign
% happens with 2.16.2 and 2.17.21
\version "2.16.2"
\language "english"
\paper{ ragged-right=##t }

Violin = \relative d' {
  \key g \major  
  \time 3/4 
     | e8 (  fs  c'  b)   fs(  ds
     | fs8  a)   g2~
}
\score {
   \new Staff {\Violin  }
   \layout {}
}