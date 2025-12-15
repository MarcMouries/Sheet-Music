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


targetKey = a

\score {
  <<
    \new ChordNames \transpose g \targetKey \chordNames
    \new Staff \with { midiInstrument = "violin" } { \transpose g \targetKey \melody }
  >>
  \layout { }
  \midi { }
}
