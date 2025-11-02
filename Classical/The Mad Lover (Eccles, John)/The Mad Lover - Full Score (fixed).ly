% Auto-generated on 2025-10-21T01:59:14.032748
\version "2.24.0"

% Include the three parts
\include "The Mad Lover (Eccles, John) - Violin.ly"
\include "The Mad Lover (Eccles, John) - Alto.ly"
\include "The Mad Lover (Eccles, John) - Bass.ly"

chordsAuto = \chordmode {
  % Dotted-half per bar (3/4): one chord per measure s2. d2. s2. s2. e:52. s2. s2. s2. e:52. s2. s2. s2. e:52. s2. s2. s2. e:52. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2. s2.
  }

\paper {
  #(set-paper-size "letter")
  print-page-number = ##f
}

\layout {
  \context {
    \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
  }
}

\header {
  title = "The Mad Lover — Full Score (Eccles)"
  subtitle = "Combined Violin, Alto, Bass + Auto Chords (draft)"
}

\score {
  <<
    \new ChordNames \with { chordChanges = ##t } { \chordsAuto }
    \new StaffGroup <<
      \new Staff = "violin" \with { instrumentName = "Violin" } { \clef treble \melody }
      \new Staff = "alto" \with { instrumentName = "Alto" } { \clef treble \viola }
      \new Staff = "bass" \with { instrumentName = "Bass" } { \clef treble \bass }
    >>
  >>
  \layout { }
  \midi { }
}
