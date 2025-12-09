\version "2.24.0"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\include "Papirosen_music.ily"

\header {
  title = "Papirosen"
  subtitle = "Key: D minor"
  instrument = "Violin"
  genre = "Folk"

  subgenre = "Klezmer"
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
  } { \transpose c d \melody }
  \layout { }
  \midi { }
}
