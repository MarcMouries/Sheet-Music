\version "2.24.4"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\include "Emma_(Waltz)_music.ily"

\header {
  title    = "Emma's Waltz"
  composer = "Traditional Finnish"
  country = "Finland"
  genre = "Folk"
}

\include "../../common/common-header.ily"

\score {
  \new Staff \with {
    midiInstrument = "violin"
  } { \transpose d e \emmaMelody }
  \layout { }
  \midi { \tempo 4 = 120 }
}
