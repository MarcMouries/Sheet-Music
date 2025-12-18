\version "2.24.0"
\language "english"

% Only set header when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \header {
      title = "In the Hall of the Mountain King"
      subtitle = "From Peer Gynt Suite No. 1, Op. 46"
      composer = "Edvard Grieg (1843-1907)"
      country = "Norway"
      style = "romantic"
      difficulty = "Level 3-4 - Intermediate"
    }
  #})

\include "../common/common-header.ily"

Grieg_MountainKing = \relative c'' {
  \key b \minor
  \time 4/4
  \tempo "Alla marcia e molto marcato" 4 = 120

  % Theme - First statement (pp)
  b,8-.\pp cs-. d-. e-. fs-.-> d-. fs4-.
  es8-.-> cs-. es4-. e8-.-> c-. e4-.
  b8-. cs-. d-. e-. fs-.-> d-. fs-. b-.
  a-. fs-. d-. fs-. a2->
  \break
  % Theme - Repeat
  b,8-. cs-. d-. e-. fs-.-> d-. fs4-.
  es8-.-> cs-. es4-. e8-.-> c-. e4-.
  b8-. cs-. d-. e-. fs-.-> d-. fs-. b-.
  a-. fs-. d-. fs-. a2->
  \break
  % Development in F# minor
  fs8-.\p gs-. as-. b-. cs-.-> as-. cs4-.
  d8-.-> as-. d4-. cs8-.-> as-. cs4-.
  fs,8-. gs-. as-. b-. cs-.-> as-. cs4-.
  d8-.-> as-. d4-. cs2->
  \break
  % Return to theme (f)
  b,8-.\f cs-. d-. e-. fs-.-> d-. fs4-.
  es8-.-> cs-. es4-. e8-.-> c-. e4-.
  b8-. cs-. d-. e-. fs-.-> d-. fs-. b-.
  a-. fs-. d-. fs-. b2->
  \bar "|."
}

% Only include score block when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  (add-score
    #{
      \score {
        \new Staff { \clef treble \Grieg_MountainKing }
        \header { piece = "In the Hall of the Mountain King" }
        \layout {}
        \midi {}
      }
    #}))
