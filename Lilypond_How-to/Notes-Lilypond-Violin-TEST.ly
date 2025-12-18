\version "2.24.0"

\header {
  title = "Test Solutions for Label Alignment"
}

melody = {
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  g1 d' a' e''
  \bar "|."
}

% ========================================
% SOLUTION 1: First lyric has label prepended
% ========================================
noteNamesWithLabel = \lyricmode {
  \markup \bold "Note names:" G D A E
}

lilypondNotationWithLabel = \lyricmode {
  \markup \bold "LilyPond:" g d' a' "e''"
}

\markup \vspace #2
\markup \bold \fontsize #2 "SOLUTION 1: Prepend label to first syllable"
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
% SOLUTION 2: Use negative X-offset on StanzaNumber
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "SOLUTION 2: StanzaNumber with negative offset and zero width"
\markup \vspace #1

noteNames = \lyricmode {
  G D A E
}

lilypondNotation = \lyricmode {
  g d' a' "e''"
}

\score {
  <<
    \new Staff {
      \clef treble
      \melody
    }
    \new Lyrics \with {
      \override LyricText.self-alignment-X = #CENTER
      \override StanzaNumber.X-offset = #-8
      \override StanzaNumber.extra-spacing-width = #'(0 . 0)
    } \lyricsto "" {
      \set stanza = "Note names:"
      \noteNames
    }
    \new Lyrics \with {
      \override LyricText.font-family = #'typewriter
      \override LyricText.self-alignment-X = #CENTER
      \override StanzaNumber.X-offset = #-8
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
% SOLUTION 3: Table markup with embedded score
% ========================================
\markup \vspace #2
\markup \bold \fontsize #2 "SOLUTION 3: Complete markup table"
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
