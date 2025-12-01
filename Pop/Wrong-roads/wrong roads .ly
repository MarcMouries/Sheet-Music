\version "2.19.83"
\language "english"

\header {
  title = "Wrong Roads"
  composer = "Steve Kroeger x Skye Holland"
  country = "USA"
  style = "pop"
}

\include "../../common/common-header.ily"

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  a1     e1     b1    cs1:m
  e1     cs1:m  e1    cs1:m
  e1     cs1:m  e1    cs1:m
  
}

melody = \relative c' {
  \global
  
  b8   cs  e   fs  fs  b  cs  e 
  gs   gs  fs  e   b   r  r4   
  r4   gs'8 fs e cs e cs 
  cs2  r2 
  \break
  r1   r   r   r
  \break
  r1   r   r   r
  
}

words = \lyricmode {
  
  
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
