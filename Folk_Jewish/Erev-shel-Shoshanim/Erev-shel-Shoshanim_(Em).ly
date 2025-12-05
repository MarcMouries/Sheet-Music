\version "2.24.4"
\language "english"

\include "Erev-shel-Shoshanim_music.ily"

\header {
  title = "Erev shel Shoshanim"
  subtitle = "Key: E minor"
  composer = "Yosef Hadar"
  country = "Jewish"
  poet = "Moshe Dor"
  style = "klezmer"
}

\include "../../common/common-header.ily"

\score {
  <<
    \new ChordNames { \songChords }
    \new Staff <<
      \key e \minor
      \new Voice = "mel" { \songMelody }
      \new Lyrics \lyricsto "mel" { \set stanza = "1." \verseOne }
      \new Lyrics \lyricsto "mel" { \set stanza = "2." \verseTwo }
    >>
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #-2
  }
  \midi { \tempo 4 = 120 }
}
