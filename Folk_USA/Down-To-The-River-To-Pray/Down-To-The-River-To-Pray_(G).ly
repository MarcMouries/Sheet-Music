\version "2.24.0"
\language "english"

\include "Down-To-The-River-To-Pray_music.ily"

\header {
  title = "Down To The River To Pray"
  composer = "Traditional American"
  country = "USA"
  genre = "Folk"
  style = "spiritual"
}

\include "../../common/common-header.ily"

\score {
  <<
    \new ChordNames \transpose e g \chordNames
    \new Staff \with { midiInstrument = "violin" } { \transpose e g \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
