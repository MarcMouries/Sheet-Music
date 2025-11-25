\include "includes.ly"
\include "markups.ly"

\header {
  title = "Daphné"
}

global = {
  \time 4/4
  \tempo 4=100
}

chordsPartA = \chordmode {
   \sectionLetter "A"
   d2   b:m7   e:m7   a:7
   d2   b:m7   e:m7   a:7
   d2   d      g      bf:7
   d1          d1
}
chordsPartB = \chordmode {
   \sectionLetter "B"
   ef2  c:m7   f:m7   bf:7
   ef2  c:m7   f:m7   bf:7
   ef2  c:m7   f:m7   bf:7
   ef1         a1:7
}
chordNames = \chordmode {
  \global
  \chordsPartA
  \chordsPartA
  \chordsPartB
  \chordsPartA
}

introHarmonics =  {
\harmonicsOn
a 4-2  r g4-1  r e'4-2  r8 d8 ~ d4-1  r
\harmonicsOff
}

melodyPartA = {
\introHarmonics
\introHarmonics
d,2 fs g gs
a'4  af g f8 fs ~ fs d b4 d4  r4
}
melodyPartB = {
  d4 \tuplet 3/2 {c8( d c) } bf8 g8 ef d
  d'8 c d8 c8 ~ c4 r8.
  d16-4 \glissSize #5 ef2 d4 c d\upbow c8 bf8 ~ bf4 r4
  bf8 c   d  ef\db( d  c  bf) a (
  af) f d bf\db( af)  bf d f
  ef f16( ef) d8 f8 b4 d8.\upbow (cs16
  a4
  \override Glissando.style = #'zigzag
   a'2-4\flageolet \glissando a,4)
   



}
melody = \relative c'' {
 \key c \major
 \melodyPartA
 \melodyPartA
 \melodyPartB
 \melodyPartA
}

\include "score.ly"


\markup "practice"
\relative c'' {
  bf8 c(  d)  ef\db( d  c  bf) a (
  af) f d bf af\db  bf d f
  ef f8( ef) d8 f8 b d8\upbow (cs)
}
\relative c'' {
  bf8( c)   d  ef\db( d  c  bf) a (
  af) f d bf af\db  bf d f
  ef f8( ef) d8 f8 b d8\upbow (cs)
}