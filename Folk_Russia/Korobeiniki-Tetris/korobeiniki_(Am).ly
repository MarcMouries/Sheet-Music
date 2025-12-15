\version "2.19.32"
\include "../../stylesheets/stylesheet_fiddle.ly"
\include "italiano.ly"

\include "korobeiniki_music.ily"

\header {
	title = "Коробейники (Korobeiniki)"
	subtitle = "Tetris Theme"
	instrument = "Violin"
	poet = "Nikolaï Alekseïevitch Nekrassov"
	composer = "Traditional Russian"
	country = "Russia"
	arranger = ""
	style = "russian traditional"
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
      \new ChordNames { \transpose la la \chordNames }
      \new Voice = "mel" { \transpose la la \melody }
    >>
  }
  \layout { }
  \midi { \tempo 4 = 150 }
}
