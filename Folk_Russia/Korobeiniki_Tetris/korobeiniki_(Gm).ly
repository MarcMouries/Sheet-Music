\version "2.19.32"
\include "../../stylesheets/stylesheet_fiddle.ly"
\include "italiano.ly"

\include "korobeiniki_music.ily"

\header {
	title = "Коробейники (Korobeiniki)"
	subtitle = "Key: Gm (Tetris Theme)"
	instrument = "Violin"
	poet = "Nikolaï Alekseïevitch Nekrassov"
	composer = "Trad. Russe"
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
      \new ChordNames { \transpose do sol \chordNames }
      \new Voice = "mel" { \transpose do sol \melody }
    >>
  }
  \layout { }
  \midi { }
}
