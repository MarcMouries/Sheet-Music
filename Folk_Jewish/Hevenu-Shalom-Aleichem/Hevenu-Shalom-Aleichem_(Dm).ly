\version "2.19.11"
\include "../../common/stylesheet_fiddle.ly"
\include "english.ly"

\include "Hevenu-Shalom-Aleichem_music.ily"

\header {
  title = "Hevenu shalom aleichem"
  subtitle = "Hebrew: הבאנו שלום עליכם - We brought peace upon you"
  composer = "Trad. Jewish"
  country = "Jewish"
  genre = "Folk"
  subgenre = "Klezmer"
}

\include "../../common/common-header.ily"

\score {
  <<
    \new ChordNames \chordNames
    \new Staff \with { midiInstrument = "violin"  } { \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
