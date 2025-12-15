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


targetKey = a

\score {
  <<
    \new ChordNames \transpose g \targetKey \chordNames
    \new Staff \with { midiInstrument = "violin" } 
    { \transpose g \targetKey \melody }
  >>
  \layout { }
  \midi { }
}
