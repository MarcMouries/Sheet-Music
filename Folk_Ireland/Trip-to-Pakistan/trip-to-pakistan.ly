\version "2.24.0"
\include "../../common/stylesheet_fiddle.ly"
\include "english.ly"
\header {
  title     = "Trip To Pakistan, The"
  subtitle  = "As played by Sarah Burnell"
  composer  =  "Niall Kenny"
  opus      =	"tr. Maxence Mouriès"
  country = "Ireland"
  genre = "Folk"

  subgenre = "Irish"
}

\include "../../common/common-header.ily"
\paper {
  #(set-paper-size "letter")
}
theChords = \chordmode{
  e2:m  g2  d1        e2:m  g2  d2  e2:m
  e2:m  c2  g2    d2  e2:m  c2  g2  d2
  b2:m  g2  e1:m      d1        d2  e2:m
}

melody =  {

  \override Glissando.bound-details = #'((right (padding . 0.7)) (left (padding . 0.5)))
  \override Glissando.extra-offset = #'(0 . -.5)

  \relative c' {
    \repeat volta 2 {
      | e8  g  b  e,(g4) g8[\grace { b8 [a]} b8]
      | a4 a8  \grace a16 \glissando b8   a   g    fs  g
      | e8  g  b  e,(g4) g8[\grace { b8 [a]} b8]
      | a8    g8   fs  g    e4 d4
    }
  }
  \break
  \relative c' {
    \repeat volta 2 {
      | e8  g  b  g(  c4) c8 a8 | b4 b8   d8   a    g  fs   g
      | e8  g  b  g(  c4) c8 a8 | b8    a8   g    b  a2
    }
  }
  \break
  \relative c' {
    \repeat volta 2 {
      | fs8  g   b  fs  g   b  fs( g)
      | e8   fs  g  e   fs  g  e  fs
      | d8   fs  a  d,  fs  a  d, fs
      | a8   g   fs g   e2
    }
  }
  \break
}

\score {
  <<
    \new ChordNames \with { midiInstrument = "orchestral strings" }
    \chordmode {     \theChords  }

    \new Staff {
      \key e \minor
      \time 4/4
      \set Staff.midiInstrument = #"violin"
      \melody
    }
  >>
  \layout { indent = 0.0\cm }
  \midi {
    \tempo 4 = 180
  }
}