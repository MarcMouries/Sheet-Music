\version "2.19.54"

\header {
  title = "Color Purple"
  subtitle = "from The Color Purple (1985)"
  composer = "Quincy Jones"
  country = "USA"
  arranger = "Transcription by Maxence Mouriès"
  notes = "As played by Itzhak Perlman"
  style = "soundtrack"
}

\include "common/common-header.ily"

\paper {
  indent = 10\mm

  % Custom title formatting - pulls from header fields above
  bookTitleMarkup = \markup {
    \override #'(font-name . "Helvetica Neue")
    \fill-line {
      \fontsize #-2
      \column {
        \line { \fromproperty #'header:notes }
        \line { "" }
      }
      \center-column {
        \fontsize #2 \bold \fromproperty #'header:title
        \fontsize #-2 \fromproperty #'header:subtitle
      }
      \fontsize #-2
      \column {
        \fromproperty #'header:composer
        \line { "arr. " \fromproperty #'header:arranger }
      }
    }
  }
}

\score {
  \new Staff {
    \relative c' {
      \key a \major
      \time 6/8
      c4 d8 e4 f8
      g4 a8 b4 c8
      c2.
    }
  }
}
\pageBreak

\score {
  \new Staff {
    \relative c' {
      \key a \major
      \time 6/8
      c4 d8 e4 f8
      g4 a8 b4 c8
      c2.
    }
  }
}
