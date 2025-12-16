\version "2.24.0"
\language "english"

\header {
  title = "Canon in D"
  composer = "Johann Pachelbel (1653-1706)"
  country = "Germany"
  opus = "T. 337"
  style = "baroque"
  difficulty = "Level 2-3 - Early Intermediate"
}

\include "../common/common-header.ily"

Pachelbel_Canon = \relative c'' {
  \key d \major
  \time 4/4
  \tempo "Adagio" 4 = 54

  % Main theme (simplified version for violin)
  fs2 e | d cs | b a | b cs |
  d2 cs | b a | g fs | g e |

  % First variation
  fs4 e fs d | e d e cs |
  d cs d b | cs b cs a |

  \bar "|."
}

% Only include score block when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \score {
      \new Staff { \Pachelbel_Canon }
      \layout { }
      \header { piece = "Canon" }
    }
  #})
