\version "2.24.0"
\include "../../common/stylesheet_fiddle.ly"
\language "english"

\include "Gary-Owen_music.ily"

\header {
  title = "Gary Owen"
  subtitle = "Key: D major"
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


targetKey = d

\score {
  \new Staff \with {
    midiInstrument = "violin"
  } {
    <<
      \new ChordNames { \transpose g \targetKey \chordNames }
      \new Voice = "mel" { \transpose g \targetKey \melody }
    >>
  }
  \layout { }
  \midi { \tempo 4. = 120 }
}
