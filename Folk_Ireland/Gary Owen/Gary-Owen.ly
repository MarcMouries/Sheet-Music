\version "2.24.0"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

% This file is the PREVIEW WRAPPER for editing
% MASTER FILE for music content: Gary-Owen_music.ily
% Edit the .ily file to change the melody/chords

\include "Gary-Owen_music.ily"

\header {
  title = "Gary Owen"
  composer = "Traditional Irish"
  country = "Ireland"
  style = "jig"
}

\include "../../common/common-header.ily"


\score {
  <<
    \new ChordNames  {\chordNames}
    \new Staff       { \melody }
  >>
  \layout { }
  %\midi { }
}
\score {
  <<
    \new ChordNames  {\transpose g a \chordNames}
    \new Staff       {\transpose g a \melody }
  >>
  \layout { }
  %\midi { }
}

\score {
  <<
    \new ChordNames  {\transpose g bf \chordNames}
    \new Staff       {\transpose g bf \melody }
  >>
  \layout { }
  %\midi { }
}
\score {
  <<
    \new ChordNames  {\transpose g d \chordNames}
    \new Staff       {\transpose g d \melody }
  >>
  \layout { }
  %\midi { }
}