\version "2.19.32"
\language "english"
\include "../../common/violin-functions.ly"
\include "../../common/markups.ly"


\header {   composer = "Marc Mouries"
  genre = "Exercise" }

\include "../../common/common-header.ily"
\paper {
  tocItemMarkup = \tocItemWithDotsMarkup
}
#(set-global-staff-size 21)
\paper {
  top-margin = 1.0\cm
  bottom-margin = 1.0\cm
  left-margin = 2.0\cm
  right-margin = 2.0\cm
}

\markup {
  \fill-line { \fontsize #5 "Violin Practice" }
  \vspace #1
  \fill-line {
    \postscript #"-20 0 moveto 40 0 rlineto stroke" }
      \vspace #3
    \fill-line {
      \postscript #"-20 0 moveto 40 0 rlineto stroke" }
}




\markuplist \table-of-contents
\pageBreak

%=============================================
% PostureDGCF
%=============================================
\tocItem \markup "PostureDGCF"
\markup \bold "PostureDGCF"
PostureDGCF = \relative c' {
    \set fingeringOrientations = #'(left)
  <d-4 g-3 c-2 f-1>1
  <a-1 f'-2 d'-3 b'-4>1
}
\markup { \writeMusic ##{ \PostureDGCF #} }
%\score {    \new Staff { \PostureDGCF }
%  \layout {indent =0\cm }}

\markup \bold "Heifetz Warm-up - Shradiek"


\tocItem \markup "Tune Fingers- Intonation"
\markup \bold "Tune Fingers- Intonation"
Tune_Fingers = \relative c'{
 <g-0 d'-0>2
 <a-0 d-0>2
 <b-0 d-0>2
 <d-0 d-0>2
 <a-0 e'-0>2
 <a-0 f'-0>2
 <a-0 g'-0>2
 <a-0 a'-0>2
 <b-0 d-0>2
 <b-0 e-0>2
 <b-0 ef-0>2
 <b-0 e-0>2

}
\score {
    \new Staff { \Tune_Fingers }
  \layout {indent =0\cm }
}

\pageBreak
\tocItem \markup "Arpegio on One String"
\markup \bold "Arpegio on One String"
\relative d' {
b8 d fs b  
}

\tocItem \markup "Arpegio on One String"
\markup \bold "Arpegio on One String"
\relative d' {
  \time 3/4
  g,8 g d' d
  a' a  e'  e 
  a, a 
  d, d      
  \time 3/4
  d 8\downbow a' a d, a' a 
  d,8\downbow a' a d, a' a 
  \time 4/4
  
  d,\downbow a' a d, a' a d, a'  a  d, a' a
  r r r r
  \break
  a, b c e 
  a  b c e 
  a  e c b 
  a  e c b 
  
  g g g d' 
  a' a a e' 
  e  e a, a 
  a  d, g, g
  
  \break
  d' e f a 
  d  e f a 
  d  a f e 
  d  a f e 
  
  d d d a' 
  e' e e b' 
  b  b e, e 
  e  a, d, d
  
  \break  

  fs as-1 cs-3 as cs-1 fs-3 cs fs as fs cs fs cs as cs as 
  b ds-1 fs-3 ds fs-1 b-3 fs b ds b fs b fs ds fs ds 
  e gs-1 b-3 gs b-1 e-3 b e gs e b e b gs b gs 
  a cs-1 e-3 cs e-1 a-3 e a cs a e a e cs e cs 
}


%=============================================
% C Major with finger 3 & 4
%=============================================
\tocItem \markup "Scale with 3rd & 4th fingers"
\markup \bold "Scale with 3rd & 4th fingers"
scaleCmajorThreeFour = \relative c' {
  c8-3 d-4
  e-\shiftUp"3" f-4 g-\shiftUp"3" a-4
  b-\shiftUp"3" c-4 d-\shiftUp"3" e-4
  f-\shiftUp"3" g-4 a-\shiftUp"3" b-4
  c-\shiftUp"3" d-4 e-\shiftUp"3" f-4
  g-\shiftUp"3" a-4 b-\shiftDown"3"
  c-4  b-\shiftUp"3" a-4 g f e d
  c b a g f e d
  c b a g f e d c b
}
\markup { \writeMusic ##{ \scaleCmajorThreeFour #} }

\markup "1.  extension 1st finger"
\markup "1. D major Arpeggio"
\markup "2. A major Arpeggio"
\relative c' {
 a8  b   d^"T"   e
 fs  a   b   d
 e   fs  a   b
 d   b   a   fs
 e   d   b   a
 fs  e   d   b
}\relative c' {
  d8^"T"   e  fs  a  
  b   d  e   fs 
  a   b  d  e 
  fs  e d  b   
  a   fs
 e   d   
 b   a fs  e    
}
\relative c' {
  a8  d^"T"  e  fs 
  a    d          e   fs 
  a    d          e    fs 
  a    fs         e    d     
  a    fs         e    d     
  a    fs         e    d    
}
%=============================================
% Double Stops
%=============================================
\tocItem \markup "Double Stops"
\markup \bold "Double Stops "

%=============================================
% Kreutzer
%=============================================
\tocItem \markup "Kreutzer #2 in D in 1st, 2 and 3rd "
\markup \bold "Kreutzer #2 "


\relative a{
a'16 [b a b] a[ b a b]
a 32 [b a b] a[ b a b]
a 64 [b a b] a[ b a b]
a 64 [b a b] a[ b a b]
}

\pageBreak


\markup "ii V7 I"
\markup "Dm G7 C"
\markup "Em A7 D"

% C G D A E
melody = \relative c' {
   b8  gs  b   d
   e   gs  b
   d   e   gs b d
   e   d   b  gs
   e   d   b  gs
   e   d   b  gs
\break

% Am blues
a c d ef e g a c
d ef e g a c d ef
e ef d c a g e ef
d c a g e ef d c
\break
  % Dm6
    a d e f a
   d e f a
   d e f a
   f e d a
   f e d a
   f e d a
  % Dm7
   d f a c   d f a c
   d  c a f   d  c a
\break
\time 3/4
   c'8( a) e( c') a( e)
   b'8( gs) e( b') gs( e)
   a8( e) c( a') e( c)

}

chordNames= \chordmode {
  e1:7  e:7  e:7
  a1:m  a1:m a1:m  a1:m
  d1:m d1:m  d1:m7  d1:m7
  a1:m  e1:7  a1:m  d1:m6
}
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout {indent=0 }
}


%=============================================
% Improvisation
%=============================================
\tocItem \markup "Improvisation"
\markup {\bold "Improvisation"}
\markuplist {
  \paragraph {
    Triad. One tone above and one half tone below each note of the triad.

  }
}
impro_Triad_Above_Below = \relative c' {
  \tempo 4 = 40 - 60
  \repeat volta 10 {
    a8 gs a cs e gs b a b a gs
    a cs gs' a, cs \grace  cs fs e cs
    gs b a\trill gs gs cs e a cs b b b4
     \break
  }
}
%\score {    \new Staff { \impro_Triad_Above_Below }
%    \layout { ragged-right = ##f  indent = 0\cm }
%}
\markup { \writeMusic ##{ \impro_Triad_Above_Below#} }

\markup { \writeMusic ##{ \transpose a e' \impro_Triad_Above_Below#} }


\pageBreak



% SHIFTS
\markup \vspace #1
\markup \bold "Shift Substitutions"
shiftSubstitutions = \relative c'' {
  a4-4 a-3 g-3 g-2 fs-2 fs-1
}
\markup { \writeMusic ##{ \shiftSubstitutions #} }
shiftA = \relative c'' {
  g4-3 g-2 fs-2 fs-1
}
\markup { \writeMusic ##{ \shiftA#} }




\pageBreak


%=============================================
% SHIFT : Rolls - Korcia - Grappelli
%=============================================


%=============================================
% Slides
%=============================================
\tocItem \markup "Slides"
\markup \bold "Slides"
slides = \relative c'' {
    \time 2/4

  \repeat volta 2 {
    a4 c ef a,8 ef'-4  \glissando d4-4  c 
  }
    \repeat volta 2 {
    a'4 c ef a,8 ef'-4  \glissando d4-4  c
  }
}
\score {    \new Staff { \slides }
    \layout { ragged-right = ##f  indent = 0\cm }
}
%\markup { \writeMusic ##{ \slides #} }



\tocItem \markup "SHIFT : Rolls - Korcia - Grappelli"
\markup \bold "SHIFT : Rolls - Korcia - Grappelli"
SHIFT_Rolls = \relative c'' {
  \time 2/4
    \repeat volta 2 {
      \tuplet 3/2 4 {
        fs8-3  as  cs
        fs     cs  as
      }
    }
  \repeat volta 2 {
  \tuplet 3/2 4 {
%  cs,8 as    cs
%  fs  cs  fs
%  as  fs  as
%  cs  as  cs

  fs8  cs  fs
  as  fs  as
  cs  as  cs
  fs  cs  as
  cs  as  fs
  as  fs  cs
%  fs  cs  as
%  cs  as  fs
%  as  fs  cs
%  fs  cs  as
  }
  }
      %b8( g)
      cs'4.-3( b8)
      as4.   cs8-1 fs4-3
       e-2\mordent ds-1 fs-1_3 b2-3\harmonic
      \ottava #1
      e4-3\harmonic
      \ottava #0

}
\markup { \writeMusic ##{ \SHIFT_Rolls #} }


\pageBreak



\tocItem \markup "Trills  100 - 126 - 130"
\markup \bold "Trills"
% =================
% TRILL
% =================
\markup \bold "% TODO                                        "  \markup \vspace #0.2
\markup  "% - Meme chose avec noire pointee                                  "  \markup \vspace #0.2


singleNote_trill = \relative c'' {
  \time 2/4
   b\trill r4 c\trill  r4  d\trill  r4
}

singleNote_trill_played = \relative c'' {
  \time 2/4
  c32 b c b c b16. r4
  d32 c d c d c16. r4
  e32 d e d e d16. r4

}


\score {
  <<
    \new Staff \with { instrumentName = "Trill" } \singleNote_trill
    \new Staff \with { instrumentName = "Played" } \singleNote_trill_played
  >>
  \layout { }
}
\score {
    \new Staff  \with { instrumentName = "Slower" }{
      \relative c'' {
    \time 2/4
    c16^"60-100" b c b c b8. r2
    d16 c d c d c8. r2
    e16 d e d e d8. r2

}
    }
}

global = {
  \key c \major
  \time 2/4
}

A_trill = \relative c'' {
  \global
   g\trill  a
}

A_trill_played_up = \relative c'' {
  \global
  a32 g a g  a32 g f g  a4
}
A_trill_played_down = \relative c'' {
  \global
  g16 a32 g  a32[ g f g]  a4
}

\score {
  <<
    \new Staff \with { instrumentName = "Trills" } \A_trill
    \new Staff \with { instrumentName = "Played" } \A_trill_played_up
    \new Staff \with { instrumentName = "Played" } \A_trill_played_down
  >>
  \layout { }
}


Vocalise_trill = \relative c''' {
  \key e\minor
    \time 4/4

   g4.-4(  f8) e4 ds8.\trill (  cs32 ds)  e2
}

Vocalise_played = \relative c''' {
  \key e\minor
    \time 4/4
   g4.(  f8) e4 ds16 e32 ds e ds (  cs32 ds)  e2
}

\score {
  <<
    \new Staff \with { instrumentName = "Trills" } \Vocalise_trill
    \new Staff \with { instrumentName = "Played" } \Vocalise_played
  >>
  \layout { }
}
\score {
    \new Staff  \with { instrumentName = "Slower" }{
      \relative c''' {
  \key e\minor
    \time 4/4
   g2.(  f4) e2 ds8 e16 ds e ds (  cs16 ds)  e1
}
    }
}
melodyTrill = \relative c''' {
  \repeat volta 2 {
  a16 (g a g a g8.)
  a16 g a g a g8.
  }
  a32 g a g a g16.
  a32 g a g a g16.
  a32 g a g a g16.
  a32 g a g a g16.

}
\score {    \new Staff { \melodyTrill }
  \layout { }
}
melodyTrillHalf = \relative c''' {
  \repeat volta 2 {
  a16 g a g a g a g a g a g a g8.
  }
  a32 g a g a g a g a g a g a g16.
  a32 g a g a g a g a g a g a g16.
}
\score {    \new Staff { \melodyTrillHalf }
  \layout { }
}

\pageBreak

\markup \huge \bold "Diminished arpeggios"

\markup \fill-line {
  \override #'(line-width . 100)
      \box \pad-markup #2
  \justify-string #"
   Diminished arpeggios sur un accord de 7eme.
   On G7, the diminished arpeggio is F-Ab-B-D. It's not 
easy to start on one of these note when we improvise on G7.
So to make it easier, just start on G and jump to the 3rd of the chord.
And go from there into the arpeggio. G, B, D. The third, fifth and seventh, F.
on a notre accord 7th translated to of the chord are in the diminished arpeggio.
Using the above pattern you can play a diminished arpeggio over any 7th chord with the root on the 5th or 6th string.
Start the root note, go to the 3rd on the next string and proceed.

Anatole: progression de quatre accords: I, VI, II, V. Example: Cmaj7, A7, Dmi7, G7. Emi7, A7, Dm7, G7


from the Harvard Dictionary of Music:

Arperggio: A chord whose pitches are sounded successively, usually from lowest to highest, rather than simultaneously.... It is taken from Italian and French meaning harp.

Triad: A chord consisting of three pitches, the adjacent pitches being separated by a third, and thus the whole capable of notation on three adjacent lines or three adjacent spaces on the staff....

"
}

melody = \relative c'{
  %d16
  bf16 d   g  bf d   bf g  d
  c    ef  a  c  ef  c  a  ef
  a,   c   f  a  c   a  f  c
  bf16 d   g  bf d   bf g  d
  g,16 bf  ef g  bf  g  ef bf
  a    c   f  a  c   a  f  c
  f, a d f a f d a
  \tuplet 3/2 {g8 bf d}  g16 bf d8 g1
}
chordNames= \chordmode {
  g2:m

}
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout {indent=0 }
}


%=============================================
% IVm-Im-V chords
%=============================== ==============
\tocItem \markup "IVm-Im-V chords"
\markup \bold "IVm-Im-V chords"
\markup "IVm-Im-V7"
\markup "Dm-Am-E7"
\markup "Em-Bm-F#7"

% PATTERN
% Am : a b c d e
% Dm : d e f g a
% E7 : e fs gs b

IVm_Im_V_chords = \relative c' {
 d8 f a c d c a f  a,8 c e g a c e g e c e gs b d
}
\markup { \writeMusic ##{ \IVm_Im_V_chords #} }



\tocItem \markup "A..."
\markup \bold "A..."
A_template = \relative c' {
  \time 2/4
   c1
}




\tocItem \markup "Scale in Broken Thirds"
\markup \bold "Scale in Broken Thirds"
Scale_in_Broken_Thirds = \relative c' {
     % \set Timing.beamExceptions = #'()
     % \set Timing.baseMoment = #(ly:make-moment 1/4)
     % \set Timing.beatStructure = #'(1 1 1 1)
      d16 fs e g   fs a g b   a cs b d   cs e d fs
      e16 cs d b   cs a b g   a fs g e   fs d e cs
       d1
      \break

%   d16 fs e  g   fs  a g b    a cs b  d   cs e  d fs
%   e    g  fs a   g   b a cs   b d  cs e   d  f  e g
%   f d e cs       d b cs a     b g a fs    g e fs d
%   e cs d b       cs a b g     a fs g e    fs d e cs
      \bar "||"
      \break
   }
\markup { \writeMusic ##{ \Scale_in_Broken_Thirds #} }

\tocItem \markup "Double stops in Thirds"
\markup \bold "Double stops in Thirds"

Double_stops_in_Thirds = \relative c'{
 <d-4 d-0>4 <cs e> <d fs>
}
\score {
    \new Staff { \Double_stops_in_Thirds }
  \layout {indent =0\cm }
}


\markup "rhythms"
rhythms = \relative c' {
  \time 2/4
\repeat volta 2{ c4 \tuplet 3/2 {c8 c c}}
\repeat volta 2{ c8 c4  c c}
\repeat volta 2{ c4 \tuplet 3/2 {c8 c c}}
\repeat volta 2{ c4 \tuplet 3/2 {c8 c c}}


}
\score {
    \new Staff { \rhythms }
  \layout {indent =0\cm }
}



%{
convert-ly (GNU LilyPond) 2.19.38  convert-ly: Processing `'...
Applying conversion: 2.19.22, 2.19.24, 2.19.28, 2.19.29, 2.19.32
%}
