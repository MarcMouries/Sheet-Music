\version "2.24.0"

\header {
  title = "Lilypond & Violin - Alignment Comparison"
  subtitle = "Different techniques for showing note names and LilyPond notation"
}

\paper {
  left-margin = 35\mm
}

melody = {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g1 d' a' e''
  \bar "|."
}

% ========================================
% METHOD 1: Using Lyrics with Stanza Labels
% ========================================
noteNames = \lyricmode {
  G D A E
}

lilypondNotation = \lyricmode {
  g d' a' "e''"
}

\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 1: Using instrumentName on Lyrics contexts (BEST)"
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
      \override InstrumentName.X-offset = #2
      instrumentName = \markup \line { \pad-to-box #'(0 . 11) #'(0 . 0) \right-align \bold "Note names:" }
      shortInstrumentName = \markup \bold "Note:"
    } \lyricsto "" {
      \noteNames
    }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
      \override LyricText.self-alignment-X = #CENTER
      \consists "Instrument_name_engraver"
      \override InstrumentName.X-offset = #2
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
% METHOD 2: Using Markup Attached to Notes
% ========================================
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

\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 2: Using Markup Attached to Notes"
\markup \vspace #1

\score {
  \new Staff \with {
    instrumentName = "Violin"
  } {
    \clef treble
    \melodyWithMarkup
  }
  \layout {
    indent = 2\cm
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

\markup {
  \vspace #0.5
  \italic "Note: Markup is directly attached to each note. No separate labels possible with this method."
}

% ========================================
% METHOD 3: Using Simple \addlyrics with Labels
% ========================================
melodyForLyrics = {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g1 d' a' e''
  \bar "|."
}

noteNamesAligned = \lyricmode {
  G D A E
}

lilypondNotationAligned = \lyricmode {
  g "d'" "a'" "e''"
}

\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 3: Using Simple \\addlyrics with Stanza Labels"
\markup \vspace #1

\score {
  <<
    \new Staff \with {
      instrumentName = "Violin"
    } {
      \clef treble
      \melodyForLyrics
    }
    \new Lyrics \lyricsto "" {
      \set stanza = "Note names:"
      \noteNamesAligned
    }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
    } \lyricsto "" {
      \set stanza = "LilyPond:"
      \lilypondNotationAligned
    }
  >>
  \layout {
    indent = 2\cm
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
% METHOD 4: Using Stacked Markup Below Staff with Labels
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "METHOD 4: Using Stacked Markup Below Staff with Labels"
\markup \vspace #1

\score {
  \new Staff \with {
    instrumentName = "Violin"
  } {
    \clef treble
    \melody
  }
  \layout {
    indent = 2\cm
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

\markup {
  \vspace #0.5
  \column {
    \line {
      \bold "Note names:"
      \hspace #1
      G
      \hspace #5.5
      D
      \hspace #5.5
      A
      \hspace #5.5
      E
    }
    \line {
      \bold "LilyPond:   "
      \hspace #1
      \typewriter "g"
      \hspace #5
      \typewriter "d'"
      \hspace #4.5
      \typewriter "a'"
      \hspace #4.5
      \typewriter "e''"
    }
  }
}

\markup {
  \vspace #0.5
  \italic "Note: Manual spacing with \\hspace - alignment depends on font metrics and may not be pixel-perfect."
}
