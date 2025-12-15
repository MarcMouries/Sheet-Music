\version "2.19.15"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\include "Katyusha_music.ily"

\header {
  title = "Katyusha"
  subtitle = "Катюша"
  composer = "Matvey Blanter"
  country = "Russia"
  genre = "Folk"
}

\include "../../common/common-header.ily"

\score {
  <<
    \new ChordNames \transpose e b \chordNames
    \new Staff \with { midiInstrument = "violin" } { \transpose e b \melody }
  >>
  \layout { }
  \midi { }
}
