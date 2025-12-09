\version "2.19.11"
\include "../../stylesheets/stylesheet_fiddle.ly"
\include "english.ly"

\include "hevenu_shalom_aleichem_music.ily"

\header {
  title = "הבאנו שלום עליכם"
  subtitle = "HEVENU SHALOM ALEICHEM - Key: D minor"
  instrument = "Violin"
  composer = "chant juif, XIX"
  country = "Jewish"
  genre = "Folk"

  subgenre = "Klezmer"
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
      \new ChordNames \chordNames
      \new Voice = "mel" \melody
      \addlyrics { \words }
    >>
  }
  \layout { }
  \midi { }
}
