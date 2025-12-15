\version "2.19.15"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\include "Tsiganisky_music.ily"

\header {
  title = "Tsiganisky"
  composer = "Traditional Russian"
  country = "Russia"
  genre = "Folk"
}

\include "../../common/common-header.ily"

\score {
  <<
    \new ChordNames \transpose g a \chordNames
    \new Staff \with { midiInstrument = "violin" } { \transpose g a \melody }
  >>
  \layout { }
  \midi { }
}
