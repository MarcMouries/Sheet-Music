\version "2.24.0"
\language "english"

\layout {
  indent=0
}
\header {
  title = "Paddy Fahey's Jig"
  style = "jig"
}



global = {
  \time 6/8
  \key d \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  g2.:m  f2.   g2.:m  f2.
  g2.:m  f2.   g2.:m  f4. g4.
}

melody = \relative c' {
  \global

  \repeat volta 2 {
    d8 g a bf4_"/" c8
    c8\mordent bf c d4 g8
    g8\mordent f d bf c d
    c a g f d c
    \break
    d8 g a bf4_"/" c8
    c8\mordent bf c d4 g8
    g8\mordent f d bf c d
  }
  \alternative {
    {  c 8  a f   g4_"/" f8 }
    {
      c'8  a f   g8 bf d
    }
  }
  \break
  \repeat volta 2 {
    g4. f8 g a
    g8 f d bf c d
    bf8 c a8 f'4.
    a8 g f d e f
    \break
    g4 a8 bf a g
    f8 d g f d c
    a8 bf g a8 d c
  }
  \alternative {
    {  a 8  g f   g bf d}
    {  a 8  g g   g bf d }
  }
  \break
  g  d8 d f d d

  g d d bf c d
  bf c a  f'4 a8
  a g f d e f
  g4 a8 bf a g

  \break
  f d g f d c
  a bf g a d c
  a g f fs \glissando g g
  d g g bf g g
  \break
  c g g d' g, g
  g' d d bf g g
  c g g f c c
  d g g bf g g
  \break
  c g c d f a
  g f d bf c d
  c a f g4 g8
  d g a a \glissando bf c
  \break
  c bf c d4 g8
  g f d a \glissando  bf4
  c8 a g e4 \glissando f8
  d g a a bf d
  \break
  c bf c d4 g8
  g f d bf c d
  c a f g a16( bf c d)
  g4. f
  g8 f g bf,4.

  \bar "||"
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}