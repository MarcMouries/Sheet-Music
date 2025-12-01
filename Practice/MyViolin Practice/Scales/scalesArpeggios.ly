\version "2.19.11"
\include "english.ly"

\markup {
  There are only 3 patterns to know that will cover all scales. 1) G: starting with open G. 2) A starting with 1st finger on A and 3) starting with 2nd finger.
}


\header{
  title = "Scales & Arpeggios"
  arranger = \markup { \small "Marc Mouriès" \teeny "marc@mouries.net"
  composer = "Marc Mouries"
  style = "practice exercise"
}

\include "../../../common/common-header.ily"
  instrument = "Violin"
  meter = "1) Detache 2) slurred 3) Staccato"
}
\paper{
  printallheaders=##t
}
#(set-global-staff-size 22)
%%%%%%%%

\score {
  \relative{
    \key g \major
    g16   b    a    g
    a    b    c    d
    e    fs   g    a
    b    c    d-1  ^\markup { \small "III" } e
    fs   g    a    b
    c-1  ^\markup { \small "V" } d    e    fs
    g-4  fs  e    d
    c    b-4 ^\markup { \small "I" }  a    g
    fs   e    d    c
    b    a    g    fs
    e    d    c    b
    a   g     b    a
  }
  \header {
    piece = "G Major Scale - 3 Octaves"
        title = "title"  % not printed
  }
  \layout{ indent = 0  }
}

\score {  \relative{
  \key g \major
  \time 6/8
   g8-0  ^\markup { \small "I"  }    b    d-0
   g-1   ^\markup { \small "III"}    b    d-1
   g-1   ^\markup { \small "VI" }    b    d-1
   g-4  d-1  b
   g-1  d-1 ^\markup { \small "III" } b
   g  d  b | g2.
  }
  \header {
    piece = "G Major Arpegio- 3 Octaves"
  }
  \layout{ indent = 0  }
}


%% A MAJOR %%
\score {
  \relative{
    \key a \major
    a8    gs   a    b
    cs   d    e    fs
    gs   a    b    cs
    d-1  ^\markup { \small "III" } e  fs  gs
    a    b	  cs-1  ^\markup { \small "V" } d
    e-1 ^\markup { \small "VI" }    fs   gs  a-4
    gs   fs  e-3    d
    cs   b-4 ^\markup { \small "I" }  a    gs
    fs   e    d    cs
    b    a    gs   fs
    e    d    cs    b
    a    gs    b    a
  }
  \header {
    piece = "A Major Scale - 3 Octaves"
        title = "title"  % not printed

  }
  \layout{ indent = 0  }
}


%% D MAJOR %%
\score {
  \relative d' {
    \key d \major
  d8-2 ^\markup { \small "III" } fs e  d  e  fs  g  a  b  cs
  d-1   e  fs-1^\markup { \small "V" }  g  a b cs-1
  d e-1 ^\markup { \small "VII" } fs
%  #(set-octavation 1)
  g-1^\markup { \small "IX" } a b cs d-4 cs-4 b a g  fs-3
%  #(set-octavation 0)
  e  d	cs-3  b a  g fs
  e  d  cs-4  b a  g fs	e d  fs e
  }
  \header {
    piece = "D Major Scale - 3 Octaves"
    title = "title"  % not printed
  }
   \layout{ indent = 0  }
}

\markup {
  A Harmonic Minor
}
AharmonicMinor = \relative c'' {
  a8  b   c   d     e   fs  gs  e
  a   c   b   a     gs  f   e   d
  c   d   c   b     a   g   f   e
  d   c'  b   a     e'4     e,
}
\score { \new Staff { \AharmonicMinor }}

\markup {  G Harmonic Minor}
GharmonicMinor = \relative c'' {
  g8  a   bf   c     d   e  fs  d
  g   bf   a   g     fs  ef   d   c
  bf   c   bf   a     g   f   ef   d
  c   bf'  a   g     d'4     d,
}
\score { \new Staff { \GharmonicMinor }}


\markup {  F Harmonic Minor}
FharmonicMinor = \relative c'' {
  f,8  g   af   bf     c   d  e  c
  f   af   g   f     e  df   c   bf
  af   bf   af   g     f   ef   df   c
  bf   af'  g   f     c'4     c,
}
\score { \new Staff { \FharmonicMinor }}


\markup {  Blues scale}
CminorBlues = \relative c' {
  c8 ef f gf g bf c
}
\score { \new Staff { \CminorBlues }}

\markup {  C Minor Bebop}
CminorBebop = \relative c' {
  c4 ef g bf
  c8 b bf a g f ef d c4
}
\score { \new Staff { \CminorBebop }}
