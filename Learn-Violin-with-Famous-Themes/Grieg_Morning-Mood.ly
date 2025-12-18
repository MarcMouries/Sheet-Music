\version "2.24.0"
\language "english"

% Only set header when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \header {
      title = "Morning Mood"
      subtitle = "From Peer Gynt Suite No. 1, Op. 46"
      composer = "Edvard Grieg (1843-1907)"
      country = "Norway"
      style = "romantic"
      difficulty = "Level 2 - Early Intermediate"
    }
  #})

\include "../common/common-header.ily"

Grieg_MorningMood = \relative b'' {
  \key e \major
  \time 6/8
  \tempo "Allegretto pastorale" 4. = 48

  | b8( gs fs  e fs gs)
  | b8([ \grace {gs16 a} gs8 fs]  e fs gs)
  | \appoggiatura {gs16 a} b8( gs b)  cs( gs cs)
  | b8( gs fs e4) r8
  \break
  | b'8( gs fs  e fs gs)
  | b8([ \grace {gs16 a} gs8 fs]  e fs gs)
  | \appoggiatura {gs16 a} b8( gs b)  cs( gs cs)
  | b8( gs fs e4.)
  \bar "|."
}

% Only include score block when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  (add-score
    #{
      \score {
        \new Staff { \clef treble \Grieg_MorningMood }
        \header { piece = "Morning Mood" }
        \layout {}
        \midi {}
      }
    #}))
