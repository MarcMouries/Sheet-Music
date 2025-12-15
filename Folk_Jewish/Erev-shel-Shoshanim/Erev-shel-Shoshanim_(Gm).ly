\version "2.24.4"
\language "english"

\include "Erev-shel-Shoshanim_music.ily"

\header {
  title = "Erev shel Shoshanim"
  subtitle = "Key: G minor"
  composer = "Yosef Hadar"
  country = "Jewish"
  poet = "Moshe Dor"
  genre = "Folk"

  subgenre = "Klezmer"
}

\include "../../common/common-header.ily"


targetKey = g

\score {
  <<
    \new ChordNames { \transpose e \targetKey \songChords }
    \new Staff <<
      \key g \minor
      \new Voice = "mel" { \transpose e \targetKey \songMelody }
      \new Lyrics \lyricsto "mel" { \set stanza = "1." \verseOne }
      \new Lyrics \lyricsto "mel" { \set stanza = "2." \verseTwo }
    >>
  >>
  \layout {
    \override Lyrics.LyricText.font-size = #-2
  }
  \midi { \tempo 4 = 120 }
}
