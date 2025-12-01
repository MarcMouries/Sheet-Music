\version "2.19.14"
\language "english"

\header {
  title = "Greensleeves Jig"
  subtitle = "Jig arrangement"
  composer = "Traditional English"
  country = "England"
  style = "jig"
  video = "https://www.youtube.com/watch?v=4aDK9qdoWpk"
}

\include "../../common/common-header.ily"

globalGm = {
  \time 6/8
  \key g \minor
  \tempo 4=120
}

ChordsInGm = \chordmode {
  \globalGm
  \partial 8   s8
  g2.:m  f2.  g2.:m     d2.:m
  g2.:m  f2.  g4.:m d4. g2.:m
  d2.:m  f2.  g2.:m     d2.:m
  d2.:m  f2.  g4.:m d4. g2.:m
}


MelodyInGm = \relative c'' {
  \globalGm
  \partial 8 g16 a

  bf4     bf8   bf  c   d
  c 8  a  f     f   g   a
  bf8  g  g     g   a   bf
  a 8  d, d     d4  g16 a
\break
  bf4     bf8   bf  c   d
  c 8  a  f     f   g   a
  bf8  a  g     f   d   fs
  g 4.          g,4     d''16  ef
\break
  f 8  g  f    f   ef  d
  c 8  a  f    f   a   c
  g'8  a  g    g   a   g
  f 8  d  d    d4  d16 ef
\break
  f 8  g  f    f   ef  d
  c 8  a  f    f   g   a
  bf8  a  g    f   d   fs
  g 4. g,4
}


\markup { In Gm}
\score {
  <<
    \new ChordNames \ChordsInGm
    \new Staff { \MelodyInGm }
  >>
  \layout { indent = 0}
  \midi { }
}

\score {
  <<
    \new ChordNames
       \with { midiInstrument = "acoustic guitar (steel)" }
       \chordmode { \ChordsInGm }

    \new Staff = "Melody"
       \with { midiInstrument = "violin" instrumentName = "violin" }
       \MelodyInGm
  >>
  \midi {
    \tempo 4 = 160
  }
}

\markup { In Am}
globalAm = {
  \time 6/8
  \key a \minor
  \tempo 4=120
}
ChordsInAm = \chordmode {
  \globalAm
  \partial 8   s8
  a2.:m  g2.  a2.:m     e2.:m
  a2.:m  g2.  a4.:m e4. a2.:m
  c2.    g2.  f2.       c2.
  c2.    g2.  a4.:m e4. a2.:m
}



partA = {
   \repeat volta 4 {
  c 4   c8       c   d   e
  d 8   b  g     g   a   b
 }\alternative {
    {\set Score.repeatCommands = #'((volta "1,3") )
  c 8   a  a     a   b   c
  b 8   e, e     e8    a b
    }
\break
   {   \set Score.repeatCommands = #'((volta #f)(volta "2") end-repeat)
  c 8   b  a     b4      g8
  a4       a8    a4      a16 b
    }
    {
  c8    b  a     b4       g8
  a4       a8    a8   e'  f
    }
 }

}

MelodyInAm = \relative c'' {
  \globalAm
 \partial 8 a16 b

 \partA

\break
\repeat volta 2 {
  g 4     g8     g    f   e
  d 8  b  g      g    b   d
  a'4     a8     a    b   a
  g 8  e  c      c    e   f
\break
  g 8  c,  e     g   f   e
  d 4      b8    g   a   b
  c 8  b   a     b4     gs8
}
\alternative {
 {  a 4       a8    a8   e'  f }
 {  a,4       a8    a4   a16 b }
}
\break

 \partA

  a,4 a8 a4.\fermata
}
\score {
  <<
    \new ChordNames \ChordsInAm
    \new Staff { \MelodyInAm }
  >>
  \layout { indent = 0}
  \midi { }
}

