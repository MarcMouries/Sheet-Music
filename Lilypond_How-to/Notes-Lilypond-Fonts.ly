\version "2.24.0"

\header {
  title = "LilyPond Font Comparison"
  subtitle = "Testing different fonts for titles and headings"
}

\paper {
  left-margin = 20\mm
  right-margin = 20\mm
}

% ========================================
% SERIF FONTS
% ========================================
\markup \vspace #2
\markup \bold \fontsize #3 "SERIF FONTS"
\markup \vspace #1

\markup {
  \column {
    \line { \bold "Georgia Bold:" }
    \vspace #0.3
    \override #'(font-name . "Georgia Bold")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Georgia Bold")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Times New Roman:" }
    \vspace #0.3
    \override #'(font-name . "Times New Roman")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Times New Roman")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Times New Roman Bold:" }
    \vspace #0.3
    \override #'(font-name . "Times New Roman Bold")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Times New Roman Bold")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Palatino:" }
    \vspace #0.3
    \override #'(font-name . "Palatino")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Palatino")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Palatino Bold:" }
    \vspace #0.3
    \override #'(font-name . "Palatino Bold")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Palatino Bold")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\pageBreak

% ========================================
% SANS-SERIF FONTS - HUMANIST
% ========================================
\markup \vspace #2
\markup \bold \fontsize #3 "SANS-SERIF FONTS - HUMANIST"
\markup \vspace #1

\markup {
  \column {
    \line { \bold "Optima:" }
    \vspace #0.3
    \override #'(font-name . "Optima")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Optima")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Optima Bold:" }
    \vspace #0.3
    \override #'(font-name . "Optima Bold")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Optima Bold")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Gill Sans:" }
    \vspace #0.3
    \override #'(font-name . "Gill Sans")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Gill Sans")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Gill Sans Bold:" }
    \vspace #0.3
    \override #'(font-name . "Gill Sans Bold")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Gill Sans Bold")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\pageBreak

% ========================================
% SANS-SERIF FONTS - GEOMETRIC/MODERN
% ========================================
\markup \vspace #2
\markup \bold \fontsize #3 "SANS-SERIF FONTS - GEOMETRIC/MODERN"
\markup \vspace #1

\markup {
  \column {
    \line { \bold "Avenir Book:" }
    \vspace #0.3
    \override #'(font-name . "Avenir Book")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Avenir Book")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Avenir Medium:" }
    \vspace #0.3
    \override #'(font-name . "Avenir Medium")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Avenir Medium")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Avenir Heavy:" }
    \vspace #0.3
    \override #'(font-name . "Avenir Heavy")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Avenir Heavy")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Futura Medium:" }
    \vspace #0.3
    \override #'(font-name . "Futura Medium")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Futura Medium")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Futura Bold:" }
    \vspace #0.3
    \override #'(font-name . "Futura Bold")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Futura Bold")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\pageBreak

% ========================================
% SANS-SERIF FONTS - GROTESQUE/NEUTRAL
% ========================================
\markup \vspace #2
\markup \bold \fontsize #3 "SANS-SERIF FONTS - GROTESQUE/NEUTRAL"
\markup \vspace #1

\markup {
  \column {
    \line { \bold "Helvetica:" }
    \vspace #0.3
    \override #'(font-name . "Helvetica")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Helvetica")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Helvetica Bold:" }
    \vspace #0.3
    \override #'(font-name . "Helvetica Bold")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Helvetica Bold")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Arial:" }
    \vspace #0.3
    \override #'(font-name . "Arial")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Arial")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Arial Bold:" }
    \vspace #0.3
    \override #'(font-name . "Arial Bold")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Arial Bold")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\pageBreak

% ========================================
% DISPLAY/DECORATIVE FONTS
% ========================================
\markup \vspace #2
\markup \bold \fontsize #3 "DISPLAY/DECORATIVE FONTS"
\markup \vspace #1

\markup {
  \column {
    \line { \bold "Didot:" }
    \vspace #0.3
    \override #'(font-name . "Didot")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Didot")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Didot Bold:" }
    \vspace #0.3
    \override #'(font-name . "Didot Bold")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Didot Bold")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Baskerville:" }
    \vspace #0.3
    \override #'(font-name . "Baskerville")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Baskerville")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Baskerville Bold:" }
    \vspace #0.3
    \override #'(font-name . "Baskerville Bold")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Baskerville Bold")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup {
  \column {
    \line { \bold "Copperplate:" }
    \vspace #0.3
    \override #'(font-name . "Copperplate")
    \override #'(font-size . 8)
    \line { "Lilypond & Violin" }
    \vspace #0.5
    \override #'(font-name . "Copperplate")
    \override #'(font-size . 2)
    \line { "Open Strings - First Position" }
  }
}

\markup \vspace #2

\markup \bold \fontsize #2 "FONT SELECTION GUIDE"
\markup \vspace #0.5
\markup {
  \column {
    \line { \italic "Serif fonts:" " Traditional, formal, classical music typography" }
    \line { \italic "Humanist sans:" " Warm, friendly, modern but approachable" }
    \line { \italic "Geometric sans:" " Clean, contemporary, minimalist" }
    \line { \italic "Grotesque sans:" " Neutral, universal, reliable" }
    \line { \italic "Display fonts:" " Elegant, distinctive, use sparingly for titles" }
  }
}
