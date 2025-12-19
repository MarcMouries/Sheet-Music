\version "2.19.64"
\include "../../common/stylesheet_fiddle.ly"
\language "english"

\header {
  title = "La Rose Jaune"
  subtitle = "As performed by Yoska Nemeth"
  composer = "Traditional Hungarian"
  country = "Hungary"
  style = "folk tune"
}

\include "../../common/common-header.ily"

global = {
  \time 4/4
  \key a \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  a1:m
}

% =======================
% Self-contained phrases
% =======================

% A: main theme
partA = \relative c'' {
  a4. gs8 a4 e4
  c'4. b8 c4 a4
  e'4 f8 e d4 b8 d
  c4 b8 gs
  a2
}

% B: contrasting phrase (also appears 8va)
partB = \relative c'' {
  g4. a8 b c d e
  f4 d b2
  e4. d8 c4 b
  c4 e b2
}

% C: later section (lower start)
partC = \relative c'' {
  a4. b8 c4 c
  c c c4. e8
  ds e f e d c b a
  b4 b b b
}

% D: later section
partD = \relative c'' {
  gs4. a8  b4 b
  b8 gs4 ~ gs8 e4. e'8
  ds e f e d c b c
  a4 r a' r
}

% Convenience: 8va versions
partAUp = \transpose c \targetKey' \partA
partBUp = \transpose c \targetKey' \partB

melody = {
  \global

  \mark \markup \box "A"
  \partA
  \break

  \mark \markup \box "A"
  \partA
  \break

  \mark \markup \box "B"
  \partB
  \break

  \mark \markup \box "A"
  \partA
  \break

  \mark \markup \box "B"
  \partB
  \break

  \mark \markup \box "A"
  \partA
  \break

  \mark \markup \box "A"
  \partA
  \break

  \mark \markup \box "B (8va)"
  \partBUp
  \break

  % <-- updated here: A now also 8va
  \mark \markup \box "A (8va)"
  \partAUp
  \break

  \mark \markup \box "C"
  \partC
  \break

  \mark \markup \box "D"
  \partD
  \break

  % Ending rests
  r4 r r r
  r4 r r r
  r4 r r r
  r4 r r r
}


targetKey = c

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { indent = 2 }
  \midi { }
}
