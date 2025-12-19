\version "2.19.15"
\language "english"

\header {
  title = "Katyusha"
  composer = "Matvey Blanter"
  country = "Russia"
  genre = "Folk"
}

global = {
  \time 2/4
  \key e \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  e1:m e1:m
  b1:7  e2:m e2:m
  e4:m c4
  g4 e4:7
  a2:m  e2:m
  a2:m  e2:m
  b2:7  e2:m
}

melody = \relative e' {
  \global

  e4. fs8 g4. e8 g[ g] fs e
  fs4 b,8 r
  fs'4. g8 a4. fs8
  a8 a g fs e4 e16 fs g a
  \break
  \repeat volta 2 {
  b4 e d e8 d
  c8. c16 b8 a b4 e,
  r8 c'4 a8
  b4. g8
  }
  \alternative {
   {  a8 a g fs
      e4 e16 fs g a}
   {  a8 b cs ds
      e2 }
  }
}


targetKey = a

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout {indent=0 }
  \midi { }
}


\score {
  <<
    \new ChordNames { \transpose e \targetKey \chordNames}
    \new Staff      { \transpose e \targetKey \melody }
  >>
  \layout {indent=0 }
  \midi { }
}

\score {
  <<
    \new ChordNames { \transpose e d \chordNames}
    \new Staff      { \transpose e d \melody }
  >>
  \layout {indent=0 }
  \midi { }
}

\score {
  <<
    \new ChordNames { \transpose e g \chordNames}
    \new Staff      { \transpose e g \melody }
  >>
  \layout {indent=0 }
  \midi { }
}
\score {
  <<
    \new ChordNames { \transpose e c \chordNames}
    \new Staff      { \transpose e c \melody }
  >>
  \layout {indent=0 }
  \midi { }
}
\score {
  <<
    \new ChordNames { \transpose e b \chordNames}
    \new Staff      { \transpose e b \melody }
  >>
  \layout {indent=0 }
  \midi { }
}