\version "2.19.11"

% APPROACH 1: Simple header with formatting in \paper block
\header {
  title = "The First Noël"
  composer = "18th Century French Melody"
  poet = "Traditional"
  style = "christmas carol"
  tagline = ""
}

\paper {
  % Define how to format the title using the simple string from header
  bookTitleMarkup = \markup {
    \column {
      \fill-line {
        \override #'(font-name . "Garamond Premier Pro Semibold")
        \abs-fontsize #15
        \smallCaps \fromproperty #'header:title
      }
      \fill-line {
        \large \fromproperty #'header:composer
      }
    }
  }

  % Optional: Format the header on subsequent pages
  oddHeaderMarkup = \markup {
    \fill-line {
      \fromproperty #'page:page-number-string
      \smallCaps \fromproperty #'header:title
    }
  }
}

% Simple music example
\score {
  \new Staff {
    \relative c' {
      \key d \major
      \time 3/4
      fis4 e d
      a'2 b4
      d2.
    }
  }
  \layout { }
}
