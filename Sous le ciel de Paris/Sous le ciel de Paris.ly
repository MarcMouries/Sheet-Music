\version "2.19.35"
\language "english"

\header {
  title = "Sous le ciel de Paris"
}

global = {
  \time 3/4
  \key a \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  R2. a2.:m a2.:m a2.:m a2.:m d2.:m7 d2.:m7

}

melody = \relative c' {
  \global
  R2. e4 a b c2 d4 e d c b  a g f2.
    e'2.( d2.) ~ d2.

  e,4 gs a b2 c4
  d4 f e d c b a2. ~ 2. ~2. ~ 4 r r
\break
  b4 c b a2. 2. 2.
  b4 c b a2. 2. 2.
  b4 c b a2 b4 c2 d4
  e4 f g f e d e2. ~ 2. ~2. ~ 4 r r
}

words = \lyricmode {
 Sous le ciel de Pa -- ris s'en -- vole u -- ne chan -- son  hum
Elle est née d'au -- jour -- d'hui dans le coeur d'un gar -- çon
Sous le pont de Ber -- cy
Un phi -- lo -- sophe as -- sis
Deux mu -- si -- ciens
Quel -- ques ba -- dauds
Puis les gens par mil -- liers
}


\relative c'' {
  \time 3/4
\repeat volta 2 {
  e\downbow
  \tuplet 3/2 {d8 e d }
  \tuplet 3/2 {c8 d c }
  \tuplet 3/2 {b8 c b }
  \tuplet 3/2 {a8 b a }
  \tuplet 3/2 {g8 a g }
  \tuplet 3/2 {f8 g f }
  \tuplet 3/2 {g8 a g }
  \tuplet 3/2 {a8 b a }
  \tuplet 3/2 {b8 c b }
  \tuplet 3/2 {c8 d c }
  \tuplet 3/2 {d8 e d }
}
}

violin = \relative c' {
  \global
  R2. e4 a b c2( d4) e\downbow
  \stemDown
  \tuplet 3/2 {d8 ( e d }
  \tuplet 3/2 {c8 d c }
  \tuplet 3/2 {b8 c b }
  \tuplet 3/2 {a8 b a }
  \tuplet 3/2 {g8 a g) }
  f2.\downbow
    e'2. d2. ~ d2 b8 a
\break
  e4 gs a b2 c4
  d4 f e d c b a2. ~ 2. ~2. ~ 4 r r
\break
  b4 c b a2. 2. 2.
  b4 c b a2. 2. 2.
\break
  b4 c b a2 b4 c2 d4
  e4 f g f e d e2. ~ 2. ~2. ~ 4 r r
}

pentaD = \relative a {
  a   d   e  fs
  a   b   d  e
  fs  e   d  b
  a   fs  e  d
}
\score {    \new Staff { \pentaD }
  \layout {indent = 0 }
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \violin }
  >>
  \layout {indent = 0 }
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
