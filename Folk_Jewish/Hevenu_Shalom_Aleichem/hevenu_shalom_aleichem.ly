\version "2.19.11"
\include "../../stylesheets/stylesheet_fiddle.ly"
\include "english.ly"

% This file is the PREVIEW WRAPPER for editing
% MASTER FILE for music content: hevenu_shalom_aleichem_music.ily
% Edit the .ily file to change the melody/chords

\include "hevenu_shalom_aleichem_music.ily"

\header {
  title = "הבאנו שלום עליכם"
  subtitle = "HEVENU SHALOM ALEICHEM"
  composer = "chant juif, XIX"
  country = "Jewish"
  video = ""
  style = "klezmer"
}


\markup { "Do mineur"}

\score {

  <<
    \new ChordNames \transpose d c \chordNames
    \new Staff { \transpose d c \melody }
    \addlyrics { \words }
  >>
  \layout {   }

  
  
%  \midi { }
}


\markup { "Do # mineur"}
\score {
  <<
    \new ChordNames \transpose d cs \chordNames
    \new Staff { \transpose d cs  \melody }
    \addlyrics { \words }
  >>
  \layout { }
%  \midi { }
}



\markup { "Re mineur"}
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { }
%  \midi { }
}
