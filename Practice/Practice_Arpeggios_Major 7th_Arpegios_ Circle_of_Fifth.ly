
\version "2.24"
\language "english"


\markup \bold \large "Major 7th Arpeggios in Circle of Fourth"
    \tocItem \markup "Major 7th Arpeggios in Circle of Fourth"
\markup "\n"
\markup "\n"

\markup \bold "In First Position"
chordNamesMajorSeventhArpeggios_in_Fourth = \chordmode {
  b1:7  e:7  a:7  d:7
  g1:7  c:7  f:7  bf:7
  ef:7  af:7 df:7  gf:7
}

MajorSeventhArpeggios_in_Fourth = \relative c''' {
b,8  ds fs  a   b   a   fs  ds
e,8  gs b   d   e   d   b   gs
a,8  cs e   g   a   g   e   cs
d 8  fs a   c   d   c   a   fs
g 8  b  d   f   g   f   d   b
c,8  e  g   bf  c   bf  g   e
f 8  a  c   ef  f   ef  c   a
bf8  d  f   af  bf  af  f   d
ef,8 g  bf  df  ef  df  bf  g
af,8 c  ef  gf  af  gf  ef  c
df8  f  af  cf  df  cf  af  f
fs8  as cs  e   fs  e   cs  as
}
\score {
  <<
   \new ChordNames \chordNamesMajorSeventhArpeggios_in_Fourth
    \new Staff { \MajorSeventhArpeggios_in_Fourth }
  >>
  \layout {indent =0\cm }
}

\markup \bold "In Third Position"
MajorSeventhArpeggios_in_Third_Position = \relative c'' {
  c,_1  e  g   bf  c   bf  g   e
f 8  a  c   ef  f   ef  c   a
bf8  d  f   af  bf  af  f   d
ef,8 g  bf  df  ef  df  bf  g
}
\score {
  <<
   \new ChordNames {\chordmode {
    c1:7  f1:7  bf1:7 ef:7}
   }
   \new Staff { \MajorSeventhArpeggios_in_Third_Position }
  >>
  \layout {indent =0\cm }
}

\markup \bold "Major 7th Arpegios Circle of Fourth"

MajorSeventhArpeggios_in_Fourth_Shifting = \relative c'' {
g8  b   d   f   g8   b-2  d-2   f   
e8  c   bf  g   e8   c    bf    g
f8  a   c   ef  f8   a    c     ef
d8  bf  af  f   d8   bf   af    f
}
\score {
  <<
   \new ChordNames {\chordmode {
   g1:7  c1:7  f1:7  bf1:7}}
    \new Staff { \MajorSeventhArpeggios_in_Fourth_Shifting }
  >>
  \layout {indent =0\cm }
}


\markup \bold "Practice Arpegios - Schubert Serenade"
% String indication

\relative c' {
  \once \override TextSpanner.bound-details.left.text = \markup { "Sul D" }
  \once \override TextSpanner.style = #'dashed-line

  c4-1 e g-1 \startTextSpan  c-1 e c g c e c g\stopTextSpan  e 
  d-2 f a d-1 f d a d f d a f

}