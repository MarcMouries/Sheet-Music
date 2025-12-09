\version "2.24.0"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\include "Gary-Owen_music.ily"

\header {
  title = "Gary Owen"
  subtitle = "Key: A major"
  instrument = "Violin"
  composer = "Traditional Irish"
  country = "Ireland"
  genre = "Folk"

  subgenre = "Irish"
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
      \new ChordNames { \transpose g a \chordNames }
      \new Voice = "mel" { \transpose g a \melody }
    >>
  }
  \layout { }
  \midi { \tempo 4. = 120 }
}
