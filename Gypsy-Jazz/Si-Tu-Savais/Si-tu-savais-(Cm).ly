\version "2.19.17"
\language "english"

\header {
  title = "Si Tu Savais"
  composer = "Django Reinhardt"
  country = "France"
  genre = "Jazz"

  subgenre = "Gypsy Jazz"
}

\include "../../common/common-header.ily"

global = {
  \time 4/4
  \key b \minor
  \tempo 4=100
}

chordNames = \chordmode {
  b2:m fs2:7   b2:m g2:7
  b2:m a2:7   d2 fs2:7

}

melody = \relative c'' {
  \global
 b8 cs d a' ~ a4. g8
 fs8 d b f'8 ~ f4 r4
  r8 b,8 cs d  cs'4. b8
  a8 b a g ~ g2
}


\score {
  <<
    \new ChordNames {\chordNames}
    \new Staff       { \melody }
  >>
  \layout { }
}

