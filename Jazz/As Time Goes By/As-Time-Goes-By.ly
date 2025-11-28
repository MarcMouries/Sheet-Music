\version "2.19.49"
%\pointAndClickOff
\language "english"


\header {
  title="As Time Goes By"
  composer = "Herman Hupfeld"
  country = "USA"
  style = "jazz"
}


harmonies = \chordmode {
  \skip 8
  f2:m7 bf:7 bf:m6 bf:7
  ef:6 f2:m7 f2:m7 g:m7
  f2:m7
  \skip 2

  \skip 1 \skip 1 \skip 1
  ef1:6 bf2:m7 ef:7 af1:m6 c:7
  f1:m a:dim c2:m af:7 f1:7


  bf2:7 bf:dim bf1:7

}

melody =  \relative a' {
  \clef "treble"
  \key ef \major
  \numericTimeSignature
  \time 4/4 | % 1
  \partial 8  g8 \repeat volta 2 {
    af8.  g16  f8.  ef16  f4.  g8
    bf8.  af16  g8.  f16  af4.
    bf8
    ef8.  d16  c8.  bf16  c2

    r2 r4  d4

    \break
    f8  ef8  d8  c8  d4
    ef4
    bf4  bf4  ef,4  f4
  }
  \alternative {
    {
      g1 ~ | % 9
      g2 r8 r8 r8  g8
      \break
    }
    {
      ef1 ~ | % 11
      ef2 r2
    }
  } \bar "||"
  ef8  f8  ef8  c'8 ~  c4
  c4 | % 13
  c8  df8  c8  b8  c2

  \break
  f,8  g8  f8  c'8 ~  c4
  c4 | % 15
  c8  d8  c8  b8  c2 | % 16
  g8  af8  g8  ef'8 ~  ef4
  ef4 | % 17
  ef8  d8  ef8  d8  f4
  d4 | % 18
  \break
  c4  c4  g4  g4 | % 19
  bf2. r8  g8 |
  af8  g8  f8  ef8  f8  f4
  g8 | % 21
  bf8  af8  g8  f8  af8
  af4  bf8 | % 22
  \break
  ef8  d8  c8  bf8  c2 | % 23
  r2 r4  d4 | % 24
  f8  ef8  d8  c8  d4
  ef4 | % 25
  bf4  bf2  g4 | % 26
  bf2  bf2 | % 27
  ef2. r4 \bar "||"
}



\score {
  <<

    \new ChordNames {    \harmonies     }

    \new Staff \with {
      midiInstrument = "violin"
    } \melody

  >>
  \layout { }
  \midi {
    \tempo 4=120
  }
}

