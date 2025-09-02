\version "2.24.0"
\language "english"

\include "../stylesheets/twoByTwoBeaming.ly"
\include "../stylesheets/bars-per-line-engraver.ly"

\header {
  title = "Blue Lou"
  subtitle = \markup \small "transcribed by Marc"
  composer = "Stephane Grappelli"
  opus = "1937 in Paris"
}

chordNames = \chordmode {
  c1  c    c  c
  c   d:m  a:m  f  
  c   d:m  a:m  f  
}

melody = \relative c' {

  df2 ~ df4 \tuplet 3/2 { d8 ef d}
  c8 c4 c2 r8
  r8 df r df bf'4 df,
  df8   c8 r  c4 r8 g'8 gs
  a8 c d4 c r8 cs
  d f r4 r2
  r4 \grace {bf8 a} g8 f d df c b bf a af g f e4.

  df bf'8 ~ bf4 df, \tuplet 3/2 {df4 c c~} c4 r4
  r4 ef'2. df4 af8 g ~ g4 df8  c ~
  c4 r4 c'8 cs d f d df! c a f4 bf8 g
  a f d c ~ c c b bf a4 r4 r2

  r8 a''8 r g a g e ef d c a c c4 a8 f
  d e f a \tuplet 3/2 {c8 b bf} a af g f e4 g2
  %%
  \tuplet 3/2 { e8 g b}   \tuplet 3/2 { d c b }
  \tuplet 3/2 { a c e-2}  \tuplet 3/2 { g f e}
  \tuplet 3/2 { d f a}    \tuplet 3/2 { c b a}
  g4
  r4 r8 e8 g gs a f d c a f e4 g2
  df8 df'4  r4 df,4 df8 c4 c' c,2
  r8 df8 f'[ df, r16 df16] c df8 r16 c  r16

  %{   g'' gs
    a8 a4 g16 f d df c b bf a
    g' \glissando af \glissando g f d df c bf
    a g f e
    g8 \grace {f16( g)} f16 e d c
    a8 r4 r2
  %}

}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff \melody
  >>
  \layout {
    indent=0
        \context {
          \Voice
          \twoByTwoBeaming
        }
        \context {
          \Score
          %use the line below to insist on your layout
          %\override NonMusicalPaperColumn.line-break-permission = ##f
          \consists #(bars-per-line-engraver '(4 ))
        }
      }
  
  \midi { }
}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39,
2.19.40, 2.19.46, 2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1,
2.23.2, 2.23.3, 2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9,
2.23.10, 2.23.11, 2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
