\version "2.24.4"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\include "Emma_(Waltz)_music.ily"

\header {
  title    = "Emma's Waltz"
  subtitle = "Key: D minor"
  instrument = "Violin"
  composer = "Traditional Finnish"
  country = "Finland"
  style = "waltz"
}

\include "../../common/common-header.ily"

\paper {
  #(set-paper-size "letter")
}

\score {
  \new Staff \with {
    midiInstrument = "violin"
  } \emmaMelody
  \layout { }
  \midi { \tempo 4 = 120 }
}
