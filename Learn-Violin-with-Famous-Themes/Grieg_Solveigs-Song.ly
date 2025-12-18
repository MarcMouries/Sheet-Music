\version "2.24.0"
\language "english"

% Only set header when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \header {
      title = "Solveig's Song"
      subtitle = "From Peer Gynt, Op. 23"
      composer = "Edvard Grieg (1843-1907)"
      country = "Norway"
      style = "romantic"
      difficulty = "Level 2-3 - Early Intermediate"
    }
  #})

\include "../common/common-header.ily"

Grieg_SolveigsSong = \relative e' {
  \key a \minor
  \time 4/4
  \tempo "Andante" 4 = 60

  r2 r4 e4 |
  \repeat volta 2 {
    a4( b8 c) d4( e8 f)
    f( e) e c a4 a8( c) |
    c8( b) b gs gs16( e8.) ~ e4 ~
    e8 r8 r4 r4 e4 |
  }
  \bar "|."
}

% Only include score block when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  (add-score
    #{
      \score {
        \new Staff { \clef treble \Grieg_SolveigsSong }
        \header { piece = "Solveig's Song" }
        \layout {}
        \midi {}
      }
    #}))
