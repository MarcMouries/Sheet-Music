\version "2.19.7"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\include "Polyushko-Pole_music.ily"

\header {
  title = "Polyushko-polye"
  subtitle = "Plaine, ma plaine (French) - The Cossack Patrol (English)"
  composer = "Lev Knipper (1898-1974)"
  arranger = "Composed in 1934"
  country = "Russia"
  genre = "Folk"
}

\include "../../common/common-header.ily"

\score {
  <<
    \new ChordNames \transpose g c \chordNames
    \new Staff \with { midiInstrument = "violin" } { \transpose g c \melody }
  >>
  \layout { }
  \midi { }
}
