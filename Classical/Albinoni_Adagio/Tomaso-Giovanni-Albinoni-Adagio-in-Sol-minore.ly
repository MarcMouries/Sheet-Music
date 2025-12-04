\version "2.24.0"
\include "english.ly"

%#(set-global-staff-size 16.075)

\header {
  title     = \markup \bold \italic "Adagio in Sol minore"
  subtitle  = \markup \center-column {
    "per archi e organo su due spunti tematici"
    "e su un basso numerato di tomaso albinoni"
    }
  composer  = \markup \center-column {
    "Tomaso Giovanni Albinoni (1671-1751)"
    "Remo Giazotto (1910-1998)"
    }
}


\markup \bold "PRACTICE Adagio Arpeggio"

Adagio_Arpeggio_Cm_Fm = \relative c'' {
 g8-3    c  ef g
 ef   c  g  c
 ef-1   g-3  c-2  ef-4 
 c g ef c 
 \break
 c,-3    f  af c
 af   f  c  f
 af-1   c-3  f-2  af-4 
 f c af f 
}
\score {
  \new Staff { \Adagio_Arpeggio_Cm_Fm }
  \layout {indent=0 }
}


global = {
 \clef "treble"
 \key g \minor
 %\numericTimeSignature
 \compressEmptyMeasures
 \time 3/4
 \tempo "Adagio " 4 = 66
}

chordNames = \chordmode {
  \global  
}

melody = \relative c'' {
\global

g2.\p  ~   % 1
\repeat volta 2 {
 g2. |  % 2
 g16 (  [  a16 ]  bf4. ~  bf8 [  g8 )  ]  |  % 3
 g2. |  % 4
 a16 (  [  bf16 ]  c4. ~  c4 )  |  % 5
 bf16 (  [  a16 ]  bf4. ~  bf4 )  |  % 6
 a16 (  [  g16 ]  a4. ~ \times 2/3 {  a8 [  g8 fs8 )  ]  }  |  % 7
 g2. |  % 8
 d'4^\markup{\italic{    dolce, ma pieno }}  (  c8. )  [  bf16 ]  a8. (  [  g16 )  ]  |  % 9
 g2 (  fs4 )  |  % 10
 ef'4 (  d8. )  [  c16 ]  bf8. (  [  a16 )  ]  |  % 11
 a2 (  g4 )  |  % 12
 g'4 (  f8 [  g8 )  ] \times 2/3 {  ef8 (  [  f8 d8 )  ]  }  |  % 13
 ef2. |  % 14
 f4 (  ef8 [  f8 )  ] \times 2/3 {  d8 (  [  ef8 c8 )  ]  }  |  % 15
 d2. |  % 16
 ef4 (  d8 [  ef8 )  ] \times 2/3 {  c8 (  [  d8 bf8 )  ]  }  |  % 17
 \break
 c2. |  % 18
 d2 ( \<  ef4 ) \! \>  |  % 19
 d2\fermata \! \p  r8  g8 |  % 20
 a8_\markup{\italic{ poco fraseggiando }}  (  [  bf8 )  ]  a8 (  [  g8 )  ]  fs8 (  [  g8 )  ]  |  % 21
 f2. |  % 22
 ef4. (  c8 )  ef8. (  [  g16 )  ]  |  % 23
 \break
 d4. (  bf8 )  d8. (  [  g16 )  ]  |  % 24
 c,4. c16 (  [  d16 ]  ef8 [  d16 c16 )  ]  |  % 25
 bf4. bf16 (  [  c16 ]  d8 [  c16 bf16 )  ]  |  % 26
 a4. a16 (  [  bf16 ]  c8 [  bf16 a16 )  ]  |  % 27
% *** |Ending|Endings:1 ***
}
\alternative {
 {g2.}
 {g2. ~}
}
% *** |Ending|Endings:2 ***
   % 28
 g4. g8 af16  g  fs  g  
 f16(  ef )  d ef 
 f16(  ef )  d ef
 d c b c d2. 
 r4 r8  g8( af16  g ) fs  g  
 f16(  ef )  d ef 
 f16(  ef )  d ef
 ef d c b 
 \break
 c4. \fermata g8 c16 ef g c
 ef16 c  g  ef 
 g    c  ef g
 ef   c  g  c
 ef-1   g-3  c-2  ef-4 
 c g ef c
 ef g c ef-1 
 g4\fermata r2
 r4. c,,8 (  df16 c ) b  c   
\break
bf  af  g af 
 bf af g af
 g f e f
 g2. 
 r4 r8 c8   df16( c )
 b ( c   
 bf ) af  g af 
 bf af g af
 af g f ef
 \break
 f4. \fermata af,8 c16 f
 af  c af f  c  f
 af-1   c  f  af 
 f c af f-3
 af c f af 
 c af f c
 f af   c  f  
 af4\fermata r2
 r4  r8  c,,8 (  d8 [  ef8 ]  |  % 37
\break
 ef16 ) d (  f16 ) ef 
 ef  (  d) d c 
 c   (  b) b c
 b32 c d8. ~ d4. c8
 c2.
 c2.^"orchestra"
 c2. |  % 42
\break
 c16 (  [  d16 ef8 ~  ]  ef4. c8 )  |  % 43
 c2. |  % 44
 d16 (  [  ef16 f8 ~  ]  f2 )  |  % 45
 ef16 (  [  d16 ef8 ~  ]  ef2 )  |  % 46
 d16   [  c16 d8 ~  ]  d4  \times 2/3 {d8 c b }   c2.
 \break
 g'4\f  (  f8. )  [  ef16 ]  d8. (  [  c16 )  ]  |  % 49
 c2 b4 |  % 50
 af'4 (  g8. )  [  f16 ]  ef8. (  [  d16 )  ]  |  % 51
 d2\<  c4 |  % 52
 c'4\! \ff  (  bf8 [  c8 )  ] \times 2/3 {  af8 (  [  bf8 g8 )  ]  }  |  % 53
 af2. |  % 54
 bf4 (  af8 [  bf8 )  ] \times 2/3 {  g8 [  af8 f8 ]  }  |  % 55
 g2.\>  |  % 56
 f2.\! \mf  ~  |  % 57
 f4. f8 d8. (  [  bf16 )  ]  |  % 58
 bf4 r4  r4  |  % 59
 r4  r8  f'8 d8. [  bf16 ]  |  % 60
 bf4 r4  r4  |  % 61
 bf2.\fermata \>  |  % 62
 bf'4^\markup{\italic{ solo }} \! \p  ~  bf16 [  a16 (  g16 f16 ]  ef16 [  d16 c16 bf16 ]  |  % 63
 g8 )  g'4.^\markup{\italic{ tutti }} \f  ~ \times 2/3 {  g8 [  ef8 c8 ]  }  |  % 64
 bf2^\markup{\italic{   a tempo }}  (  af4 )  |  % 65
 f'2 ~ \times 2/3 {  f8 [  d8 bf8 ]  }  |  % 66
 af4 (  g2 )  |  % 67
 f2. |  % 68
 g4. (  c8 )  g8. (  [  ef16 ]  |  % 69
 c4. )  r8  r4  |  % 70
 c4. (  c'8 )  bf8. (  [  g16 )  ]  |  % 71
 c,4. r8  r4  |  % 72
 r4  r8  c'8\f  b8 (  [  c8 )  ]  |  % 73
 df4. df16 (  [  ef16 ]  f8 [  ef16 df16 )  ]  |  % 74
 c2\fermata  r8  c'8\ff  |  % 75
 d8_\markup{\italic{   senza fraseggiare }}  [  ef8 ]  d8 [  c8 ]  b8 [  c8 ]  |  % 76
 bf4. bf16 (  [  c16 ]  df8 [  c16 bf16 )  ]  |  % 77
 af4. (  f8 )  af8. (  [  c16 )  ]  |  % 78
 g4. (  ef8 )  g8. (  [  c16 )  ]  |  % 79
 f,4. f16 (  [  g16 ]  af8 [  g16 f16 )  ]  |  % 80
 ef4. ef16 (  [  f16 ]  g8 [  f16 ef16 )  ]  |  % 81
 d4. d16 (  [  ef16 ]  f8 [  ef16 d16 )  ]  |  % 82
 c2. ~  |  % 83
 c2. |  % 84
 c16 (  [  d16 ]  ef4.\fermata  )  r8  ef8\ff  \bar "||"  % 85
 d2. |  % 86
 f2 r8  f8 |  % 87
 ef2. |  % 88
 g2 r8  g8 |  % 89
 g4 (  f2 )  |  % 90
 ef2 r8  ef8 |  % 91
 ef4 (  cs2 )  |  % 92
 d2.\fermata \>  |  % 93
 a'2\! \f  r8  a8\ff  |  % 94
 a4 (  g2 )  |  % 95
 f2 r8  f8 |  % 96
 f4 (  ef2 )  |  % 97
 bf2\>  r8  bf8 \bar "||"  % 98
 bf2.\! \mf  |  % 99
 a16 (  [  bf16 c8 ~  ]  c2 )  |  % 100
 bf16_\markup{\italic{ dim. }}  (  [  a16 bf8 ~  ]  bf2 )  |  % 101
 a16 (  [  g16 ]  a4. ~ \times 2/3 {  a8 )  [  g8 (  fs8 )  ]  }  |  % 102
 r4  r8  d8\p  bf16 (  [  d16 g16 bf16 ]  |  % 103
 d16 [  g,16 bf16 d16 )  ]  g2\fermata  \bar "|."  % 104
 \bar "|."
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
     \midi {
      \context {
	\Score
	tempoWholesPerMinute = #(ly:make-moment 66 4)
      }
    }
  }

%{
convert-ly (GNU LilyPond) 2.24.1  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
