\pointAndClickOff
\version "2.24.3"

\header{
  title = "1ere. Gymnopédie"
  composer = "Erik Satie (1866--1925)"
  arranger = "arr. Toshihiko Kawano"
  style = "classical"
  tagline = ""
}

melody = {
  \clef treble
  \time 3/4
  \tempo "Lent et douloureux"
  \key d \major
  R2. R2. R2. R2.
  \relative c'' { r4 fis4\p(\<\downbow a) g\upbow( fis cis) b\downbow( cis d\!) a2.\upbow } 
  \relative c'  { fis2.--~\f\downbow fis2.--~ fis2.--~ fis2.-- } 

  \relative c'' { r4 fis4\p(\<\downbow a) g\upbow( fis cis) b\downbow( cis d\!) a2.\upbow } 
  \relative c'' { cis2.\downbow fis2.\>\upbow e,2.~\downbow e2.~ e2.\! }
  
  \relative c'' { a4\p(\upbow b c) e(\downbow d b) d4(\upbow c b) d2.~\downbow d2 d4\(\upbow }
  \relative c'' { e4\< f g\) a(\downbow c, d)\! e4(\upbow d b) d2.~\>\downbow d2 d4\(\!\upbow }
  \relative c''' { g2.\<\) fis2.\downbow b,4\!(\upbow a b) cis(\downbow d e)  }
  \relative c'' { cis4(\>\upbow d e) fis,2\downbow g4(\!\upbow c2.) d2.\downbow }


%%%%%%%%%%%%%%%%%%%%%%%%%
  R2. R2. R2. R2.
  \pageBreak
  \relative c'' { r4 fis4\p(\<\downbow a) g(\upbow fis cis) b(\downbow cis d\!) a2.\upbow } 
  \relative c'  { fis2.--~\f\downbow fis2.--~ fis2.--~ fis2.-- } 

  \relative c'' { r4 fis4\p(\<\downbow a) g(\upbow fis cis) b(\downbow cis d\!) a2.\upbow } 
  \relative c'' { cis2.\downbow fis2.\>\upbow e,2.~\downbow e2.~ e2.\! }
  
  \relative c'' { a4\p(\upbow b c) e(\downbow d b) d4(\upbow c b) d2.~\downbow d2 d4\(\upbow }
  \relative c'' { e4\< f g\) a(\downbow c, d)\! e4(\upbow d b) d2.~\>\downbow d2 d4\(\!\upbow }
  \relative c''' { g2.\<\) f2.\downbow b,4\!(\upbow c f) e(\downbow d c) }
  \relative c'' { e4(\>\upbow d c) f,2\downbow g4(\!\upbow c2.) d2.\fermata\downbow }
  
  \bar "|."
}


upper = {
  \clef treble
  \time 3/4
  \key d \major
  \relative c' { r4 <b d fis>2    r4 <a cis fis>2   r4 <b d fis>2    r4 <a cis fis>2 }
  \relative c' { r4 <b d fis>2\<  r4 <a cis fis>2   r4 <b d fis>2\!  r4 <a cis fis>2 }
  << \relative c' { fis2.~\f fis2.~ fis2.~ fis2. } \\
     \relative c' { r4 <b d fis>2  r4 <a cis fis>2  r4 <b d fis>2    r4 <a cis fis>2 } >>

  \relative c' { r4 <b d fis>2\<  r4 <a cis fis>2   r4 <b d fis>2\!  r4 <a cis fis>2 }
  \relative c' { r4 <a cis fis>2 r4 <b d fis>2\>    r4 <g b e>2      r4 <b d g>2\!  r4 <f a d>2 }
  s2. s2. s2. s2. s2. 
  s2. s2. s2. s2. s2. 

  \relative c' { r4 <b e g>2\<  r4 <a cis fis>2\!  r4 <b d fis>2  r4 <cis e a>2 }
  \relative c' { r4 <a cis fis a>2\> }
  << \relative c' { r4 d4 <d g>4 } \\ \relative c' {fis2. } >>
  \relative c' { <c e a c>2.\!  <d fis a d>2. }

%%%%%%%%%%%%%%%%%%%%%%%%%
  \relative c' { r4 <b d fis>2   r4 <a cis fis>2    r4 <b d fis>2    r4 <a cis fis>2 }
  \relative c''' { r4 b8[(\< fis d b]) r4 a8[( cis fis a]) r4 b8[( fis d b])\! r4 a8[( cis fis a]) }
  << \relative c''' { r4 b8[( fis d b]) r4 a8[( cis fis a]) r4 b8[( fis d b]) r4 a8[( cis fis a]) } \\
     \relative c' { fis2.~ fis2.~ fis2.~ fis2. } >>

  \relative c''' { r4 b8[(\< fis d b]) r4 a8[( cis fis a]) r4 b8[( fis d b])\! r4 a8[( cis fis a]) }

  \relative c'' { r4 cis8[( fis a cis]) r4 fis,8[(\> b d fis]) r4 e,,8[( g b e]) r4 b8[( d g b])\! r4 f,8[( a d f]) }
  
  \relative c''' { r4 a8[(\p e c a]) r4 e8[( g b e]) r4 b'8[( g d b]) r4 c8[( e a c]) r4  c8[( a fis c]) }
  \relative c''' { r4 f8[(\< c a f]) r4 a,8[( c e a])\! r4 d8[( b g d]) r4 c8[(\> e a c]) r4  c8[( a fis c])\! }

  \relative c''' { r4 g8[(\< b e g]) r4 f,8[(a d f])\!  r4 a,,8[(c f a])  r4 c,8[( e a c])  }
  \relative c'' { r4 a8[(\> c f a]) }
  << \relative c' { r4 d4 <d g>4 } \\ \relative c' { f2. } >>
  \relative c' { <c e a c>2.\!  <d f a d>2.\fermata }
}


lower = {
  \clef bass
  \time 3/4
  \key d \major
  \relative c { g2.^\pp d2. g2. d2. }
  \relative c { g2.     d2. g2. d2. }
  \relative c { g2.     d2. g2. d2. }

  \relative c { g2.^\pp d2. g2. d2. }
  \relative c, { fis2. b,2. e2. e2. d2. }

  << \relative c' { r4 <a c e>2^\p }    \\ \relative c, { a2. }  >>
  << \relative c' { r4 <g b e>2 }       \\ \relative c, { d2. }  >>
  << \relative c  { r4 <d g b e>2 }     \\ \relative c, { d2. }  >>
  << \relative c  { r4 <c e a d>2 }     \\ \relative c, { d2. } >>
  << \relative c  { r4 <c fis a d>2 }   \\ \relative c, { d2. } >>

  << \relative c' { r4 <a c f>2^\< }    \\ \relative c, { d2. } >>
  << \relative c' { r4 <a c e>2\! }     \\ \relative c, { d2. } >>
  << \relative c  { r4 < d g b e>2 }    \\ \relative c, { d2. } >>
  << \relative c  { r4 <c e a d>2^\> }  \\ \relative c, { d2. } >>
  << \relative c  { r4 <c fis a d>2\! } \\ \relative c, { d2. } >>
  \relative c, { e2. fis2. b,2. e2. }
  \relative c, { e2. }
  << \relative c { r4 <b a'>4 <e b'>4 } \\ \relative c, { e2. } >>
  \relative c { <a g'>2. <d, a' d>2. }


%%%%%%%%%%%%%%%%%%%%%%%%%
  \relative c { g2.^\pp d2. g2. d2. }
  << \relative c' { r4 <b d fis>2  r4 <a cis fis>2 r4 <b d fis>2  r4 <a cis fis>2 } \\ 
     \relative c { g2. d2. g2. d2. } >>
  << \relative c' { r4 <b d fis>2  r4 <a cis fis>2 r4 <b d fis>2  r4 <a cis fis>2 } \\ 
     \relative c { g2.^\f d2. g2. d2. } >>
  << \relative c' { r4 <b d fis>2  r4 <a cis fis>2 r4 <b d fis>2  r4 <a cis fis>2 } \\ 
     \relative c { g2.^\pp d2. g2. d2. } >>
  << \relative c' { r4 <a cis fis>2  r4 <b d fis>2  r4 <g b   >2  r4 <b d g>2 r4 <f a d>2 } \\
     \relative c, { fis2. b,2. e2. e2. d2. } >>

  << \relative c' { r4 <a c e>2 }       \\ \relative c, { a2. }  >>
  << \relative c' { r4 <g b>2 }         \\ \relative c, { d2. }  >>
  << \relative c  { r4 <d g b e>2 }     \\ \relative c, { d2. }  >>
  << \relative c  { r4 <c e a d>2 }     \\ \relative c, { d2. } >>
  << \relative c  { r4 <c fis a d>2 }   \\ \relative c, { d2. } >>

  << \relative c' { r4 <a c f>2 }       \\ \relative c, { d2. } >>
  << \relative c' { r4 <a c e>2 }       \\ \relative c, { d2. } >>
  << \relative c  { r4 < d g b e>2 }    \\ \relative c, { d2. } >>
  << \relative c  { r4 <c e a d>2 }     \\ \relative c, { d2. } >>
  << \relative c  { r4 <c fis a d>2 }   \\ \relative c, { d2. } >>
  << \relative c' { r4 <b e g>2  r4 <a d f>2  r4 <a c f>2  r4 <c e a>2 } \\
     \relative c, { e2. e2. e2. e2. } >>
  << \relative c' { r4 <a c f>2 } \\ \relative c, { e2. } >>
  << \relative c { r4 <b a'>4 <e b'>4 } \\ \relative c, { e2. } >>
  \relative c { <a g'>2. <d, a' d>2.\fermata }
}


\score {
  <<
    \new Staff = "mel" {
      \magnifyStaff #(magstep -2)
      \autoBeamOff
      \set Staff.instrumentName = "Violin"
      \melody
     }
    \new PianoStaff <<
      \set PianoStaff.instrumentName = "Piano"
      \new Staff = "upper" \upper
      \new Staff = "lower" \lower
   >>
  >>

  \layout {
    \context { \Staff \RemoveEmptyStaves }
    
  }
  \midi { }
}

\score {
    \new Staff = "mel" {
      \magnifyStaff #(magstep -2)
      \autoBeamOff
      \set Staff.instrumentName = "Violin"
      \melody
     }
  \layout {
    \context { \Staff \RemoveEmptyStaves }
  }
  \midi { }
}