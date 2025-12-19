\version "2.19"
\language "english"
\header {
  title = " Les yeux noirs - Dark eyes"
  subsubtitle = "Otchi chornye - Очи чёрные"
  composer = "Trad. Russia"
  tagline = ""
}

theChords = \chordmode {
     s2.
     a2.:7 a2.:7       d2.:m  d2.:m
     a2.:7 a2.:7       bf2.   bf2.
     g2.:m g2.:m       d2.:m  d2.:m
     a2.:7 a2.:7       d2.:m  d2.:m

}

theMelody = \relative c'' {
  \key d \minor
  \time 3/4
  r4  gs4-1 a4   bf4. a8 a4
  r4  gs4 a4   bf4. a8 a4
  r4  a4-0  d4    d4. cs8 cs4
  r4  e4-2  f4    e4. d8 d4
  r4  f4  g4    f4. e8 e4
  r4  e4  f4    e4. d8 d4
  r4  gs,4 a4   bf4. a8 a4
  r4  e4  f4   d2 r4
  \break
  % one octave higher
  r4  gs'4-1 a4   bf4. a8 a4
  r4  gs4 a4   bf4. a8 a4
  r4  a4-0  d4    d4. cs8 cs4
  r4  e4-2  f4    e4. d8 d4
  r4  f4  g4    f4. e8 e4
  r4  e4  f4    e4. d8 d4
  r4  gs,4 a4   bf4. a8 a4
  r4  e4  f4   d2 r4




}


\score {
  <<
    \context ChordNames { \theChords }
    \new Staff {
      \context Voice = "voiceMelody" { \theMelody }
    }
  >>
\midi {}
\layout {indent=0}
}