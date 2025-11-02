\version "2.24.4"
\language "english"

\header {
  title = "Can she excuse my wrongs"
  composer = "John Dowland"
}

global = {
  \time 3/2
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1
  
}

melody = \relative c'' {
  \global
  d,2 a' d c2. b4 a2 a2 g2 f2 f1.
  c'2 a4 bf2 g4 a1 f2 g e e d1.
  
}

words = \lyricmode {
  Can she ex -- cuse my wrongs with vir -- tues cloak?
  Shall I call her good when she proves un  kind?
  
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
