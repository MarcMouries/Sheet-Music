\version "2.24.0"
\language "english"

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

  df4 ~ df8 \tuplet 3/2 { d16 ef d}
  c16 c8 r16 c4
  r16 df r df bf'8 df,
  df16   c16 r  c8 r16 g'16 gs
  a16 c d8 c r16 cs
  d f r8 r4
  r8 \grace {bf16 a} g16 f d df c b bf a af g f e8.

  df bf'16 ~ bf8 df, \tuplet 3/2 {df8 c c~} c8 r8
  r8 ef'4. df8 af16 g ~ g8 df16  c ~
  c8 r8 c'16 cs d f d df! c a f8 bf16 g
  a f d c ~ c c b bf a8 r8 r4

  r16 a''16 r g a g e ef d c a c c8 a16 f
  d e f a \tuplet 3/2 {c16 b bf} a af g f e8 g4
  %%
  \tuplet 3/2 { e16 g b}   \tuplet 3/2 { d c b }
  \tuplet 3/2 { a c e-2}  \tuplet 3/2 { g f e}
  \tuplet 3/2 { d f a}    \tuplet 3/2 { c b a}
  g8
  \break
  r16 e g gs a f d c a f e r g4
  df16 df'8  r8 df,8 df16 c8 c' c,4
  r16 df16 f'[ df, r32 df32] c df16 r32 c  r32
  \break

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
  \layout {indent=0 }
  \midi { }
}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39,
2.19.40, 2.19.46, 2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1,
2.23.2, 2.23.3, 2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9,
2.23.10, 2.23.11, 2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
