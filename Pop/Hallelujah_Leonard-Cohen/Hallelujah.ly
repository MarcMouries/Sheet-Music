\version "2.19.31"

\header {
  title = "Hallelujah"
  composer = "Leonard Cohen"
}

global = {
  \time 6/8
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  \partial 8 s8
  c2. a2.:m c2. a2.:m
  f2. g2.  c2. g2.
  c2. f4.  g4.
  a2.:m f2. g2. e2.:m
  a2.:m a2.:m
}

melody = \relative c' {
  \global
  \partial 8
  e8
  g4 g8 g4 g8
  a4 a8 ~ a4
  e8
  g4 g8 g4 g8
  a8 a a ~ a4
  g8
\break
  a4 a8 ~ a a a
  a4 g8 ~g g f
  g4. g4.
  r4. r4 e8
\break
  g4 g8 g4 g8
  a4 a8 b4 b8

  c4 c8 c4 c8
  c4 c8 d4 c8
  \break
  d4 d8 d4 d8
  e4 e8 ~ 8 8 d
  d4. c4. ~
  c4. r8 e, g
\break
  a4. a4. ~ a4.
  r8 a g
  e4.  e4. ~ e4. r8 e g
  \break
  a4. a4. ~
  a4.
  r8 a g
  e2 f8 e
  d2 d8 c
  c2.
  r4. r4 e8
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
