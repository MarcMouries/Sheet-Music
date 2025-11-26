\version "2.24.4"
\language "english"

\header {
  title    = "Nessun dorma"
  subtitle = "dall'opera \"Turandot\""
  composer = "Giacomo Puccini"
  poet     = "Giuseppe Adami, Renato Simoni"
    style = "classical"
  tagline  = ""
}

\markup \large ""

global = {
  \key g \major
  \time 4/4
}

global = {
  \time 4/4
  \key g \major
}


melody = \relative c'' {
  \autoBeamOff
  \global
  r2 r4 d8. d16  
  | d4 d4 r4 d,8. d16  d4 d4 r2
  \break
  | r4 r8 d'8 d8 d8 d8. c16
  | b4 b4 c4 c 
  | c c c c 
  | g f c c
  \break
  | d'4 d8 d8 d8 d8 d8. cs16 
  | b4 b4. b8 bf8. fs16
  | g4 g ~g8 r8 r4
  \break
  
  r8 d'8 e fs e d e8. cs16
  \time 2/4 b2
  
  \time 4/4 
  | r8 e8 fs g fs e fs8. d16
  \break
  | cs4 d4  e8 e8 fs8 g8 
  | a2 a4 a8. fs16
  | fs2 ~ fs8 fs8 fs8. d16
  \break
  | a2 a4 e'8. cs16 
  | d4 d8 r8 r2
  | r2 r8 d8 d8. c16
  \break
  | b8 b8 b8 d8 fs4. e8
  | d4 d4 ~ d8 b8 bf8. fs16
  | g4 g4 r2
  \break
  | r1
  \time 2/4 r2
  \time 4/4 
  r1
  \break
  
  r4 r r
  r4 r r r
  r4 r r r
  
  
  c4 
  \break
  c c c c c c c c c c c c c c c
  c4 c c c c c c c c c c c c c c c

}

tenoreLyrics = \lyricmode {
  Nes -- sun dor -- ma!
  Nes -- sun dor -- ma!
  Tu pure, o Prin -- ci -- pes -- sa,
  nel -- la tua fred -- da stan -- za 
  guar -- di le stel -- le 
  che tre -- ma -- no d'a -- mo -- re e di spe -- ran -- za!
  
  Ma-il mio mi -- ste -- ro è chiu -- so in me, 
  il no -- me mio nes -- sun sa -- prà! 
  So -- lo quan -- do la lu -- ce splen -- de -- rà, 
  sul -- la tua boc -- ca lo di -- rò fre -- men -- te!
  
  Ed il mio ba -- cio scio -- glie -- rà il si -- len -- zio 
  che ti fa mia! 
  
  Di -- le -- gua, o not -- te! 
  Tra -- mon -- ta -- te, stel -- le! 
  Tra -- mon -- ta -- te, stel -- le! 
  Al -- l'al -- ba vin -- ce -- rò! 
  Vin -- ce -- rò! Vin -- ce -- rò!
  
}

chordNames = \chordmode {
  \global
  g1:9
  c1 c1 c1 c1 c1 c1 c1 c1 c1 c1 
  c2 c1 c1 c1 c1 c1 
  c1 c1 c1 c1 c1 
  d2 d2 
  g2
  e2:m g:maj7
  a4 b:m7 a4 a:7
  d1 
  e1:m 
  
  
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
   % \addlyrics { \tenoreLyrics }
  >>
  \layout { }
  \midi { }
}
