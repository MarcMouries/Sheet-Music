\version "2.24.0"
\language "english"

% Only set header when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \header {
      title = "Waltz No. 2"
      subtitle = "From Suite for Variety Orchestra"
      composer = "Dmitri Shostakovich (1906-1975)"
      country = "Russia"
      style = "waltz"
      difficulty = "Level 3-4 - Intermediate"
    }
  #})


\include "../common/common-header.ily"

Shostakovich_Waltz = \relative c'' {
  \key c \major
  \time 3/4
  \tempo "Allegretto" 4 = 160

  % Main romantic theme
  e4\mf(\< f g) |
  a2.(\! |
  g4 f e) |
  d2.( |

  c4) r c( |
  e2 g4) |
  c,4( e g) |
  c2 r4 |

  \bar "|."
}

% Only include score block when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \score {
      \new Staff { \Shostakovich_Waltz }
      \layout { }
      \header { piece = "Waltz" }
    }
  #})
