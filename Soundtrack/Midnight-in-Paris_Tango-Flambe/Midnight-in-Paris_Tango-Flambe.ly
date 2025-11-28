\version "2.19.53"
\language "english"
\include "../../stylesheets/bars-per-line-engraver.ly"

\header {
  title = "Tango Flambe"
  subtitle = "from Midnight in Paris"
  composer = "Novi Novog"
  style = "tango"
  tagline = ""
}


\relative c' {
  g16 a b d_0   g16 a b d   g16 d b a   g16 d b a  
  g16 g g d'_0  d16 d d a'   a16 a d, d   d16 d g, g  
}


global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
    \partial 4 s4

  g1:m   g1:m   a1  a1
  c1:m   c1:m   g1:m  a2 d2
  
  g1:m   g1:m   a1  a1
  c1:m   c1:m   g1:m  a2 d2  
  
  g1:m   g1   c1:m  f1
  bf     ef   c:m   d
  
  g1:m   g1   c1:m  f1
  bf     ef   c:m   d
}

melody = \relative c'' {
  \global
  \partial 4 d,4\fermata \glissando
  \mark "A1"
  g4\staccato r8 a8 bf4 r8 c8 
  d4 r8 d,8   g8 a bf d 
  cs2 e4. f8
  g4.   f8\mordent  e4 \glissando a,4-0
  <ef c'>8 16 16 8 d'8 ef4 ef16( d c d) 
  \tuplet 3/2 {e4 g c,} 
  \tuplet 3/2 {e4 c bf8 c8}
   d4. g16 d b8 d16 bf g8 d
   cs'2 c4( \grace {d16 c}  bf8 \staccato a \staccato)
   
  \mark "A2"
  g4 r8 a8 bf4 r8 c8 
  d4. d,8   g8 a bf d 
  cs2 \grace {d16 cs c cs}  a'4.\open g8
  e4  ~ e16 f16 e d e4 \glissando a,4-0
  <ef c'>8 16 16 8 d'8 ef4 ef16( d c d) 
  \tuplet 3/2 {e4 g c,} 
  \tuplet 3/2 {e4 c bf8 c8}
   d4(~d16 bf d bf ) g4 d
    cs'2 c4( \grace {d16 c}  bf8 \staccato a \staccato)

  \mark "B"
  g4. g8  \tuplet 3/2 {g4 a fs} 
  g2 \tuplet 3/2 {b!4 c d}  
  \grace {ef16( d} e2) g2
  f2 \tuplet 3/2 {c4 d ef} 
  \grace {d16( c}d2) a2-2( \grace {bf16 a)}  
  g2   \tuplet 3/2 {ef'4 d c8 bf8}
  c2 ef,2 
  d8 fs a c ef d  c a
  
  \mark "B2"
  bf4. a8\mordent g4   d  
  g,16 a b d   g16 a b d \tuplet 3/2 {g4 g f}
  ef2( \grace {d16 ef)} g2
  f2 \tuplet 3/2 {c4 d ef} 
  \grace {d16( c}d2) a2( \grace {bf16 a)} 
  g2   \tuplet 3/2 {ef'4 d c8 bf8}
  c2 ef,4. f16 ef
  d8 fs a c ef d  c a
  g1
  cs2 c4( \grace {d16 c)} bf8 a
  
  g4\staccato r8 a8 bf4 r8 c8 
  d4. d,8   g8 a bf d 
  cs2( \grace {d16 cs c cs)} e4. f8
  g4.   f8\trill  e4 \glissando a,4-0
  <ef c'>8 16 16 8 d'8 ef4 ef16( d c d) 
  \tuplet 3/2 {e4 g c,} 
  ef4. d16( c
   d4.) g16 d b8 d16 bf g8 d
   cs'2 c4( \grace {d16 c}  bf8 \staccato a \staccato)
   g4. g16 g  \tuplet 3/2 {g4 a fs} 
   g2 d4  ^"Accordion Solo"g16 a bf c  
   
d8       
 d r4 d8\trill cs16 d f8 ef
 d4 r8 c16 bf a8 bf c g
  a4~a16 gs a b cs bs cs d e ds e f
  g8 f\trill  e r8 r16 a, gs a bf a gs a 
  \grace {b( c d} ef8) ef r d \trill c g f ef
  g8 c,16 d ef8 g c ef d\trill c
  d4 r16 c d c bf\trill  a r8 bf16 a g f
  e2 \grace {f16 fs g} ef4. \grace {f16( ef }d8)
  
  \mark "A1"
  g4\staccato r8 a8 bf4 r8 c8 
  d4. d,8   g8 a bf d 
  cs2 e4. f8
  g4.   f8\mordent  e4 \glissando a,4-0
  <ef c'>8 16 16 8 d'8 ef4 ef16( d c d) 
  \tuplet 3/2 {e4 g c,} 
  \tuplet 3/2 {e4 c bf8 c8}
   d4. g16 d b8 d16 bf g8 d
   cs'2 c4( \grace {d16 c}  bf8 \staccato a \staccato)
   

   
  g4 r4  g,16 a bf d   g16 a bf d 
  cs2 c4( \grace {d16 c}  bf8 \staccato a \staccato)
  g4 r4  g,16 a bf d   g16 a bf d 
  cs2 c4( \grace {d16 c}  bf8 \staccato a \staccato)
  g4
  


  
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff {    \melody }
  >>
\layout {
    \context {
      \Score
      %use the line below to insist on your layout
      %\override NonMusicalPaperColumn.line-break-permission = ##f
      \consists #(bars-per-line-engraver '(4))
    }
  }
}
