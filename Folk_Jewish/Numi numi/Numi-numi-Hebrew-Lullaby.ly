\version "2.19.54"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

% This file is the PREVIEW WRAPPER for editing
% MASTER FILE for music content: Numi-numi-Hebrew-Lullaby_music.ily
% Edit the .ily file to change the melody/chords

\include "Numi-numi-Hebrew-Lullaby_music.ily"

\header {
  title = "Numi numi - Hebrew Lullaby"
  composer = "Traditional Hebrew"
  country = "Jewish"
  style = "lullaby"
}

\include "../../common/common-header.ily"


targetKey = c

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout {indent=0 }
  \midi { }
}
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \transpose d \targetKey' \melody }
    \addlyrics { \words }
  >>
  \layout {indent=0 }
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \transpose d b \melody }
    \addlyrics { \words }
  >>
  \layout {indent=0 }
}
