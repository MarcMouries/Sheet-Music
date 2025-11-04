\version "2.19.37"
\language "english"

\header {
  title = ""
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  g1  af a bf b c
  cs1 d ef e f fs

}

melody = \relative c' {
  \global
  g  4  b   d   g
  af,4  c   ef  af
  a ,4  cs  e   a
  bf,4  d   f   bf
  b ,4  ds  fs  b
  c ,4  e   g   c
  df,4  f   af  df
  d ,4  fs  a   d
  ef,4  g   bf  ef
  e ,4  gs  b   e
  f ,4  a   c   f
  fs,4  as  cs  fs
}

\markup "Arpeggios in 12 keys Chromatically in 1st position."
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { indent=0}
}
\markup "Arpeggios in 12 keys in cycle of Fourths: G C F Bb Eb Ab Db Gb B E A D "
cycleOfFourthsCF = \relative c' {
  c1 f  bf, ef af, df gf b, e a, d g,
}
\score {
    \new Staff { \cycleOfFourthsCF }
  \layout { indent=0}
}
cycleOfFourthsBE = \relative c'' {
  b e, a, d g, c1 f  bf, ef af, df gf
}
\score {
    \new Staff { \cycleOfFourthsBE }
  \layout { indent=0}
}


\markuplist {
    \override #'(padding . 2)
    \table
      #'(0 0) % alignment
      {
        \bold { "COLUMN A"  "MUSIC" }
       "A"   \score { \relative c' { c4 d e f}}
       "B"   \score { \relative c' { c4 d e f}}

      }
}


arpeggios = \relative c' {

  g8 c e  g8 c e g8 c e-3
  c8 g e c g e c g
}
\score {
    \new Staff { \arpeggios }
  \layout { indent=0}
}
