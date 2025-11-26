\version "2.19.54"

\header {
  title = "Color Purple"
  subtitle = "from The Color Purple (1985)"
  composer = "Quincy Jones"
  arranger = "transcription by Maxence Mouriès"
  style = "soundtrack"
  tagline = ""
}

\paper {
  #(set-paper-size "letter")
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f

  % Custom title formatting - pulls from header fields above
  bookTitleMarkup = \markup {
    \fill-line {
      \fontsize #-5
      \column {
        \line { "Transcription" }
        \line { "by Maxence Mouriès" }
      }
      \center-column {
        \fontsize #1 \fromproperty #'header:title
        \fontsize #-5 "As played by Itzhak Perlman"
      }
      \fontsize #-5
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
