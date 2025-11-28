\version "2.19.53"
\language "english"
\include "../../stylesheets/bars-per-line-engraver.ly"





\header {
  title = "Blues en Mineur"
  subtitle = "1949 Rome"
  composer = "Django Reinhardt"
  country = "France"
  style = "gypsy jazz"
  video = "https://www.youtube.com/watch?v=EfnYL_lGSP0"
  tagline = ""
}


\markup "intro"
\relative c' {
  g4 r4 bf r4
  a r8 d8 r8 c bf a
  g4 r4 bf r4
  a r8 d8 r8 c bf a
}

\relative c''' {
  bf8 a( g) d( bf) a( g) d 
  b'4 g8 d8 ~ d4 r8 g bf d g bf

}

\relative c''' {
  g f d b
  af g f d b d f 
  g af b d f  
}
\relative c'' {
    fs8 g a gs 
    g8 fs! a fs( f) e( g) e
  ef8 d( cs) c( bf8) bf8( a8) g~ g
  
  a bf bf c cs d ef e g e f fs a fs

  
}

global = {
  \time 4/4
  \key c \major
}

chordNames = \chordmode {
  \global
  d1:7  d:7  g:m  d:7 

  g:m  g:m  g:m  g:m 
  c:m  c:m  g:m  g:m 
  d:7  d:7  g:m  d:7 

  g:m  g:m  g:m  g:m 
  c:m  c:m  g:m  g:m 
  d:7  d:7  g:m  d:7 
  
  g:m  g:m  g:m  g:m 
  c:m  c:m  g:m  g:m 
  d:7  d:7  g:m  d:7 
  
  g:m  g:m  g:m  g:m 
  c:m  c:m  g:m  g:m 
  d:7  d:7  g:m  d:7 

}

%% GUITAR %%
guitarNotes = \relative c'' {
 


r4 r4 r4 r4 
r4  r8 
d'16( c bf8) g d bf 
  \tuplet 3/2 {c8( d c) }
  bf8 g bf4 fs'8 g8 ~ g8 g4  g8 
  r8  
   }

\addQuote "guitar" { \guitarNotes }

melody = \relative c'' {
  \global
    \set Score.currentBarNumber = #63
   % \set Score.currentBarNumber = #25
   
     \mark "Guitar"
\guitarNotes
  \mark "Violin"
  cs8-1 \glissando d[ g] 
  d c bf g d a'4 d,8( 
  g8) d bf4 d4 r4
    
  r4 r8 \tuplet 3/2 {g'16( a g}  fs8) g bf a
  
  g f d b! af  g f d
  ef d16 ef ef'8 d cs c b! bf
  a \appoggiatura {f'16 g} f8 e ef d c a fs
  g4  r8 d g d c bf  
 g8 d'4 d8 ~ d4 r4
  r4 f'4\upbow ~ f4 ~ f8 ef\trill
  d8 g d c bf g bf4
  g8 g8( g8) g8( g4) r4
  r8 d'~d8 d8 ~ d8 d8 ~d8 r8 
  d 16( c bf a g8) d( ef8) r4 d8
  d'16( c bf a g8) d( ef8) r4 d8
  d'16( c bf a g8) d( ef8) r8 
  
  d'8   cs(  c) af( g) f af! b d b 
  c4 r r4 g'8 g
  bf a( g) fs a gs g ef
  d cs c a bf g ef d 
  g4 r8 f'8~ f8  f ~ f ef8\trill
  d8 d8( d8) d8( d4) r4
  r bf'2( bf8) g
  bf a( g) d( bf) a( g) d 
  b'4 g8 d8 ~ d4 r4
  r8 d'' r8 d8 d4 d8 bf bf bf bf bf4 r8 g8 g8 
  bf a( g) d~ d bf a as b d f af g f d ef 
  
  c4 ~ c8 df16 c b!8 c bf' af
  g8 f ef c bf c df ef
  d4 ~ d8 bf8 ~ bf8 d4 c8 
  bf8 a g d g4 r4
  r8 \tuplet 3/2 {ef16( d ef}  d8) ef 
  ef' d c bf 
  a8 g fs a c ef d fs,! 
  g8 g8( g8) g8( g4) r4
  r8 <d' bf'> ~ <d bf'> <d bf'> ~ <d bf'>
  <d bf'> ~ <d bf'> a8 
  <d bf'>8 <d bf'> <d bf'>4 <d bf'>8 r8 r4
  r8 g8 r8 g8 bf8 a g d
  bf8 a g4 ~ g8  g4 g8 
  g4 r4 bf'-2 \glissando d-2
  \tuplet 3/2 {f f f } f2 ~
  f2 e8 f e f
  d8 d8( d8) d8( d2)
  r4 r8 \tuplet 3/2 {g,16( a g}  fs8) g a gs 
  g fs! a fs( f) e( g) e
  ef8 d( cs) c( bf8) bf8( a8) g( 
  g) d cs d ef e f fs 
  g8 r8 d'-4\flageolet  g4-3\flageolet r4 r8
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