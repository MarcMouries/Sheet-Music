\version "2.19.18"
\language "english"
\include "../../common/violin-functions.ly"

\header {
  title = "Si Tu Savais"
  composer = "Django Reinhardt"
  country = "France"
  genre = "Jazz"

  subgenre = "Gypsy Jazz"
}

\include "../../common/common-header.ily"

global = {
  \time 4/4
  \key b \minor
  \tempo 4=100
}

chordNames = \chordmode {
 % \global
  b2:m c2:9   b2:m c2:9 
  b2:m c2:9   b2:m c2:9 

}

\relative c' {
  \time 4/4
  \override Glissando.style = #'zigzag
  c4 e g
  \cadenzaOn
  c4\glissando
  \hideNotes
  c,4
  \unHideNotes
  \cadenzaOff
  %\bar "|"
  c e g c
}

melody = \relative c'' {
        \set midiInstrument = #"violin"
%           \set Staff.midiInstrument = #"violin" \melody

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
  r4 r r r 
  \break  
  r4 r r r 
  r4 r r r
  b2 r2
  r1
  \break
\mark "Violin"
  r4 \tuplet 3/2 {b,8 cs d} \grace fs \glissSize 3 a4. r8
  r8 \acciaccatura {g16 a g} fs8 
  \tuplet 3/2 {d8 fs d} \grace es8 \glissSize 3 fs2  
  r8 d'16[( \glissando cs] \glissando 
  \tuplet 3/2 {d8 )cs b  \grace c \glissando} 
    cs16.  b32 cs16 b 
    cs b a g  
    
  a8._"\whaling" g16 a16 g a fs g4   r4

      \break

   r4 \appoggiatura {fs16 g fs}  
     f16 f  fs f fs!8 fs16 d fs8 d8
\glissSize 5
  f16 f e d b8 b' b4 r4
  r4   \tuplet 3/2 { d8 cs b } d16. d32 cs16 b \tuplet 3/2 { d8 cs b } 
  a'4 \tuplet 3/2 { g16 a g } fs e
  d16 cs b a   g fs e d 
  b4 b16 cs d fs a4 r 
 r8 a'16 \glissSize5 gs \tuplet 3/2 { g8 fs d }
  \tuplet 3/2 { f-3 g e } f  e ~e4
%   r8 b8 cs16 d fs b cs2
%   \break
%   b8. a16  b16 a b a g16 g g8 ~ g4 
%   r8 fs b16. fs32 d16 b 
%   \tuplet 3/2 { f'8 e f } f8 cs16 d
%   \tuplet 3/2 {cs8 b b}   
%   \tuplet 3/2 {d8 d b~} b4 r4
%   r8 d8 ~ d16 e cs d  b16 cs8. a16 cs8.
%   b2. r4
  
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
  \midi {}
}

