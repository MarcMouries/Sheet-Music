\version "2.24.0"
\language "english"

% Only set header when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \header {
      title = "Rondo alla Turca (Turkish March)"
      subtitle = "From Piano Sonata No. 11"
      composer = "Wolfgang Amadeus Mozart (1756-1791)"
      country = "Austria"
      opus = "K. 331"
      style = "rondo"
      difficulty = "Level 3 - Intermediate"
    }
  #})


\include "../common/common-header.ily"

Mozart_Rondo = \relative c'' {
  \key a \minor
  \time 2/4
  \tempo "Allegretto" 4 = 120

  % Main theme
  \repeat volta 2 {
    b8-.\p b-. b4 |
    b8( c) b-. a-. |
    gs8-. gs-. gs4 |
    gs8( a) gs-. fs-. |

    e8-. e-. e-. fs-. |
    gs8-. a-. b-. c-. |
    b8-. a-. gs-. a-. |
    b4 r |
  }

  \bar "|."
}

% Only include score block when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \score {
      \new Staff { \Mozart_Rondo }
      \layout { }
      \header { piece = "Allegretto" }
    }
  #})
