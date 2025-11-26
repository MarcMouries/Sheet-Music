\version "2.19.15"


\pageBreak
\book {
  \markuplist \table-of-contents
  \pageBreak
  \tocItem \markup { The first score }
  \score {
    {
      c'1 \pageBreak
      \mark "Rhythms" \tocItem \markup { Rhythms }
      \time 3/8
      c8.  c16  c16   c16
      c16  c8.  c16   c16
      c16  c16  c8.   c16
      c16  c16  c16   c8.

    }
  }
  \pageBreak
  \tocItem \markup { The second score }
  \score {
    { e'1 }
    \header { piece = "Second score"
  composer = "Marc Mouries"
  style = "practice exercise"
}
  }
}