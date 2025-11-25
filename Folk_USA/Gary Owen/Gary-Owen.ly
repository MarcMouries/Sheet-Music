\version "2.19"
\language "english"

\header {
  title = "Gary Owen"
  composer = "Traditional Irish"
  style = "jig"
  tagline = ""
}

global = {
  \time 6/8
}

chordNames = \chordmode {
  \global
  \partial 8 r8
  g
}


melody = \relative c''' {
  \global
  \repeat volta 2 {
  \partial 8
  g16 fs 
  e8 d c   b a g
  b8. c16 b8 b4 g'16 fs     
  e8 d c   b a g
  a8. b16 a8 a4  g'16 fs
  \break
  e8 d c   b a g

  g'4 a8 b4 a8 g8
  fs e d e g  b,4 a8 a4
  }
  \break
    \repeat volta 2 {

b16 c
  d4 b8 d4 b8 
  d4 b8 d8 g fs 
  e4 c8 e4 c8
  e4 c8 e4 fs8
  \break
  g4 a8 b4 a8
  g8 fs e8 d4 b8
  d8 e fs  g8 d b
  a8. b16 a8 a4.
    }
}


\score {
  <<
    \new ChordNames  {\chordNames}
    \new Staff       { \melody }
  >>
  \layout { }
  %\midi { }
}
\score {
  <<
    \new ChordNames  {\transpose g a \chordNames}
    \new Staff       {\transpose g a \melody }
  >>
  \layout { }
  %\midi { }
}

\score {
  <<
    \new ChordNames  {\transpose g bf \chordNames}
    \new Staff       {\transpose g bf \melody }
  >>
  \layout { }
  %\midi { }
}
\score {
  <<
    \new ChordNames  {\transpose g d \chordNames}
    \new Staff       {\transpose g d \melody }
  >>
  \layout { }
  %\midi { }
}