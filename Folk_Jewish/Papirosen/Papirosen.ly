\version "2.24.0"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\header {
  title = "Papirosen"
  instrument = "Violin"
    style = "klezmer"
  tagline = ##f  % Remove default LilyPond tagline
}

\paper {
  #(set-paper-size "letter")
}

global = {
  \key c \minor
  \time 4/4
  \tempo 4=126
}

melody = \relative c'' {
  \global
  r2 r8 g c d
  \repeat volta 2 {
    ef4. d8 ef d c b c4 g2.
    c8 b c df c bf af g g( af) f2.
    f8 g g d' d c c b
    b af af g g f f ef
    ef f f ef g f ef d
  }
  \alternative {
    {ef8  g4. ~ 8 8 c d}
    {ef,8 c8 ~ c2  r4}
  }
  \break
  r2. r8 c8
  c8 ef ef g g c c d
  ef8 ef d c g2
  ef'8 d d c c bf bf af
  af8 g g f f4. f8
  f8 g g d' d c c b
  b af af g g f f ef
  ef f f ef g f ef d
  ef2. r4
}

\markup "C minor"

\score {
  \new Staff \with {
    midiInstrument = "violin"
  } \melody
  \layout { }
  \midi { }
}

\markup "D minor"

\score {
  <<
    % \new ChordNames { \transpose e c \chordNames}
    \new Staff      { \transpose c d \melody }
  >>
  \layout {indent=0 }
  % \midi { }
}

\markup "G minor"

\score {
  <<
    % \new ChordNames { \transpose c b \chordNames}
    \new Staff      { \transpose c g, \melody }
  >>
  \layout {indent=0 }
  % \midi { }
}