\version "2.24.0"
\language "english"

\include "Besame_Mucho_music.ily"

\header {
  title = "Bésame Mucho"
  subtitle = "Key: C minor"
  composer = "Consuelo Velázquez"
  country = "Mexico"
  style = "bolero"
  poet = "Consuelo Velázquez"
}

\include "../../common/common-header.ily"

\paper {
  #(set-paper-size "letter")
}


targetKey = c

\score {
  <<
    \new ChordNames { \transpose d \targetKey \chordNames }
    \new Staff { \transpose d \targetKey \melody }
  >>
  \layout { }
  \midi { \tempo 4 = 96 }
}
