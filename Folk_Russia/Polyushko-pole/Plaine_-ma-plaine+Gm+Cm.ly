\version "2.19.7"
\language "english"
\include "../../common/violin-functions.ly"
\paper {   indent = 0\cm}
%#(set-global-staff-size 22)

\header {
  title     = "Polyushko-polye"
  subsubtitle = \markup{\center-column {
"Plaine, ma plaine (French)"
    "The Cossack Patrol (English)"                   }}
  source    = "Russian"
  %composer  = "Lev Knipper (1898-1974)"
  enteredby = "Marc"
  tagline   = ""
  composer = \markup{
    \line
    {\italic "Lev Knipper (1898-1974)"}}
 arranger =  "Composed in 1934"
}

chordNames_Gm = \chordmode {
  g1:m d1:m g1:m  d1
  ef1   d1  ef1    d1
}
chordNames_Cm = \chordmode {
  c1:m  g1:m  c1:m  g1
  af1   g1   af1    g1
}


melody_Gm = \relative d'' {
  \set Staff.midiInstrument = #"violin"
  \key g \minor
  \time 4/4
   bf2 g4 bf
   a2 f4  d
   bf'8 a g f g4 d'4
   a2 d,2
   \break
   g4 f8 ef d c d ef
   d4 a' fs d
   g4 f8 ef d c d ef
   d2 r16 d cs d e fs g a
}


\markup "in Gm"
\score {
  <<
    \new ChordNames { \chordNames}
    \new Staff      { \melody    }
  >>
  \layout { }
}

melody_Dm = \relative d'' {
  \set Staff.midiInstrument = #"violin"
  \key g \minor
  \time 4/4
   ef2_4^"sul G" c4 ef
   d2_3 bf4-\shiftDown"3" g4
   ef'8-\shiftDown"4" d c bf c4 g'4-\shiftDown"3"
   d2-\shiftDown"3" g,2
   \break
   c4 bf8 af g f g af
   g4 d' b g
   c4 bf8 af g f g af
   g1
}
\markup "in Dm"
\score {
  <<
    \new ChordNames { \chordNames_Dm}
    \new Staff      { \melody_Dm }
  >>
  \layout { }
}