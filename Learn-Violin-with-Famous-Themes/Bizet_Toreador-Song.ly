\version "2.24.0"
\language "english"

\header {
  title = "Toreador Song"
  subtitle = "From Carmen"
  composer = "Georges Bizet (1838-1875)"
  country = "France"
  style = "opera"
  difficulty = "Level 2-3 - Early Intermediate"
}

\include "../common/common-header.ily"

Bizet_Toreador = \relative c' {
  \key f \major
  \time 2/4
  \tempo "Allegro moderato" 4 = 120

  % Main march theme
  f8-.\f f-. f-. f-. |
  f8 a c a |
  f8-. f-. f-. f-. |
  f8 a c4 |

  d8-. d-. d-. d-. |
  c8 bf a g |
  f4 f8-. f-. |
  f4 r |

  \bar "|."
}

% Only include score block when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \score {
      \new Staff { \Bizet_Toreador }
      \layout { }
      \header { piece = "Allegro moderato" }
    }
  #})
