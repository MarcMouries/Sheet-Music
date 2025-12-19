\version "2.19.15"
\include "../../common/stylesheet_fiddle.ly"
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


targetKey = a

\score {
  <<
    \new ChordNames \transpose e \targetKey \chordNames
    \new Staff \with { midiInstrument = "violin" } { \transpose e \targetKey \melody }
  >>
  \layout { }
  \midi { }
}
