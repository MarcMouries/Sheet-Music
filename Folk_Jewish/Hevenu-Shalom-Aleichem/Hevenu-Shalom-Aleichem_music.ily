\version "2.24.4"
\include "english.ly"


global = {
  \time 4/4
  \tempo 4=100
}

\header {
  title = "Hevenu shalom aleichem"
  subtitle = "Hebrew: הבאנו שלום עליכם - We brought peace upon you"
  instrument = "Violin"
  composer = "Trad. Jewish"
  country = "Jewish"
  genre = "Folk"
  subgenre = "Klezmer"
}

chordNames = \chordmode {
  \global
  s4.
  d2:m   a2:7   d1:m  d1:7
  g:m a2
  a:7 d1:m
  a:7
  s2 d8:m
}

melody = \relative c'' {
  \global
  \key d \minor

  \partial 4. a8 d f
  a2 f4. e8 e d4. r8 d f a
  d2 bf4. a8
  a g4. r8 g a bf
  a4. (e8) a4. g8 g
  f4. r8 e f g a4 a a a a8. g16 f8 e d
  \bar "|."
}

words = \lyricmode {
  He -- ve -- nu sha -- lom a -- lei -- chem,
  He -- ve -- nu sha -- lom a -- lei -- chem,
  He -- ve -- nu sha -- lom a -- lei -- chem,
  He -- ve -- nu sha -- lom, sha -- lom, sha -- lom, a -- lei -- chem,
}
