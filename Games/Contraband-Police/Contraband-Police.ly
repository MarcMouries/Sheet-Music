\version "2.24.1"
\language "english"

\header {
  title = "Contraband Police"
  composer = "Lukasz Kapuscinski"
  country = "Poland"
  subtitle = "Official Gameplay Trailer Police"
  style = "soundtrack"
}

global = {
  \time 3/4
  \key g \major
  \tempo 4=100
  \set Timing.beamExceptions = #'()

}

chordNames = \chordmode {
  \global
}

melody = \relative c'' {
  \global
  b8 c   b8 a   g8 fs
  e4 ef b
  e2    r4
  r4 r4 r4
  \break
  r4 r4 r4
  r4 r4 r4
  b'2. ~ b2 as8 b
  \break
  
   d4  c4.\mordent b8 a4
  g \tuplet 3/2 {fs8 g fs}
  e4. fs8 g b
  g'2. ~
  \break
  g4
 \acciaccatura {fs16 g} fs4. e8
  ds4 e fs
  e4\mordent r4 e8 fs8
  d4 d4 d8 e
  \break
  c4 c4 c8 d
  b2 a8 b
  c8 b a g fs e
  e4 ef2
  \break
  e8 fs8 g b e b-4\harmonic
  r4 r r
  r4 r r
  r4 r r
  \break

}


\score {
  <<
    \new ChordNames \chordNames
    \new FretBoards \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
