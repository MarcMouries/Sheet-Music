\version "2.19.2"
\language "english"
\include "../../common/violin-functions.ly"
\include "../../common/markups.ly"
%
% Marc Mouries
%




%=============================================
% TODO
%=============================================

\markup \bold "%============================================="  \markup \vspace #0.2
\markup \bold "% TODO                                        "  \markup \vspace #0.2
\markup  "% - chromatic scale                                  "  \markup \vspace #0.2
\markup  "% - http://palomavaleva.com/press/wp-content/uploads/2013/09/Two-Octave-G-Chromatic-Scale-for-Violin.pdf                                  "  \markup \vspace #0.2
\markup  "% - Henry_Schradieck_School_of_Violin_Technics_Bk.1  "  \markup \vspace #0.2
\markup  "% - Trill Exercises                                  "  \markup \vspace #0.2
\markup  "% - http://178.238.143.130/ts-archive/assets/b/b/bb04d655-61de-4b7a-ba5a-f63497666582/secondImage/TrillExercises.png                                  "  \markup \vspace #0.2

\markup \bold "%============================================="  \markup \vspace #0.2


%=============================================
% TRILL
%=============================================
\markup \vspace #1
\markup \bold "Trill"
Trill = \relative c' {
    b\trill
}
\markup { \writeMusic ##{ \Trill #}}
\markup \vspace #1


%=============================================
% BOWING
%=============================================
\markup \vspace #1
\markup \bold "Extension 1st Finger"
ExtensionFirstFinger = \relative c' {
    e8_1 ds8_1 e8 ds e8 b d c
    a8_1 gs8-1 a8 b8 gs b d e

    \repeat volta 2 {
      \tuplet 3/2 { e8_1 ds8_1 e8 }
      \tuplet 3/2 { b8 d c }
      \tuplet 3/2 { a8_1 gs8-1 b8 }
      \tuplet 3/2 { d e f }
    }
    \repeat volta 2 {
       e8_1 ds8_1 e8
       b8 d c
       a8_1 gs8-1 b8
       d e f
    }


}
\markup { \writeMusic ##{ \ExtensionFirstFinger #} }


%=============================================
% BOWING
%=============================================
\markup \vspace #1
\markup \bold "Extension 4th Finger"
ExtensionFourthFinger = \relative c' {
    e8_1 ds8_1 e8 ds e8 b d c
    a8_1 gs8-1 a8 b8 gs b d e

    \repeat volta 2 {
      \tuplet 3/2 { e8_1 ds8_1 e8 }
      \tuplet 3/2 { b8 d c }
      \tuplet 3/2 { a8_1 gs8-1 b8 }
      \tuplet 3/2 { d e f }
    }
    \repeat volta 2 {
       e8_1 ds8_1 e8
       b8 d c
       a8_1 gs8-1 b8
       d e f
    }


}
\markup { \writeMusic ##{ \ExtensionFourthFinger #} }


% HARMONICS

\markup \vspace #1
\markup \bold "Harmonics"
Harmonics = \relative c' {
<d _0  g _3\harmonic>4  <e _1  a _4\harmonic>4
<fs_1  b _4\harmonic>4  <g _1  c _4\harmonic>4
<a _0  d _3\harmonic>4  <b _1  e _4\harmonic>4
<cs_1  fs-4\harmonic>4  <d _1  g -4\harmonic>4
<d _1  g -4\harmonic>4
<cs_1  fs-4\harmonic>4 <b _1  e -4\harmonic>4
<a _0  d -3\harmonic>4 <g -1  c -4\harmonic>4
<fs-1  b -4\harmonic>4 <e -1  a -4\harmonic>4
<d _0  g -3\harmonic>4
}

targetKey = g

\score {
  \Harmonics
  \layout { indent = 0}
}


\markup \vspace #1
\markup \bold "D minor Arppegio"
AminorPentaTriplets = \relative c' {
\tri { d8  a  d }  \tri { f8  d  f } \tri { a8  f  a }
\tri { d8  a  d }  \tri { f8  d  f } \tri { a8  f  a }
\tri { d8  a  f }  \tri { a8  f  d } \tri { f8  d  a }
\tri { d8  a  f }  \tri { a8  f  d } \tri { f8  d  a } }
\markup { \writeMusic ##{ \AminorPentaTriplets #}}




\markup { \writeMusic ##{ \AminorPentaTriplets #}}


\markup \vspace #1
\markup \bold "A minor Penta"
AminorPentaTriplets = \relative c' {
\tri { a8  g  a }  \tri { c8  a  c }
\tri { d8  c  d }  \tri { e8  d  e }
\tri { g8  e  g }
\tri { a8  g  a }  \tri { c8  a  c }
\tri { d8  c  d }  \tri { e8  d  e }
\tri { g8  e  g }
\tri { a8  g  a }  \tri { c8  a  c }

}
\markup { \writeMusic ##{ \AminorPentaTriplets #}}


%=============================================
% BOWING
%=============================================
harmoPitch = #(define-music-function (parser location note)
                                     (ly:music?)
  #{
    \once \override Voice.Stem #'stencil = ##f
    \once \override Voice.NoteHead #'font-size = #-4
    \parenthesize $note
  #})

ScoreA = \score {  { c'    d'    e'    } \layout { indent=0 }}
ScoreB = \score {  { c'''' d'''' e'''' } \layout { indent=0 }}


musicA = { c'    d'    e'    }
musicB = { c'''' d'''' e'''' }

\markup { "this" \writeMusic #musicA "should be aligned with this " \writeMusic #musicB }



\markup \vspace #1
\markup \bold "Harmonics"
\markup "some text about Harmonics: l sound 8ve + P5"
\markup "Now add harmonic with 1st finger on 3rd position and fourth finger down"

harmonicsG = {
  \new Staff  {
    \override Staff.TimeSignature #'stencil = ##f

    << { \context Voice = "upper"
       \voiceOne  <g_2 b\harmonic >4  <g c'_3 \harmonic > <g d'_4 \harmonic > <g e'_3 \harmonic >}
        \\
       { \context Voice = "pitch"

       \voiceTwo
       \harmoPitch  b''  \harmoPitch  g'' \harmoPitch  d''  \harmoPitch  b''
       }
    >>
  }
}

\markup { " G " \writeMusic ##{ \transpose g \targetKey  \harmonicsG #}
          "    D " \writeMusic ##{ \transpose g d' \harmonicsG #}
          "    A " \writeMusic ##{ \transpose g a' \harmonicsG #}
          "    E " \writeMusic ##{ \transpose g e''\harmonicsG #}
          }


  %%  c a' b, g' e' g, b, a'

harmonicsPentatonic = {
  \new Staff  {
    \override Staff.TimeSignature #'stencil = ##f

    << { \context Voice = "upper"
       \voiceOne
       <g  c'_1 \harmonic > <d' a'_2 \harmonic > <g e'_3 \harmonic >
       <d' g'_3 \harmonic >
       }
        \\
       { \context Voice = "pitch"
         \voiceTwo
         \harmoPitch  g''  \harmoPitch  a'' \harmoPitch  b''
         \harmoPitch  d'''
       }
    >>
  }
}
\markup { \writeMusic ##{ \harmonicsPentatonic#}}



ArpeggiosCsardas =\relative c' {
    \tupletSpan 4
    c(~ \tuplet 6/4 { c16 e g b c e) } g16.( f32) e16.( d32 c8 b)
    b( a) \appoggiatura { a16[ b] } a8.( gs16 a2)

    a,4(~ \tuplet 6/4 { a16 cs e g\< a cs) } e8( cs a' cs,)\!
    e( d) \appoggiatura { d16[ e] } d(  d e f4) f
}

\markup \vspace #1
\markup \bold "Arpeggios Csardas"
\markup { \writeMusic ##{ \ArpeggiosCsardas #} }



%%%%%%%%%%%%%%%
\markup \vspace #1
\markup \bold "A major on E string"

counter = "4"

\markup \bold "Chromatic Streching"
\score {
  \new Staff \with {instrumentName = \counter    }
    \relative c' {
<<
  { a'1-4  }
  \\
  { a,8 as b c  b bf a af }
>>
  %     gs a
    %
    }
  \layout {    indent = 0\cm  }
}

\markup \bold "E major Arpeggio"
\markup \bold " b gs b d e"



\markup \bold "Shifts"
\markup \bold "E flat - G scale in 3rd"

\markup \bold "Extension 4th finger"

\pageBreak

%=============================================
% BOWING
%=============================================
\markup \vspace #1
\markup \huge \bold "Bowing"
bowings = \relative c'' {
  \repeat volta 2 { a e' a, e'}
}
\markup { \writeMusic ##{ \bowings #} }



%=============================================
%   Swing Bowing
%=============================================
\markup \vspace #1
SwingBowing = \relative c' {
c d->( e) f g a->( b) c d c->( b) a g f->( e) d }
\markup \bold "Swing Bowing"
\markup { \writeMusic ##{  \SwingBowing  #} }

SwingBowing = \relative c' {
a   b->( c) e  a  b->( c) e   a  e->( c) b a  e->( c) b
d   e->( f) a  d  e->( f) a   d  a->( f) e d  a->( f) e-2
gs, b->( d) e  gs b->( d) e   gs e->( d) b gs e->( d) b
a   d->( e) f  a  d->( e) f   a  d->( a) f e  d->( a) f
}

\pageBreak

\markup \bold "Swing Bowing - Arpeggio"
\markup { \writeMusic ##{  \SwingBowing  #} }

%=============================================
%   Swing Bowing - Arpeggio - Tim Kliphuis
%=============================================
chordMinor_Swing_Am = \chordmode {
  d1:m6  a1:m6 e2:7 bf2:7 a1:m6
}

melodyMinor_Swing_Am = \relative c' {
d8 f->( a) b  d b->( a) f
e8 a->( b) a  e c->( b) a
gs8 b->( d) e  f d->( bf) af
a! b->( c) e  a e->( c) b
}


SwingBowingTK =  {
  <<
    \new ChordNames \chordMinor_Swing_Am
    \new Staff { \melodyMinor_Swing_Am }
  >>
}

\markup \bold "Swing Bowing - Arpeggio - Tim Kliphuis"
\markup { \writeMusic ##{  \SwingBowingTK  #} }


chordMinor_Swing_Gm = \chordmode {
  c1:m6  g1:m6 f2:7 af2:7 g1:m6
}

melodyMinor_Swing_Gm = \relative c'' {
c8 ef->( g) a  c a->( g) ef
d8 g->( a) g  d bf->( a) g
fs8 a->( c) d  ef c->( af) fs!
g! a->( bf) d  g d->( bf) a
}


SwingBowingTK =  {
  <<
    \new ChordNames \chordMinor_Swing_Gm
    \new Staff { \melodyMinor_Swing_Gm }
  >>
}

\markup \bold "Swing Bowing - Arpeggio - Tim Kliphuis"
\markup { \writeMusic ##{  \SwingBowingTK  #} }


\markup \bold "15'"

\markup "A Major"
scaleAmajor = \relative c' {
a8  b16   cs  d_4 e   fs  gs a8-4 b16   cs  d   e-4 fs  gs
a8   gs16  fs  e-4 d   cs  b  a8-4 gs16  fs  e   d-4 cs  b
}
arpeggioAmajor = \relative c' {
\tri { a8^"A"  cs   e   } \tri { a   cs   e   }
\tri { a   e-4  cs-2} \tri { a_4 e_1  cs_3 }  }
arpeggioFsMinor = \relative c' {
\tri { a8^"F♯ minor"  cs   fs} \tri { a cs fs}
\tri { a  fs  cs-2} \tri { a_4 fs_2  cs_3 }  }
arpeggioDmajor = \relative c' {
\tri { a8^"D major"  d   fs} \tri { a d fs}
\tri { a  fs d } \tri { a_4 fs_2  d_4 }  }
arpeggioDminor = \relative c' {
\tri { a8^"D minor"  d   f!} \tri { a-4 d f!}
\tri { a  f  d} \tri { a_4 f!  d }  }
arpeggioA_dimSeventh = \relative c' {
  a16^"A dim. 7" c ef gf a c ef gf   a gf! ef! c a gf! ef! c
}
arpeggioA_Seventh = \relative c' {
  a^"A7" cs e g   a cs e g
  a g  e cs!  a g  e cs!
}

warmups = {
  \scaleAmajor
  \break
  \repeat volta 2 {\arpeggioAmajor }
  \repeat volta 2 {\arpeggioFsMinor}
  %\break
  \repeat volta 2 {\arpeggioDmajor }
  \repeat volta 2 {\arpeggioDminor}
  %\break
  \repeat volta 2 {\arpeggioA_dimSeventh }
  \repeat volta 2 {\arpeggioA_Seventh}
}
\score {
  \warmups
  \layout { indent = 0}
}
\markup \vspace #1
\markup "One-octave arpeggios on One String"
\markup \vspace #1


\markup \bold "Double stop"
doubleStops = \relative c' {
\tri{  <c e>8 <b d> <c e>}
   \tri{  <d f>8 <e g> <f a>}
      \tri{  <g b>8 <a c> <b d>}
         \tri{  <c e>8 <b d> <a c>}
      \tri{  <g b>8 <f a> <e g>}
    \tri{  <d f>8 <c e> <b d>}
}
\score {
  \doubleStops
  \layout { indent = 0}
}

\markup \bold "One Finger Scale"
oneFingerScaleD = \relative c' {
  d4-0 e-1 fs-1 g-1 a-1
}
oneFingerScaleE = \relative c' {
  e-1 fs-1 gs-1 a-1 b
}
\markup {
  \writeMusic ##{ \oneFingerScaleD #}
  \writeMusic ##{ \oneFingerScaleE #}
  }









\markup "Vocalise Scale"
VocaliseScale = \relative c'' {
<g, g'>4^"G" g'16-3^\sulD  a-4 b-1_\sulA  c-2  d-3 c-2 b-1 a-4^\sulD
g8-3 d' g d
g,16-3^\sulD  a-4 b-1_\sulA  c-2  d-3 c-2 b-1 a-4^\sulD
g4
<a, a'>4^"A" a'16-3^\sulD  b-4 cs-1_\sulA  d-2  e-3 d-2 cs-1 b-4^\markup {"etc..."}

}
\score {
  \VocaliseScale
  \layout { indent = 0\mm}
}


%=============================================
%   Humoresque
%=============================================
\markup \vspace #1
\markup \bold "Humoresque"
oneFingerScaleD = \relative c' {
  d4-0 e-1 fs-1 g-1 a-1
}
oneFingerScaleE = \relative c' {
  e-1 fs-1 gs-1 a-1 b
}
\markup {
  \writeMusic ##{ \oneFingerScaleD #}
  \writeMusic ##{ \oneFingerScaleE #}
  }

\markup " =  b - d - f# - b"
\markup "shift=  e -  b-4"
\markup "Arpeggio:  "
\markup "  d-3 fs-3 a-3"
\markup "  c-2 e-2  g-2"
\markup "in IV position"
\markup "   a-3  cs-3   e3"
\markup "   g-2  b-2   d-2"
%=============================================
% SCHINDLER LIST
%=============================================
\markup \vspace #1
\markup \bold "Schindler's List"
bMajorArpA = \relative c' {
  \time 6/8
  fs8_2 b8-1 ds-1^"----"
  fs-3 b8-2^"----" ds-2
  fs-4 ds-2 b8-2
  fs-3 ds-1^"----" b8-1
}
\markup { B major \writeMusic ##{  \bMajorArpA #} }
%=============================================
% Thais Meditation
%=============================================
\markup \vspace #1
\markup \bold "Thais Meditation"

\markup \vspace #0.3
\markup \italic "4th Finger"
FourthFingerMeditation = \relative c'' {
  d4-1 e fs g-4 a-4\flageolet
}
\markup { \writeMusic ##{  \FourthFingerMeditation #} }

\markup \vspace #0.3
\markup \italic "Shifts"
shiftMeditation = \relative c' {
  d4-2_\sulG e-2 fs g a
}
\markup { \writeMusic ##{  \shiftMeditation #} }

\markup {d-2 e fs e-3}

\markup \vspace #0.3
\markup \italic "Fm Arpeggio (mes. 33)"
arpeggioMeditationFirstPos = \relative c' {
\tri {f8-2_\sulD  af-4 c-2} \tri{ f8-1 c-2 af-4}
}
arpeggioMeditationFm = \relative c' {
f-2^\sulG  af-4 c-2_\sulD  f-1^\sulA  af-3 c-1_\sulE f-4
}
\markup { \column {"I pos." "to get the" " pattern"} \writeMusic ##{ \arpeggioMeditationFirstPos #}
          "then" \column {"V pos."} \writeMusic ##{ \arpeggioMeditationFm #}
          }

\markup \vspace #0.3
\markup "B major arpeggio (b-1 d#-1 f#-3 b-2 d#-4)"
\markup \vspace #0.3
\markup "D major arpeggio (d-2 f#-4 a-2 d-1 f#-3 a-1 d-1 f#-3 a-4 )"
\markup \vspace #1
\markup \bold "Plus que Lente"
\markup " =  b - d - f# - b"
\markup "shift=  e -  b-4"
%
\markup \vspace #1
\markup \bold "Same Patterns"
\markup \vspace #1
\markup \bold "Mozart Rondo A la Turk & Bach Double"
rondoAndBachDouble = \relative c'' {
  b16-3 a gs a c4-4
  d16-3 c b c e4-4
}
\markup { \writeMusic ##{ \rondoAndBachDouble #} }

\markup \vspace #1
\markup \bold "Song from a Secret Garden"

\markup \bold "CHECK"


secretGarden = \relative c'' {
  \repeat volta 2 {
    f-1 g-2 af-3 bf-3 c-3 bf-3 af-3 g-2
  }
  \magnifyMusic 0.63 {
      \once \override  Score.SpacingSpanner.spacing-increment = #(* 1.2 0.63)
   %   a4-1 bf-2   c-3 d-4
  }
  c4.-3  c8 c( d) bf( a!)
  bf2-2  bf8( c) a( g)
  a4.( a8) a8( bf) g( f)
  g2
}
\markup { \writeMusic ##{ \secretGarden #} }


%{
80/20 rule Violin
Which 20% of work produce 80% of the result?

This could be broken down by style: classical, bluegrass, jazz, ...

For example, practicing B major arpeggio (b-1 d#-1 f#-3 b-2 d#-4) allows me to practice X and Y.

Thaïs Meditation
Debussy's La Plus Que Lente
Canon in D: 2nd position

swan : guitar
galamian
Joy to the world

dounis

Violin

Fur Elise: 4th finger
Happy birthday


Schindler's list
Dm
B Major

- f g a bf c
- shift avec 1st finger,
then 2nd => 2nd position
then 3rd
%}
%%
%% diminished 7th

%{
Am same
a-1 c e

D:
a-1 d-4

Dim:
a c ef fs
%}