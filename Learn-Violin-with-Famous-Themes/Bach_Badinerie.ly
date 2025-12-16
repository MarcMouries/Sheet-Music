\version "2.19.49"
\include "english.ly"


\header {
  title = "Badinerie"
  subtitle = "From Orchestral Suite No. 2 in B minor"
  composer = "J. S. Bach (1685-1750)"
  country = "Germany"
  opus = "BWV 1067"
  style = "suite movement"
  difficulty = "Level 4-5 - Advanced"
}

\include "../common/common-header.ily"

Bach_Badinerie = {
\partial 4 b''8\f  [  d'''16 b''16 ]  |  % 1
 fs''8 [  b''16 fs''16 ]  d''8 [  fs''16 d''16 ]  |  % 2
 b'4 fs'16 [  b'16 d''16 b'16 ]  |  % 3
 cs''16 [  b'16 cs''16 b'16 ]  as'16 [  cs''16 e''16 cs''16 ]  |  % 4
 d''8 [  b'8 ]  b''8 [  d'''16 b''16 ]  |  % 5
 fs''8 [  b''16 fs''16 ]  d''8 [  fs''16 d''16 ]  |  % 6
 b'4 d''8-. [  d''8-. ]  |  % 7
 d''8-. [  d''8-. b''8 d''8 ]  |  % 8
 d''8^\markup{\italic{ tr }}  [  cs''8 ]  fs''8-. [  fs''8-. ]  |  % 9
 fs''8 [  fs''8 ]  d'''8 [  fs''8 ]  |  % 10
 fs''8^\markup{\italic{ tr }}  [  es''8 ]  cs''16 [  fs''16 a''16 fs''16 ]  |  % 11
 gs''16 [  fs''16 gs''16 fs''16 ]  es''16 [  gs''16 b''16 gs''16 ]  |  % 12
 a''16 [  gs''16 a''16 gs''16 ]  fs''16 [  a''16 fs''16 (  es''16 ]  |  % 13
 fs''16 )  [  b''16 fs''16 (  es''16 ]  fs''16 )  [  cs'''16 fs''16 (  es''16 ]  |  % 14
 fs''16 )  [  d'''16 fs''16 (  es''16 ]  fs''16 )  [  d'''16 cs'''16 b''16 ]  |  % 15
 cs'''16 [  a''16 gs''16 fs''16 ]  a''8 [  gs''8^\markup{\italic{ tr }}  ]  |  % 16
 fs''4 \bar ":..:"  % 17
 \partial 4 fs''8 [  a''16 fs''16 ]  |  % 19
 cs''8 [  fs''16 cs''16 ]  a'8 [  cs''16 a'16 ]  |  % 20
 fs'4 c''8 (  [  b'8 )  ]  |  % 21
 e''8 (  [  ds''16 )  fs''16 ]  a''8 [  g''16 fs''16 ]  |  % 22
 g''8 [  e''8 ]  g''8 [  b''16 g''16 ]  |  % 23
 e''8 [  g''16 e''16 ]  cs''8 [  e''16 cs''16 ]  |  % 24
 a'4 ~  a'16 [  d''16 fs''16 d''16 ]  |  % 25
 e''16 [  d''16 e''16 d''16 ]  cs''16 [  e''16 g''16 e''16 ]  |  % 26
 fs''16 [  e''16 fs''16 e''16 ]  d''16 [  fs''16 d''16 (  cs''16 ]  |  % 27
 d''16 )  [  g''16 d''16 (  cs''16 ]  d''16 )  [  a''16 d''16 (  cs''16 ]  |  % 28
 d''16 )  [  b''16 d''16 (  cs''16 ]  d''16 )  [  b''16 a''16 g''16 ]  |  % 29
 a''16 [  fs''16 e''16 d''16 ]  fs''8 [  e''8^\markup{\italic{ tr }}  ]  |  % 30
 d''4 fs''8-. [  fs''8-. ]  |  % 31
 fs''8-. [  fs''8-. ]  d'''8 [  fs''8 ]  |  % 32
 fs''8^\markup{\italic{ tr }}  [  e''8 ]  e''8-. [  e''8-. ]  |  % 33
 e''8 [  e''8 cs'''8 e''8 ]  |  % 34
 e''8^\markup{\italic{ tr }}  [  d''8 ]  b''8 [  d'''16 b''16 ]  |  % 35
 \acciaccatura {  a''8 (  }  g''4 ~  )  g''8 [  b''32 (  a''32 g''32 fs''32 )  ]  |  % 36
 e''4 ~  e''8 [  g''32 (  fs''32 e''32 d''32 )  ]  |  % 37
 c''16 [  e''16 g''16 e''16 ]  c''16 (  [  b'16 )  c''16 (  b'16 )  ]  |  % 38
 as'8-. [  fs'8-. ]  g'8 (  [  fs'8 )  ]  |  % 39
 b'8 (  [  as'16 )  cs''16 ]  e''8 [  d''16 cs''16 ]  |  % 40
 d''8 [  b'32 (  cs''32 d''32 e''32 ]  fs''8 )  [  d''16 fs''16 ]  |  % 41
 b''8 [  fs''8 ]  e''16 [  d''16 cs''16 d''16 ]  |  % 42
 \acciaccatura {  cs''8 (  }  b'4 )  \bar "|."
}

% Only include score block when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \score {
      \new Staff { \Bach_Badinerie }
      \layout { }
      \header { piece = "Bach Badinerie" }
    }
  #})

%{
convert-ly (GNU LilyPond) 2.19.53  convert-ly: Processing `'...
Applying conversion: 2.13.0, 2.13.1, 2.13.4, 2.13.10, 2.13.16,
2.13.18, 2.13.20, 2.13.27, 2.13.29, 2.13.31, 2.13.36, 2.13.39,
2.13.40, 2.13.42, 2.13.44, 2.13.46, 2.13.48, 2.13.51, 2.14.0, 2.15.7,
2.15.9, 2.15.10, 2.15.16, 2.15.17, 2.15.18, 2.15.19, 2.15.20, 2.15.25,
2.15.32, 2.15.39, 2.15.40, 2.15.42, 2.15.43, 2.16.0, 2.17.0, 2.17.4,
2.17.5, 2.17.6, 2.17.11, 2.17.14, 2.17.15, 2.17.18, 2.17.19, 2.17.20,
2.17.25, 2.17.27, 2.17.29, 2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11,
2.19.16, 2.19.22, 2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40,
2.19.46, 2.19.49
%}
