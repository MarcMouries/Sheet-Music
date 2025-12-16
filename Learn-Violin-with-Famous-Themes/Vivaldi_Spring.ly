\version "2.24.0"
\language "english"

% Only set header when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \header {
      title = "Spring (La Primavera)"
      subtitle = "From The Four Seasons - Opening Theme"
      composer = "Antonio Vivaldi (1678-1741)"
      country = "Italy"
      opus = "Op. 8, No. 1"
      style = "concerto"
      difficulty = "Level 3 - Intermediate"
    }
  #})

\include "../common/common-header.ily"

Vivaldi_Spring = \relative c'' {
  \key e \major
  \time 4/4
  \tempo "Allegro" 4 = 120

  % Opening theme - good for second position practice
  e4\f e8 e e4 e8 e |
  e8 fs gs e fs4 e |
  ds8 e fs ds e4 r |

  e4 e8 e e4 e8 e |
  e8 fs gs e fs4 e |
  ds8 e fs ds e4 r |

  % Second position work
  b'4 b8 b b4 b8 b |
  b8 cs b a gs4 fs |

  \bar "|."
}

% Only include score block when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \score {
      \new Staff { \Vivaldi_Spring }
      \layout { }
      \header { piece = "Allegro" }
    }
  #})
