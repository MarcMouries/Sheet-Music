\version "2.19.11"

% APPROACH 1: Simple header with formatting in \paper block
\header {
  title = "The First Noël"
  composer = "18th Century French Melody"
  country = "England"
  poet = "Traditional"
  style = "christmas carol"
}

\include "common-header.ily"


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
