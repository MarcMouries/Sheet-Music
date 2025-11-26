\version "2.19.18"
\language "english"

\header {
 title = "Si Tu Savais"
  style = "gypsy jazz"
}

global = {
  \time 4/4
  \key b \minor
  \tempo 4=100
}

chordNames = \chordmode {
 % \global
  b1:m
}

melody = \relative c'' {
  \global
  r1 r1
 \acciaccatura a8
 b8 cs d a' ~ a4. \tuplet 3/2 {g16( a g)}
 fs8 d b f'8 ~ f4 r4
 \break
  r8. b,16 ~ \tuplet 3/2 {b8 cs d} \acciaccatura a'8 b4. bf8
  \acciaccatura {a8 bf} a8 bf!16 b
  \tuplet 3/2 {a16( b a)} af8 g2
  r4 fs16 g   \tuplet 3/2 {fs16( g fs)} e8 fs8 ~ fs8 e8
  d8 b4 b'8 b,16 b8. ~ b4
  r4 

  r4 r r r 
  \break  
  r4 r r r 
  r4 r r r 
  b2 r2
\mark "Violin"
  r4 \tuplet 3/2 {b8 cs d} \grace fs a4 r4
\break
  \stemDown \grace {g8  af8  } 
  \tuplet 3/2 {g4 fs8} 
  \tuplet 3/2 {d8 fs d} \grace e8 \glissando fs4  r 
  r8 d16( \glissando cs \glissando \tuplet 3/2 {d8 )cs b \glissando} 
    cs16 b cs b 
    cs b a g
  a8. g16 a8 g a  
}
melodyB = \relative c'' {
  \global
  r1 r1
 \acciaccatura a8
 b8 cs d a' ~ a4. \tuplet 3/2 {g16( a g)}
 fs8 d b f'8 ~ f4 r4
 \break
  r8. b,16 ~ \tuplet 3/2 {b8 cs d} \acciaccatura a'8 b4. bf8
  \acciaccatura {a8 bf} a8 bf16 b
  \tuplet 3/2 {a16( b a)} af8 g2
}

\score {
  <<
    \new ChordNames {\chordNames}
    \new Staff       { \melody }
  >>
  \layout { }
}


\score {
  <<
    \new ChordNames {\chordNames}
    \new Staff      { \melodyB }
  >>
  \layout { }
}