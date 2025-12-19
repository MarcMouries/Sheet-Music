\version "2.19.82"
\language "english"

\header {
  title = "Yarou, Yarou"
  composer = "Traditional Hungarian"
  country = "Hungary"
  style = "czardas"
}

\include "../../common/common-header.ily"

global = {
  \time 2/4
  \key d \major
  \tempo 4=120
}

chordNames = \chordmode {
  \global
  s4.
  d2 fs:7 b:m b:7m  b:7m b:7 e:m e:m
  a:7

}

violin_solo = \relative c'' {
  \global
  \repeat volta 2 {
  \partial 4.
  es8[ fs b]
  d4 d cs as cs b ~
  b8  fs es fs b4. c8
  b8 a g fs
  e2 ~
  e8 e fs g
  \break
  a4. g8 a4. g8
  g4 fs ~ fs8   es8[ fs b]
  d4 cs b as
  }
  \alternative {
    {  b2 ~ b8}
    {  b2 ~ b4 r4\fermata}
  }
  \break
  
  %-----------
  % ANDANTE
  %-----------
  \time 3/4 
  \mark  "Andante"
  \partial 8 fs16 fs^"(à la tzigane)"

  fs2\fermata d8 as 
  cs4 b4. b'8
  b4. fs8 d b
  cs2 r8 cs8 
  cs16 d e fs a4. g8 
  g4 fs4 r16 d d d
  e4. e8 es[ es] 
  fs4 \breathe fs4. d8
  \bar "||"
  cs4^"VALSE" r4  fs4 ~ fs4
  d4. as8 
  cs4 r4 b4 ~ 
  b4 b'4. b8
  b2 fs4 
  
  \break
  
  b2 a4 g2. ~ g4 r4 r8 cs,8

 % ANDANTE 
 \bar "||" 
 cs16^"Andante" d e fs a4.\fermata g8 
  g4 fs4 r16 d d d
  e4. e8 es[ es] 
  fs4\fermata r8
  \autoBeamOff
  es,8\fermata fs\fermata b\fermata
    \autoBeamOn
\break
  \time 2/4

  d4^"Moderato" d cs as cs b ~
  b8  fs es fs b4. c8
  b8 a g fs
  e2 ~
  e8 \breathe  e8^\markup {\italic "Rall."}[ fs g]
  \break
  a4. g8 a4. g8
  g4 fs\fermata r8   es8[ fs b]
  d4^\markup{\italic "Accelerando"} cs b as
  b2 ~ b8
  
  es8[ fs b]
  \break
  d4^"Allegro" d cs as cs b 
  r8  fs[ es fs] b4. c8
  b8 a g fs
  \break
  e2 ~
  e8 e fs g
  a4. g8 a4. g8
  g4 fs8  r8\fermata   
  \break
  r8 es8[ fs b]
  d4 cs 
    \ottava #1
fs as\fermata b2 ~ b4 
  \ottava #0
b,8 r8
\bar "||"
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \violin_solo }
  >>
  \layout { }
  \midi { }
}
