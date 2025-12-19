\version "2.24.4"
\language "english"
\header {
  title = "Swallowtail Jig"
  subtitle = "Easy Version"
  composer = "Traditional"
  country = "Ireland"
  genre = "Folk"
  subgenre = "Irish"
  difficulty = "Beginner"
  tagline = ##f
}

\include "../../common/common-header.ily"

global = {
  \time 6/8
  \key d \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  e2.:m    e2.:m    d2.    d2.
  e2.:m    e2.:m    d2.    e2.:m
  e2.:m    e2.:m    d2.    e2.:m
  e2.:m    e2.:m    d2.    e2.:m
}

% Simplified melody - no slurs, no ornaments, straight rhythm
melody = \relative c'' {
  \global

  % Part A
  \repeat volta 2 {
    g8 e e   b' e, e |
    g8 e e   b' a g |
    fs8 d d   a' d, d |
    d'8 cs d   a g fs |
    \break
    g8 e e   b' e, e |
    g8 e e   b'4 cs8 |
    d8 cs d   a g fs |
    g8 e e   e4.
  }
  \break

  % Part B - simplified without slurs
  \repeat volta 2 {
    b'8 cs d   e4 fs8 |
    e4 fs8   e8 d b |
    b8 cs d   e4 fs8 |
    e8 d b   d4. |
    \break
    b8 cs d   e4 fs8 |
    e4 fs8   e8 d b |
    d8 cs d   a g fs |
    g8 e e   e4.
  }
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
