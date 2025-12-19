\version "2.19.11"
\include "../common/includes.ly"
\include "../common/markups.ly"

\header {
  title = "Tchavolo Swing"
  subtitle = "from the movie Latcho drom (1993)"
  composer = "Dorado Schmitt"
  poet = "marc@mouries.net"
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=200
}

chordNames = \chordmode {
  \global
  d4:m s4 c4 s4   bf4 s4 a4:7 s4
  d4:m s4 c4 s4   bf4 s4 a4:7 s4
  d4:m s4 c4 s4   bf4 s4 a4:7 a4:7
a1:7 a1:7
d1:m9  d1:m9   d1:m9  d1:m9
  d1:m9  d1:m    g1:m6  g1:m6
  a1:7   a1:7    a1:7   a1:7
  a1:7   a1:7    d1:m   a1:7
  d1:m   d1:m    d1:m   d1:m
  d1:7   d1:7    g1:m6  g1:m6
  ef1:7  ef1:7   d1:m   d1:m9
  bf1:7  a1:7    d1:m   d1:m9
}

partB = {
  c,2 e2
  g2 e4 e4
  f2 g4_3 gs4_3
  a2_3 r2
  a,8 bf cs e g a bf cs e g a bf
  r r r r 
  \break
   c,,2 e2
  g2 e4 e4
  f2 g4_3 gs4_3
  a2_3 r2
}

melody = \relative c'' {
  \global
  r1
r2  r8 a( b cs)
  d4 r c r
  bf4
  %\tuplet 3/2 {bf 8( c bf) }
  r8 a8 ~ a8  a8( b cs)
  d4 r c r
  %\break
    \sectionLetter "A"

  bf4
  %\tuplet 3/2 {bf 8( c bf) }
  r8 a8 ~ a8  a8 \glissando a'4

  r1
r1
\sectionLetter "A"
  r2 r4 \tuplet 3/2 {e,8( f e }
  %\break
  d8) e( f ) a( d) f( a4)
  d4\downbow a8 d a( f d4)
  f4 r8 f8 ~ f4 r4
  r2 r4 \tuplet 3/2 {e,8( f e }
  %\break
  d8) e( f) a( d) f( a4)
  d4 a8 d a( f d4)
  e4 r8 e8 ~ e4 r4
  r4 e'2-4 d4-3\downbow 
 % \break
  \tuplet 3/2 {d8( e d} cs4) cs\downbow bf8\downbow bf8 ~
  bf2 r8 a4-3 a8
  a4(\acciaccatura bf8 )
  g4 g f8 f8 ~
  f2 \acciaccatura {g16\upbow f} e8 f g a
 % \break
  g f e d cs c b bf
  a g f e g f \tuplet 3/2 {e8( f e }
  d) e f a d4 d8 b! ~
  b4 b r4 \tuplet 3/2 {e,8( f e }
\sectionLetter "B"
  d8) e( f) a( d) f( a4)

  d4\downbow a8 d a( f d4)
  f4 r8 f8 ~ f4 r4
  r8 d8 ~ d4( ef4) d
  %\break
  \grace d8 \glissSize #5  ef2-3 d4 cs4
  d2   \tuplet 3/2 {d4( fs a4)}
  c2 ~ c8 c8( bf8) a8
  bf2 r2
  %\break
  r8 a\downbow( bf) c(  bf)
     a( bf) c(  bf)
     a( bf) c(  bf4)
     a4\upbow
 a8\upbow d8 ~ d2
 r4
 d,2 e2
 %\break
 f1
 e2 cs8 e cs
 d8
 d4 d4 ~ d8 d8 a'4\flageolet
  r2 r4 \tuplet 3/2 {e,8( f e }
 % \break
  d8) e( f ) a( d) f( a4)
  d4\downbow a8 d a( f d4)
  f4 r8 f8 ~ f4 r4
  r2 r4 \tuplet 3/2 {e,8( f e }
 % \break
  d8) e( f) a( d) f( a4)
  d4 a8 d a( f d4)
  e4 r8 e8 ~ e4 r4
  r4 e'2-4 d4-3\downbow
 % \break
  \tuplet 3/2 {d8( e d} cs4) cs\downbow bf8\downbow bf8 ~
  bf2 r8 a4-3 a8
  a4 (
  \acciaccatura bf8 )
  g4 g f8 f8 ~
  f2 \acciaccatura {g16\upbow f} e8 f g a
 % \break
  g f e d cs c b bf
  a gs g f 
  e f d e
  f a d f a4 r4
  d1 ~
 % \break 
  d1 ~ d1
  g4 r4 <a,, e'>^"pizz" 
  r 
  %\break
  r4 a'2 bf8 b 
  c2 a8 c a fs
  ef fs ef c a2
  r4 r4 \appoggiatura {bf,16 a} g8 a bf d
 % \break
  g8 bf d4 d4 r4
  r4 ef,16 f ef d ef8 g bf ef8
  f8 bf f e! bf8 a4.
  a'2 f4 d4
  %\break
  a2 d4 e4
  f1
  e2 cs8 e cs4
  d8 d8 d4 d2
%\break
r1
\sectionLetter "C"

\partB

}

words = \lyricmode {}

\include "../common/score.ly"