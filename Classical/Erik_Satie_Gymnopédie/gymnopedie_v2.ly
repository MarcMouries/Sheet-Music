\language "english"
%\pointAndClickOff
\version "2.24.3"

\header{
  title = "1ere. Gymnopédie"
  composer = "Erik Satie (1866--1925)"
  country = "France"
  style = "classical"
}

\include "../../common/common-header.ily"

melody = {
  \clef treble
  \time 3/4
  \tempo "Lent et douloureux"
  \key d \major
  R2. R2. R2. R2.


  \relative c'' { r4 fs4\p(\<\downbow a) g\upbow( fs cs) b\downbow( cs d\!) a2.\upbow }


  \relative c'  {
    fs2.--~\f\downbow fs2.--~ fs2.--~ fs2.--
  }


  \relative c'' { r4 fs4\p(\<\downbow a) g\upbow( fs cs) b\downbow( cs d\!) a2.\upbow }
  \relative c'' { cs2.\downbow fs2.\>\upbow e,2.~\downbow e2.~ e2.\! }

  \relative c'' { a4\p(\upbow b c) e(\downbow d b) d4(\upbow c b) d2.~\downbow d2 d4\(\upbow }
  \relative c'' { e4\< f g\) a(\downbow c, d)\! e4(\upbow d b) d2.~\>\downbow d2 d4\(\!\upbow }

  \relative c''' { g2.\<\) fs2.\downbow b,4\!(\upbow a b) cs(\downbow d e)  }
  \relative c'' { cs4(\>\upbow d e) fs,2\downbow g4(\!\upbow c2.) d2.\downbow }

%%%%%%%%%%%%%%%%%%%%%%%%%
  R2. R2. R2. R2.
  \tag #'full { \pageBreak }

  \relative c'' { r4 fs4\p(\<\downbow a) g(\upbow fs cs) b(\downbow cs d\!) a2.\upbow }
  \relative c'  { fs2.--~\f\downbow fs2.--~ fs2.--~ fs2.-- }

  \relative c'' { r4 fs4\p(\<\downbow a) g(\upbow fs cs) b(\downbow cs d\!) a2.\upbow }
  \relative c'' { cs2.\downbow fs2.\>\upbow e,2.~\downbow e2.~ e2.\! }

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
  \relative c' { r4 <b d fs>2    r4 <a cs fs>2   r4 <b d fs>2    r4 <a cs fs>2 }
  \relative c' { r4 <b d fs>2\<  r4 <a cs fs>2   r4 <b d fs>2\!  r4 <a cs fs>2 }
  <<
    \relative c' { fs2.~\f fs2.~ fs2.~ fs2. } \\
    \relative c' { r4 <b d fs>2  r4 <a cs fs>2  r4 <b d fs>2    r4 <a cs fs>2 }
  >>

  \relative c' { r4 <b d fs>2\<  r4 <a cs fs>2   r4 <b d fs>2\!  r4 <a cs fs>2 }
  \relative c' { r4 <a cs fs>2 r4 <b d fs>2\>    r4 <g b e>2      r4 <b d g>2\!  r4 <f a d>2 }
  s2. s2. s2. s2. s2.
  s2. s2. s2. s2. s2.

  \relative c' { r4 <b e g>2\<  r4 <a cs fs>2\!  r4 <b d fs>2  r4 <cs e a>2 }
  \relative c' { r4 <a cs fs a>2\> }
  << \relative c' { r4 d4 <d g>4 } \\ \relative c' {fs2. } >>
  \relative c' { <c e a c>2.\!  <d fs a d>2. }

%%%%%%%%%%%%%%%%%%%%%%%%%
  \relative c' { r4 <b d fs>2   r4 <a cs fs>2    r4 <b d fs>2    r4 <a cs fs>2 }
  \relative c''' { r4 b8[(\< fs d b]) r4 a8[( cs fs a]) r4 b8[( fs d b])\! r4 a8[( cs fs a]) }
  <<
    \relative c''' { r4 b8[( fs d b]) r4 a8[( cs fs a]) r4 b8[( fs d b]) r4 a8[( cs fs a]) } \\
    \relative c' { fs2.~ fs2.~ fs2.~ fs2. }
  >>

  \relative c''' { r4 b8[(\< fs d b]) r4 a8[( cs fs a]) r4 b8[( fs d b])\! r4 a8[( cs fs a]) }

  \relative c'' { r4 cs8[( fs a cs]) r4 fs,8[(\> b d fs]) r4 e,,8[( g b e]) r4 b8[( d g b])\! r4 f,8[( a d f]) }

  \relative c''' { r4 a8[(\p e c a]) r4 e8[( g b e]) r4 b'8[( g d b]) r4 c8[( e a c]) r4  c8[( a fs c]) }
  \relative c''' { r4 f8[(\< c a f]) r4 a,8[( c e a])\! r4 d8[( b g d]) r4 c8[(\> e a c]) r4  c8[( a fs c])\! }

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
  \relative c, { fs2. b,2. e2. e2. d2. }

  << \relative c' { r4 <a c e>2^\p }    \\ \relative c, { a2. }  >>
  << \relative c' { r4 <g b e>2 }       \\ \relative c, { d2. }  >>
  << \relative c  { r4 <d g b e>2 }     \\ \relative c, { d2. }  >>
  << \relative c  { r4 <c e a d>2 }     \\ \relative c, { d2. } >>
  << \relative c  { r4 <c fs a d>2 }   \\ \relative c, { d2. } >>

  << \relative c' { r4 <a c f>2^\< }    \\ \relative c, { d2. } >>
  << \relative c' { r4 <a c e>2\! }     \\ \relative c, { d2. } >>
  << \relative c  { r4 < d g b e>2 }    \\ \relative c, { d2. } >>
  << \relative c  { r4 <c e a d>2^\> }  \\ \relative c, { d2. } >>
  << \relative c  { r4 <c fs a d>2\! } \\ \relative c, { d2. } >>
  \relative c, { e2. fs2. b,2. e2. }
  \relative c, { e2. }
  << \relative c { r4 <b a'>4 <e b'>4 } \\ \relative c, { e2. } >>
  \relative c { <a g'>2. <d, a' d>2. }

%%%%%%%%%%%%%%%%%%%%%%%%%
  \relative c { g2.^\pp d2. g2. d2. }
  <<
    \relative c' { r4 <b d fs>2  r4 <a cs fs>2 r4 <b d fs>2  r4 <a cs fs>2 } \\
    \relative c { g2. d2. g2. d2. }
  >>
  <<
    \relative c' { r4 <b d fs>2  r4 <a cs fs>2 r4 <b d fs>2  r4 <a cs fs>2 } \\
    \relative c { g2.^\f d2. g2. d2. }
  >>
  <<
    \relative c' { r4 <b d fs>2  r4 <a cs fs>2 r4 <b d fs>2  r4 <a cs fs>2 } \\
    \relative c { g2.^\pp d2. g2. d2. }
  >>
  <<
    \relative c' { r4 <a cs fs>2  r4 <b d fs>2  r4 <g b   >2  r4 <b d g>2 r4 <f a d>2 } \\
    \relative c, { fs2. b,2. e2. e2. d2. }
  >>

  << \relative c' { r4 <a c e>2 }       \\ \relative c, { a2. }  >>
  << \relative c' { r4 <g b>2 }         \\ \relative c, { d2. }  >>
  << \relative c  { r4 <d g b e>2 }     \\ \relative c, { d2. }  >>
  << \relative c  { r4 <c e a d>2 }     \\ \relative c, { d2. } >>
  << \relative c  { r4 <c fs a d>2 }   \\ \relative c, { d2. } >>

  << \relative c' { r4 <a c f>2 }       \\ \relative c, { d2. } >>
  << \relative c' { r4 <a c e>2 }       \\ \relative c, { d2. } >>
  << \relative c  { r4 < d g b e>2 }    \\ \relative c, { d2. } >>
  << \relative c  { r4 <c e a d>2 }     \\ \relative c, { d2. } >>
  << \relative c  { r4 <c fs a d>2 }   \\ \relative c, { d2. } >>
  <<
    \relative c' { r4 <b e g>2  r4 <a d f>2  r4 <a c f>2  r4 <c e a>2 } \\
    \relative c, { e2. e2. e2. e2. }
  >>
  << \relative c' { r4 <a c f>2 } \\ \relative c, { e2. } >>
  << \relative c { r4 <b a'>4 <e b'>4 } \\ \relative c, { e2. } >>
  \relative c { <a g'>2. <d, a' d>2.\fermata }
}

% ---- Reusable staff definitions
violinStaffFullScore =
\new Staff \with { instrumentName = "Violin" }
{
  \magnifyStaff #(magstep -2) % smaller in the full score
  \autoBeamOff
  \melody
}

violinStaffPart =
\new Staff \with { instrumentName = "Violin" }
{
  \autoBeamOff
  \melody
}

pianoStaffGroup =
\new PianoStaff \with { instrumentName = "Piano" }
<<
  \new Staff = "upper" \upper
  \new Staff = "lower" \lower
>>

% ---- Print both layouts
\book {
  % FULL SCORE: Violin + Piano
  \bookpart {
    \header { piece = "Full score: Violin & Piano" }
    \score {
      \keepWithTag #'full

      <<
        \violinStaffFullScore
        \pianoStaffGroup
      >>
      \layout { \context { \Staff \RemoveEmptyStaves } }
      \midi { }
    }
  }

  % 2) Violin part only
  \bookpart {
    \header { piece = "Violin part" }
    \paper {
      system-count = 12
    }
    \score {
      \removeWithTag #'full
      \violinStaffPart
      \layout {
        \context { \Staff \RemoveEmptyStaves }
      }
      \midi { }
    }
  }

}


