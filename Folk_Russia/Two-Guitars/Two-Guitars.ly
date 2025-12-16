\version "2.24.4"
\language "english"

\header {
  title = "Two Guitars"
  composer = "Trad. Russia"
  origin = "Russia"
}

\include "../../common/common-header.ily"

theChords = \chordmode {
  \time 4/4
  \key d \minor

  g1:m
  d1:m
  a1:7
  d1:m
  \bar "||"
  g1:m
  d1:m
  a1:7
  d1:m
  g1:m
  d1:m
  a1:7
  d1:m

  \repeat volta 2 {
    g1:m
    d1:m
    a1:7
    bf1
    g1:m
    d1:m
    a1:7
    d1:m
  }
}

theMelody = \relative c'' {
  \time 4/4
  \key d \minor

  r8 g8 bf8[ d8] e4 d4
  r8 f,8 a8 d8 e4 d4
  r8 g,8 a8 cs8 e4 cs4
  d8 f e d a8 f e d
  \break
    r8 g8 bf8[ d8] e4 d4
  r8 f,8 a8 d8 e8 d8 e8 d8
  r8 g,8 a8 cs8 e8 cs8 e8 cs8
  d4 f a a
  \break

  r4 c8. bf16
  c4 bf4

  r4 bf8. a16
  bf4 a4

  r4 a8. g16
  a4. g8

  g4 f4 r2
\break
  r4 f8 e8
  c'8 bf8 bf8 a8

  a2 r2

  r8 a4 a8 ~
  a4 b8 cs8

  e2 d2
\break
  \repeat volta 2 {
    r8 c4 bf8
    bf2

    r8 bf4 a8
    a2

    a4 g8 g8
    a4 g4

    g4. f8
    f2
\break
    e'4. e8
    e4 e4

    e4. d8
    d2

    d4 cs8 cs8
    b4 cs8 cs8

    d4. d8
    d4 r4
  }
}

\score {
  <<
    \context ChordNames { \theChords }
    \new Staff {
      \context Voice = "voiceMelody" { \theMelody }
    }
  >>
  \layout {}
  \midi { \tempo 4 = 120}
}
