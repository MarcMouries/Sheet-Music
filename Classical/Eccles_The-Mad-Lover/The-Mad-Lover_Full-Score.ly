\version "2.24.0"
\language "english"

% Set flag to prevent included parts from generating their own scores
#(ly:set-option 'included-as-part #t)

% Include the three part files (music definitions only)
\include "The-Mad-Lover_Violin_Part.ly"
\include "The-Mad-Lover_Viola_Part.ly"
\include "The-Mad-Lover_Bass_Part.ly"


\layout {
  \context {
    \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
  }
}

\header {
  title = "The Mad Lover"
  subtitle = "5. Air - Full Score"
  composer = "John Eccles (1668-1735)"
  country = "England"
  genre = "Classical"
}

\include "../../common/common-header.ily"

\score {
  <<
    \new ChordNames \with { chordChanges = ##t } { \chordNames }
    \new StaffGroup <<
      \new Staff = "violin" \with { instrumentName = "Violin" } { \clef treble \melody }
      \new Staff = "viola" \with { instrumentName = "Viola" } { \clef alto \viola }
      \new Staff = "bass" \with { instrumentName = "Bass" } { \clef bass \bass }
    >>
  >>
  \layout { }
  \midi { }
}
