\version "2.24.0"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\include "Papirosen_music.ily"

\header {
  title = "Papirosen"
  subtitle = "Key: G minor"
  instrument = "Violin"
  style = "klezmer"
  composer = "Traditional"
  country = "Jewish"
}

\include "../../common/common-header.ily"

\paper {
  #(set-paper-size "letter")
}

\score {
  \new Staff \with {
    midiInstrument = "violin"
  } { \transpose c g, \melody }
  \layout { }
  \midi { }
}
