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

\score {
  <<
    \new ChordNames { \transpose d c \chordNames }
    \new Staff { \transpose d c \melody }
  >>
  \layout { }
  \midi { \tempo 4 = 96 }
}
