\version "2.19.83"
\language "english"

\header {
  title = "Chicago"
  subtitle = "Grappelli"
  composer = "Fred Fisher"
  style = "gypsy jazz"
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=120
}

chordNames = \chordmode {
  \global
  c1
  
}

melody = \relative c'' {
  \global
  \partial 4
  f4 e4. d8 ~ d4 f4
  e4. d8 ~ d4. a8
  bf8 a g c ~ c8 c4.
  bf8 a g c8 ~ c8 c8 bf4
  
  \break
  
  a4. g8 ~ g4 bf4
  a4. g8 ~ g4 e4
  f8 e d  f ~ f2
r8 a4. a8 g4.   
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { indent=0}
  \midi { }
}
