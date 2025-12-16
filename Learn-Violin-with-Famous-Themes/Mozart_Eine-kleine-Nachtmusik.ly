\version "2.24.0"
\language "english"

\header {
  title = "Eine kleine Nachtmusik"
  subtitle = "Allegro (1st movement excerpt)"
  composer = "Wolfgang Amadeus Mozart (1756-1791)"
  country = "Austria"
  opus = "K. 525"
  style = "serenade"
  difficulty = "Level 2 - Early Intermediate"
}

\include "../common/common-header.ily"

Mozart_Nachtmusik = \relative c'' {
  \key g \major
  \time 4/4
  \tempo "Allegro" 4 = 138

  % Opening theme
  g4-.\f g8-. r g4-. g8-. r |
  g4 d' b g |
  a8( d cs d) e( d cs d) |
  g,4 g8-. r g4-. r |

  g4-. g8-. r g4-. g8-. r |
  g4 d' b g |
  a8( d cs d) e( d cs d) |
  g,4 g8-. r g4-. r |

  \bar "|."
}

% Only include score block when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \score {
      \new Staff { \Mozart_Nachtmusik }
      \layout { }
      \header { piece = "Allegro" }
    }
  #})
