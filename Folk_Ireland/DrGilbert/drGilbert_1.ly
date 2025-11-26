\include "../../stylesheets/violin-functions.ly"

\layout {
  \set beamExceptions = #'()
}
\paper {
  indent = 0\mm
}


\version "2.14.0"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"
\header {
  title = "Dr. Gilbert's"
  composer = "Traditional"
    style = "irish traditional"
  tagline = ""
}
%#(set-global-staff-size 20)


melodySimple = {
  \key e \minor

  \relative c'' {
    \partial 4  \grace fs8 \upbow g8\fermata(  fs)

    \repeat volta 2 {
      e8   b b  a b e e d

      \tri{b8( c d) } a  c  b  a  g  fs
      | e8 d  b  d \tri {g8 fs e}  \tri {fs8 e d}
      |  e   b b   e d  b  a    b
      |  b8  e   e   d     e4   d8  e
      |  g   e   \tuplet 3/2 {fs8 e d}     e    fs  g   a
      |  b   d   e   d     b    d   g   b
      |  a   fs  d   fs    e4       g8[  fs]

      r4 r r r
      r4 r r r
    }
  }
}


melody =  {
  \set Staff.midiInstrument = "violin"
  \tempo 4 = 120
  \time 4/4
  \key e \minor
  \relative c'' {
    \partial 4  \grace fs8 \upbow g8\fermata(  fs)
    \repeat volta 2 {
      %{ 1 %}
      |  e   b \acciaccatura {b d}  b   a     b4.\turn( cs8)
      |  d      b(\acciaccatura {b c}    b4)  a8  g(    fs g)
      |  e(\acciaccatura {f e}     d)   b   d     g4       fs8  g
      |  e   d   b   e     d    a   a4
      |  b8  e   e   d     e4   d8  e
      |  g   e   \tuplet 3/2 {fs8 e d}     e    fs  g   a
      |  b   d   e   d     b    d   g   b
      |  a   fs  d   fs    e4       g8[  fs]
    }
    \break
    \repeat volta 2 {
      |  e8  b   b4        g'8     b,   b4
      |  d8  e   fs   g    a       fs   d   fs
      |  g4   b8  g   fs   g   a   fs
      |  e    g   fs  d    e   d   b   a
      |  a'   fs  d   fs   e   d   b   cs
      |  d    b   a   fs   d   fs  a   fs
      |  e    a   c   a    \tri{b8 d e}   g   b
      |  a    fs  d   fs   e4
    }
  }
}

\score {
  \new StaffGroup
  <<
    \new Staff = "ornamented" { \melody }
    \new Staff = "plain"      { \melodySimple }
  >>
  \layout { }
  \midi { }
}





melodyB =  {
  \set Staff.midiInstrument = "violin"
  \tempo 4 = 120
  \time 4/4
  \key e \minor
  \relative c'' {
    \partial 4  g'8[  fs]
    \repeat volta 2 {
      | e^"(A" b  \tri {c8( b a)} b d \acciaccatura { e16 } d8 b
      | \tri{b8( c d)} a c  b a g fs
      | e d b d  \tri{g8(fs e)} \tri{fs8( e d)}
      | e8  b \grace c16 \tri {b8(a b)} fs'8 b, \acciaccatura c16 \tri{b8(a b)}
      \break
      | d8 e \tri{fs8( e d)} e d b d
      | \tri{g8(fs e)} \tri{fs8( e d)} e fs g a
      | \tri{b8( c d)} e8 d  b d e b'
      | a fs b, fs'  e fs g fs
    }
    \break
    \repeat volta 2 {
      | e8 b \acciaccatura c8 \tri{b8( a b)} g'8 b, \acciaccatura c \tri{b8( a b)}
      | d e fs a \acciaccatura b  a fs d fs
      | g4 b8 g fs a \acciaccatura b  a fs
      | \tri{e8( fs g)} fs8 d e b \acciaccatura c \tri{b8( a b)}
      \break
      | a' fs d fs  e d b c
      | \tri{d8( c b)} a fs a fs d fs
      | e b' \acciaccatura c b a  b d e b'
      | a fs d fs  e4  g8 fs
    }
  }
}



\score {    \new Staff { \melodyB }   \layout { } }