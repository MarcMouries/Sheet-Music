\version "2.24.0"
\language "english"

\include "../../stylesheets/stylesheet_fiddle.ly"

\header {
  title = "Darby O' Gill - Fox Chase"
  composer = "Traditional"
  country = "Ireland"
  genre = "Folk"

  subgenre = "Irish"
}

global = {
  \time 6/8
  \key c \major
  \tempo 4.=130
}

chordNames = \chordmode {
  \global
  
  
}

melody = \relative c''' {
  \global
  r4.         r8  g8 f8
  e8. d16 c8  c8  b  c
  a8  b  c    g8  b  c
  c8  b  c    g8  f  e
  \break
  f8. e16 f8  d8 g'8 f8
  e8. d16 c8  c8  b  c
  a8  b  c    g8  b  c
  c8  b  c    d,8  e  f
  \break
  e8  c  c    c8  g'' f8
  e8. d16 c8  c8  b  c
  a8  b  c    g8  b  c
  c8  b  c    g8  f  e
  \break
  f8. e16 f8  d8 g'8 f8
  e8. d16 c8  c8  b  c
  a8  b  c    g8  b  c
  c8  b  c    d,8  e  f
  \break
  e8  c  c    c4  d8
  e4  c8 f4 d8
  e4 g8   a8 b c
  g4 e8 f4 d8 
  e4 c8 d8 c bf
  \break
  e4  c8 f4 d8
  e4 g8   a8 b c
  g8 c c   d e f 
  e8 c c   c8 g f
  \break
    e4  c8 f4 d8    
  e4  g8   a8 b c
  g4 e8 f4 d8 
  e4 c8 d8 c bf
  \break  
    e4  c8 f4 d8
  e4 g8   a8 b c
  g8 c c   d e f 
  e8 c c   c8 g' f
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
