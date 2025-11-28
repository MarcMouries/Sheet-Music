\version "2.24.4"
\language "english"

\header {
  title = "Siciliana"
  composer = "Matteo Carcassi"
  country = "Italy"
  opus = "Opus 59, No. 22"
  style = "classical"
}

global = {
  \time 6/8
  \key c \major
  \tempo 2.=64
}

chordNames = \chordmode {
  \global
  \skip 4
  a1.:m   d1.:m  e1.  a1.:m 
  
}

melody = \relative c'' {
  \global
  \partial 4 
    e 4  
  | e 4.  d 8  c 4   c 4. b 8 a 4
  | f'4.  e 8  d 4   d 4. c 8 b 4
  | d 4.  c 8  b 4   b 4. a 8 gs4
  | a 4.  b 8  c 4   c 2  e4
  
  
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
