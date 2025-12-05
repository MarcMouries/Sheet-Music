\version "2.24.4"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\include "Chosen_Kalle_Mazel_Tov_music.ily"

\header {
  title = "Chosen Kalle Mazel Tov"
  subtitle = "Key: A minor"
  instrument = "Violin"
  composer = "Traditional"
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
      \new ChordNames { \transpose g a { \chordNames } }
      \new Voice = "mel" { \transpose g a { \melody } }
      \addlyrics { \words }
    >>
  }
  \layout { }
  \midi { \tempo 4 = 120 }
}
