\version "2.19.1"
\language "english"


\header {
  title = "Moscow Nights"
  subtitle = ""
  composer = "Vasily Solovyov-Sedoy"
  country = "Russia"
  genre = "Folk"
}
\include "../../common/common-header.ily"


global = {
  \time 2/4
  \key c \minor
  \tempo 1=100
}

chordNames = \chordmode {
  \global
  
  c2:m    f2:m       g2:7    c2:m
  ef2      f4:m bf4:7  ef2      d2:7
  c2:m    c2:m       f2:m    f2:m
  c2:m    d2:m7      g2:7
}

melody = \relative c' {
  \global
  
  c8-1( ef) g( ef)
  f4 ef8( d)
  g4 f4  c4. r8
  ef8( g) bf bf
  c4 bf8( af)
  g2

  \repeat volta 2{
  a4 b4
  d8.( c16) g4\upbow( ~ g8 ef8) d c
  g'8._"-2"( f16) af4 ~
  af4 bf8^"-3" af8
  g4 f8( ef8) g4 f4
  }
  \alternative {
    {  c4 g'  }
    {  c'2 ~ c}
  }
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout {indent =0 }
  \midi { \tempo 4 = 100}
}
