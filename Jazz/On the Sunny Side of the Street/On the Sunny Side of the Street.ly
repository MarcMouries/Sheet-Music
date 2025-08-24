% lilypond
\version "2.24.4"

\header {
  title = "SUITE I."
  composer = "J. S. Bach."
}

melody = \relative c' {
  \clef treble
  \key c \major
  \time 4/4

  a4 b c d
}

lyricsText = \lyricmode {
  Aaa Bee Cee Dee
}

harmonies = \chordmode {
  a2 c
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Voice = "one" { \autoBeamOff \melody }
    \new Lyrics \lyricsto "one" \lyricsText
  >>
  \layout { }
  \midi { }
}