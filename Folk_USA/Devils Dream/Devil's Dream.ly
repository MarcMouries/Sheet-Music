\version "2.24.0"
\language "english"

\header {
  title = "Devil's Dream"
  composer = "Traditional"
  country = "USA"
  genre = "Folk"

  subgenre = "Irish"
}

\include "../../common/common-header.ily"


melody = \relative c'' {
  \key a \major
  \partial 4 e4

  %\bar ".|:"
  \repeat volta 1 {
    a8 gs a e  a gs a e  a gs a e fs e d cs
    d fs b, fs' d fs b, fs' d fs b, fs' a gs fs e \break

    a8 gs a e  a gs a e  a gs a e fs e d cs
    b cs d e fs gs a fs e cs b cs a4 e'4
  }
  %\bar ":|."
  \break
  % Part 2
  %\bar ".|:"
  \repeat volta 2{
    cs8 e a, e' cs e a, e' cs e a, e' fs e d cs
    d fs b, fs' d fs b, fs' d fs b, fs' a gs fs e \break

    cs8 e a, e' cs e a, e' cs e a, e' fs e d cs
    b cs d e fs gs a fs e cs b cs a4 a4
  }
  \alternative {{a4 e4}{a4 a4} }
  \bar ":|."
}

harmonies = \chordmode {
  s4
  a4 a4 a4 a4
  a4 a4 a4 a4
  b4:min b4:min b4:min b4:min
  b4:min b4:min e4:7 e4:7
  a4 a4 a4 a4
  a4 a4 a4 a4
  d4 d4 a4 a4
  e4:7 e4:7 a4 a4

  a4 a4 a4 a4
  a4 a4 a4 a4
  b4:min b4:min b4:min b4:min
  b4:min b4:min e4:7 e4:7
  a4 a4 a4 a4
  a4 a4 a4 a4
  d4 d4 a4 a4
  e4:7 e4:7 a4 a4
}

\score {
  <<
    \context ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \context Staff = one \melody
  >>
  \layout{ }
  \midi {
    \tempo 4 = 120
  }
}
