\version "2.24.0"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\include "Gary-Owen_music.ily"

\header {
  title = "Gary Owen"
  subtitle = "Key: D major"
  instrument = "Violin"
  composer = "Traditional Irish"
  country = "Ireland"
  style = "jig"
}

\include "../../common/common-header.ily"

\paper {
  #(set-paper-size "letter")
}

\score {
  \new Staff \with {
    midiInstrument = "violin"
  } {
    <<
      \new ChordNames { \transpose g d \chordNames }
      \new Voice = "mel" { \transpose g d \melody }
    >>
  }
  \layout { }
  \midi { }
}
