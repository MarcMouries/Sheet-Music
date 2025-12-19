\version "2.19.54"
\include "../../common/stylesheet_fiddle.ly"
\language "english"

\include "Numi-numi-Hebrew-Lullaby_music.ily"

\header {
  title = "Numi numi - Hebrew Lullaby"
  subtitle = "Key: B minor"
  instrument = "Violin"
  composer = "Traditional Hebrew"
  country = "Jewish"
  style = "lullaby"
}

\include "../../common/common-header.ily"

\paper {
  #(set-paper-size "letter")
}


targetKey = b

\score {
  \new Staff \with {
    midiInstrument = "violin"
  } {
    <<
      \new ChordNames \chordNames
      \new Voice = "mel" { \transpose d \targetKey \melody }
      \addlyrics { \words }
    >>
  }
  \layout { indent=0 }
  \midi { }
}
