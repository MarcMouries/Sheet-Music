\version "2.19.11"
\include "../../stylesheets/stylesheet_fiddle.ly"
\include "english.ly"

\include "hevenu_shalom_aleichem_music.ily"

\header {
  title = "הבאנו שלום עליכם"
  subtitle = "HEVENU SHALOM ALEICHEM - Key: C# minor"
  instrument = "Violin"
  composer = "chant juif, XIX"
  country = "Jewish"
  style = "klezmer"
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
      \new ChordNames \transpose d cs \chordNames
      \new Voice = "mel" { \transpose d cs \melody }
      \addlyrics { \words }
    >>
  }
  \layout { }
  \midi { }
}
