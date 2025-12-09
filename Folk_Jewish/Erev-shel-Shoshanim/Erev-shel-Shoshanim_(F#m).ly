\version "2.24.4"
\language "english"

\include "Erev-shel-Shoshanim_music.ily"

\header {
  title = "Erev shel Shoshanim"
  subtitle = "Key: F# minor"
  composer = "Yosef Hadar"
  country = "Jewish"
  poet = "Moshe Dor"
  genre = "Folk"

  subgenre = "Klezmer"
}

\include "../../common/common-header.ily"

\score {
  <<
    \new ChordNames { \transpose e fs \songChords }
    \new Staff <<
      \key fs \minor
      \new Voice = "mel" { \transpose e fs \songMelody }
      \new Lyrics \lyricsto "mel" { \set stanza = "1." \verseOne }
      \new Lyrics \lyricsto "mel" { \set stanza = "2." \verseTwo }
    >>
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #-2
  }
  \midi { \tempo 4 = 120 }
}
