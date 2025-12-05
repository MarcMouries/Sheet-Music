\version "2.24.0"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\include "Gary-Owen_music.ily"

\header {
  title = "Gary Owen"
  subtitle = "Key: Bb major"
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
      \new ChordNames { \transpose g bf \chordNames }
      \new Voice = "mel" { \transpose g bf \melody }
    >>
  }
  \layout { }
  \midi { \tempo 4. = 120 }
}
