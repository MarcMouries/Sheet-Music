\version "2.24.0"

\header {
  title = "Comprehensive Test: All Alignment Methods"
  subtitle = "Finding the perfect solution for label + lyrics alignment"
}

\paper {
  left-margin = 25\mm
}

melody = {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g1 d' a' e''
  \bar "|."
}

noteNames = \lyricmode {
  G D A E
}

lilypondNotation = \lyricmode {
  g d' a' "e''"
}

% ========================================
% METHOD 1: StanzaNumber with X-offset (FAILED - overlaps)
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 1: StanzaNumber with X-offset (CURRENT - FAILED)"
\markup \italic "Problem: Labels overlap with first note letter regardless of X-offset value"
\markup \vspace #1

\score {
  <<
    \new Staff {
      \clef treble
      \melody
    }
    \new Lyrics \with {
      \override LyricText.self-alignment-X = #CENTER
      \override StanzaNumber.X-offset = #-14
      \override StanzaNumber.extra-spacing-width = #'(0 . 0)
    } \lyricsto "" {
      \set stanza = "Note names:"
      \noteNames
    }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
      \override LyricText.self-alignment-X = #CENTER
      \override StanzaNumber.X-offset = #-13
      \override StanzaNumber.extra-spacing-width = #'(0 . 0)
    } \lyricsto "" {
      \set stanza = "LilyPond:"
      \lilypondNotation
    }
  >>
  \layout {
    indent = 0
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
    \context {
      \Lyrics
      \override StanzaNumber.font-series = #'bold
    }
  }
}

% ========================================
% METHOD 2: Using instrumentName on Lyrics contexts (NEW APPROACH)
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 2: Using instrumentName on Lyrics contexts (NEW)"
\markup \italic "Approach: Give each Lyrics context an instrumentName for left-side labels"
\markup \vspace #1

\score {
  <<
    \new Staff {
      \clef treble
      \melody
    }
    \new Lyrics \with {
      \override LyricText.self-alignment-X = #CENTER
      \consists "Instrument_name_engraver"
      instrumentName = \markup \line { \pad-to-box #'(0 . 11) #'(0 . 0) \right-align \bold "Note names:" }
      shortInstrumentName = \markup \bold "Note:"
    } \lyricsto "" {
      \noteNames
    }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
      \override LyricText.self-alignment-X = #CENTER
      \consists "Instrument_name_engraver"
      instrumentName = \markup \line { \pad-to-box #'(0 . 11) #'(0 . 0) \right-align \bold "LilyPond:" }
      shortInstrumentName = \markup \bold "Lily:"
    } \lyricsto "" {
      \lilypondNotation
    }
  >>
  \layout {
    indent = 15\mm
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

% ========================================
% METHOD 3: Markup with absolute positioning (NEW APPROACH)
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 3: Markup table with overlay positioning (NEW)"
\markup \italic "Approach: Score with lyrics, then overlay markup labels at exact positions"
\markup \vspace #1

\score {
  <<
    \new Staff {
      \clef treble
      \melody
    }
    \new Lyrics \with {
      \override LyricText.self-alignment-X = #CENTER
    } \lyricsto "" {
      \noteNames
    }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
      \override LyricText.self-alignment-X = #CENTER
    } \lyricsto "" {
      \lilypondNotation
    }
  >>
  \layout {
    indent = 0
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

\markup {
  \vspace #-4.5
  \column {
    \line { \bold "Note names:" }
    \vspace #1.8
    \line { \bold "LilyPond:" }
  }
}

% ========================================
% METHOD 4: Prepend label to first syllable (from TEST file)
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 4: Prepend label to first syllable"
\markup \italic "Problem: Label is part of lyrics, pushes first note right"
\markup \vspace #1

noteNamesWithLabel = \lyricmode {
  \markup \bold "Note names:" G D A E
}

lilypondNotationWithLabel = \lyricmode {
  \markup \bold "LilyPond:" g d' a' "e''"
}

\score {
  <<
    \new Staff {
      \clef treble
      \melody
    }
    \new Lyrics \with {
      \override LyricText.self-alignment-X = #CENTER
    } \lyricsto "" {
      \noteNamesWithLabel
    }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
      \override LyricText.self-alignment-X = #CENTER
    } \lyricsto "" {
      \lilypondNotationWithLabel
    }
  >>
  \layout {
    indent = 0
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

% ========================================
% METHOD 5: Using with-dimensions for zero-width labels (NEW APPROACH)
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 5: Using with-dimensions for truly zero-width labels (NEW)"
\markup \italic "Approach: Make stanza label truly invisible to spacing system"
\markup \vspace #1

\score {
  <<
    \new Staff {
      \clef treble
      \melody
    }
    \new Lyrics \with {
      \override LyricText.self-alignment-X = #CENTER
      \override StanzaNumber.X-offset = #-14
      \override StanzaNumber.font-series = #'bold
    } \lyricsto "" {
      \set stanza = \markup \with-dimensions #'(0 . 0) #'(0 . 0) \bold "Note names:"
      \noteNames
    }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
      \override LyricText.self-alignment-X = #CENTER
      \override StanzaNumber.X-offset = #-13
      \override StanzaNumber.font-series = #'bold
    } \lyricsto "" {
      \set stanza = \markup \with-dimensions #'(0 . 0) #'(0 . 0) \bold "LilyPond:"
      \lilypondNotation
    }
  >>
  \layout {
    indent = 0
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

% ========================================
% METHOD 6: Markup attached to notes (from COMPARISON file)
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 6: Markup attached to each note"
\markup \italic "Problem: Requires attaching markup to every note, no separate labels"
\markup \vspace #1

melodyWithMarkup = {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override TextScript.staff-padding = #6
  g1
  -\markup \column {
    \line { G }
    \line { \typewriter "g" }
  }
  d'
  -\markup \column {
    \line { D }
    \line { \typewriter "d'" }
  }
  a'
  -\markup \column {
    \line { A }
    \line { \typewriter "a'" }
  }
  e''
  -\markup \column {
    \line { E }
    \line { \typewriter "e''" }
  }
  \bar "|."
}

\score {
  \new Staff {
    \clef treble
    \melodyWithMarkup
  }
  \layout {
    indent = 0
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

% ========================================
% METHOD 7: Score inside markup with separate label lines (NEW APPROACH)
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 7: Embedded score with independent label columns (NEW)"
\markup \italic "Approach: Everything is markup - complete control over positioning"
\markup \vspace #1

\markup {
  \column {
    \score {
      \new Staff \with {
        \remove "Time_signature_engraver"
      } {
        \override Score.BarNumber.break-visibility = ##(#f #f #f)
        \clef treble
        g1 d' a' e''
        \bar "|."
      }
      \layout {
        indent = 0
        line-width = 16\cm
      }
    }
    \vspace #0.5
    \line {
      \bold "Note names:"
      \hspace #1
      G
      \hspace #6
      D
      \hspace #6
      A
      \hspace #6
      E
    }
    \line {
      \bold "LilyPond:   "
      \hspace #1
      \typewriter "g"
      \hspace #5.5
      \typewriter "d'"
      \hspace #5
      \typewriter "a'"
      \hspace #5
      \typewriter "e''"
    }
  }
}

% ========================================
% METHOD 8: Using RehearsalMark for labels (NEW APPROACH)
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 8: Using RehearsalMark for left-aligned labels (NEW)"
\markup \italic "Approach: Use rehearsal marks with different Y-offsets for each label"
\markup \vspace #1

melodyWithMarks = {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-invisible
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.outside-staff-priority = ##f
  \once \override Score.RehearsalMark.Y-offset = #-6
  \once \override Score.RehearsalMark.X-offset = #-15
  \mark \markup \bold "Note names:"
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-invisible
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.outside-staff-priority = ##f
  \once \override Score.RehearsalMark.Y-offset = #-8
  \once \override Score.RehearsalMark.X-offset = #-15
  \mark \markup \bold "LilyPond:"
  g1 d' a' e''
  \bar "|."
}

\score {
  <<
    \new Staff {
      \clef treble
      \melodyWithMarks
    }
    \new Lyrics \with {
      \override LyricText.self-alignment-X = #CENTER
    } \lyricsto "" {
      \noteNames
    }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
      \override LyricText.self-alignment-X = #CENTER
    } \lyricsto "" {
      \lilypondNotation
    }
  >>
  \layout {
    indent = 0
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

% ========================================
% METHOD 9: Using extra-offset instead of X-offset (NEW APPROACH)
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 9: Using extra-offset for absolute positioning (NEW)"
\markup \italic "Approach: extra-offset uses absolute positioning, not relative"
\markup \vspace #1

\score {
  <<
    \new Staff {
      \clef treble
      \melody
    }
    \new Lyrics \with {
      \override LyricText.self-alignment-X = #CENTER
      \override StanzaNumber.extra-offset = #'(-14 . 0)
      \override StanzaNumber.font-series = #'bold
    } \lyricsto "" {
      \set stanza = "Note names:"
      \noteNames
    }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
      \override LyricText.self-alignment-X = #CENTER
      \override StanzaNumber.extra-offset = #'(-13 . 0)
      \override StanzaNumber.font-series = #'bold
    } \lyricsto "" {
      \set stanza = "LilyPond:"
      \lilypondNotation
    }
  >>
  \layout {
    indent = 0
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

\markup {
  \vspace #2
  \bold "EVALUATION SUMMARY:"
  \vspace #0.5
  \italic "After compiling, compare all methods to find which achieves:"
  \vspace #0.3
  \column {
    \line { "1. Perfect alignment: G, D, A, E under their staff notes" }
    \line { "2. Perfect alignment: g, d', a', e'' under their staff notes" }
    \line { "3. Labels 'Note names:' and 'LilyPond:' on the LEFT without overlap" }
    \line { "4. NO whitespace before first G note on staff" }
    \line { "5. Professional, clean appearance" }
  }
}
