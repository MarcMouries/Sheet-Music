\version "2.19.38"
\language "english"
\include "scale-diagram.ly"

\header {
  title = "My Gypsy Jazz Practice"
  composer = "Marc Mouries"
  style = "practice exercise"
}
\paper {
  indent = 0\mm
%  line-width = 160\mm
  % offset the left padding, also add 1mm as lilypond creates cropped
  % images with a little space on the right
%  line-width = #(- line-width (* mm  3.000000) (* mm 1))
%  line-width = 160\mm - 2.0 * 10.16\mm
  % offset the left padding, also add 1mm as lilypond creates cropped
  % images with a little space on the right
%  line-width = #(- line-width (* mm  3.000000) (* mm 1))
  %ragged-right = ##t
}
 \layout {
    %% insert these lines within the
    %% layout block after your music:
    \context {
      \Staff
   %   \remove Time_signature_engraver
    }
  }


% ****************************************************************
% BOOK
% ****************************************************************
% ****************************************************************
% Start cut-&-pastable-section
% ****************************************************************
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\markup { "Gypsy Music uses mainly Major, Minor 6, Dominant 7 and Diminished arpeggios"}
\markup \vspace #0.3
\markup \vspace #2
\markup { "Sur Am: A Melodic Minor" }

jattendraiLick = \score {<<
  \new ChordNames \chordmode { g1:dim7 }
  \new Staff {
    \relative c'' {
    %\chordmode { g1:dim7 }
     g8 a c ef d c a g
     g'8 a c ef d c a g

    }
  }
>>
}
\markup {\score {\jattendraiLick}}




GdimSeventhArp_A=\markup\scale-diagram-violin
             #'( (open 4) (4 3 2) (4 6 4)
                 (3 2 1) (3 5 3)
                 (2 1 1) (2 4 2) (2 7 4)
                 (1 3 2) (1 6 4)
                ) #4 #1.7
GdimSeventhArp_D=\markup\scale-diagram-violin
             #'( (open 4) (4 3 2) (4 6 2) (4 9 4)
                 (3 5 1)  (3 8 3)
                 (2 4 2)  (2 7 4)
                 (1 3 1)  (1 6 3)
                ) #4 #1.7

% G# B D F
DdimSeventhArp_A=\markup\scale-diagram-violin
             #'( (4 1 1) (4 4 3)
                 (open 3) (3 3 2) (3 6 4)
                 (2 2 1)  (2 5 3)
                 (1 1 1) (1 4 3)
                ) #4 #1.7


AdimSeventhArp_A=\markup\scale-diagram-violin
             #'( (4 2 1) (4 5 3)
                 (3 1 1) (3 4 2) (3 7 4)
                 (2 3 2) (2 6 4)
                 (1 2 1) (1 5 3)
                ) #4 #1.7
AdimSeventhArp_B=\markup\scale-diagram-violin
             #'( (4 2 1) (4 5 3)
                 (3 1 1) (3 4 3)
                 (open 2 0)
                 (2 3 2) (2 6 4)
                 (1 2 1) (1 5 3)
                ) #4 #1.7
AdimSeventhArp_C=\markup\scale-diagram-violin
             #'( (4 2 1) (4 5 1) (4 8 3)
                 (3 4 1) (3 7 3)
                 (2 3 1) (2 6 3)
                 (1 2 1) (1 5 3)
                ) #4 #1.7
AdimSeventhArp_D=\markup\scale-diagram-violin
             #'( (4 2 1) (4 5 2) (4 8 4)
                 (3 4 1) (3 7 3)
                 (2 3 2) (2 6 4)
                 (1 2 1) (1 5 3)
                ) #4 #1.7



\markup \vspace #0.3
\markup {\bold "Minor Arpeggios"}
\markup \vspace #2
\markup { "Arpeggios " }

\score {
  \relative d' {
   \time 6/8
   \key c \major
a8 c e a b c b a e c b a
d8 f a d e f e d a f e d
e8 g b e fs g fs e b g fs e

  }  \layout {    indent = 0\in    }
}

\markup \vspace #2
\markup { "Am - Dm6 E7 Arpeggios" }


theChords = {
  <a  c'  e'  >2
  <d' f'  b'  >2
  <e' gs' b'  d''>1
  <a  c'  e'  >1
  s1
  <d' f'  b'  >1
  s1
  <b d' f' af' >1
  s1
}

chordNames = \chordmode {
  \theChords
}


melody = \relative c'{
  %d16
  c16 e   a  c   e  c  a  e
  d   f   b  d   f  d  b  f
  e   gs  b  d   e  gs b  gs
  e   d   b  gs  e  d  b  gs
  \break
  a8 c e   a  c e  a c
  e  c a   e  c a  e c
  b  d f   a  b d  f a
  d  b  a   f  d b  a f
  b, d  f   af b d  f af
  b  af f   d   b  af  f  d
  \break
  c16 e   a  c e   c a  e
  a,16 c  f a  c  a  f c
  b    d   g  b  d   b  g  d
  g, b e g b g e b
  \tuplet 3/2 {a8 c e}  a16 c e8 a1
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
        \new Staff { \theChords }
  >>
  \layout {indent = 0 }
  \midi { }
}


\markup \vspace #0.3
\markup {\bold "Diminished 7th Arpeggios"}
\markup {
 http://ladydpiano.blogspot.com/2014/01/play-diminished-7th-half-diminished-7th.html
}
\markup {
 http://pianolessons.forbeginners.me/pianolesson-nine-the-diminished-chord/
}
\markup \vspace #0.3
\markup {\bold "Diminished 7th Arpeggios"}
\markup {"There are only three diminished scales & arpeggios."}
\markup \vspace #1.0
\markup {"1) G, B"\flat ", D"\flat ",E"}
%Go7   = G - Bb - Db - E
GdimSeventhArp = \relative c' { g4 bf df e | g4 bf df e | g}
score_Gdim_SeventhArp = \score {<<
  \new ChordNames \chordmode { g1:dim7 }
  \new Staff {
    \relative c' {
    %\chordmode { g1:dim7 }
    \GdimSeventhArp
    }
  }
>>
}
\markup {\score {\score_Gdim_SeventhArp}
                   \bold{A}   \GdimSeventhArp_A
                   \bold{D}   \GdimSeventhArp_D
}


\markup \vspace #1.0
\markup {"  2) G"\sharp", B, D, F"}
%   = G# - B - D - F
DdimSeventhArp = \relative c' { af4 b d f | af4 b d f | af}
score_Ddim_SeventhArp = \score {<<
  \new ChordNames \chordmode { af1:dim7 }
  \new Staff {
    %\chordmode { af1:dim7 }
    \DdimSeventhArp
  }
>>
}
\markup {\score {\score_Ddim_SeventhArp}
                   \bold{A} \DdimSeventhArp_A
}

\markup \vspace #1.0
\markup {"  3) A, C, E"\flat", F"\sharp}
%Ao7   = A - C - Eb - Gb
%Co7   = C - Eb - Gb - A
Adim_SeventhArp = \relative c' { a4 c ef gf | a4 c ef gf | a }
score_Adim_SeventhArp = \score {<<
  \new ChordNames \chordmode { a1:dim7 }
  \new Staff {    \Adim_SeventhArp  }
>>
}
\markup {\score {\score_Adim_SeventhArp}
          \bold{A} \AdimSeventhArp_A
          \bold{B} \AdimSeventhArp_B
          \bold{C} \AdimSeventhArp_C
          \bold{D} \AdimSeventhArp_D
}



\markup \vspace #2
\markup { "Sur Am: A Melodic Minor" }

\score {
  \relative d' {
   \time 4/4
   \key c \major
a8 b c d   e fs gs a
s1^"Example"
e8 fs gs a b c a e c b a4
}  \layout {    indent = 0\in    }
}
\markup { "Sur Dm: A Natural Minor" }
\score {
  \relative d' {
   \time 4/4
   \key c \major
a8 b c d   e f g a
s2. ^"Example" s8

cs8 d f e d  c b a
g f e d
c b d cs e
}
  \layout {    indent = 0\in    }
}

\markup \vspace #2
\markup { "A Harmonic Minor" }
\markup { "Sur E7: toujours en descendant" }
\score {
  \relative d' {
   \time 4/4
   \key c \major
a8 b c d   e f gs a
s2. ^"Example" s8 s8

b8 d c b
a gs f e
d c b a
gs e'8 ~ e4
r8^"Chromatic Scale" e ds e f fs g gs a4
}
  \layout {    indent = 0\in    }
}

\markup { "A Harmonic Minor" }
\score {
  \relative d' {
   \time 4/4
   \key c \major
a16 b c d e f gs
a16 b c d e f gs
a16 b c b a gs f
e16 d c b a gs f
e16 d c b  }
  \layout {    indent = 0\in    }
}
\markup \vspace #2
\markup { "D Harmonic Minor"}
\score {
  \relative d' {
   \time 4/4
   \key c \major
d16 e f g a bf cs
d16 e f g a bf cs
d16 e f e d cs bf
a16 g f e d cs bf
a16 g f e
  }
  \layout {    indent = 0\in    }
}


\markup \vspace #2
\markup { "Diminished Arpeggios in Fourth" }
dimInFourth = \relative c' {
 b 16^"B" ds fs a   c   a  fs ds
 e 16^"E" gs b  d   f   d  b  gs
 a,16^"A" cs e  g   bf  g  e  cs
 d 16^"D" fs a  c   ef  c  a  fs
 g,16^"G" b  d  f   af  f  d  b
 c 16^"C" e  g  bf  df  bf g  e
\break
\time 6/8
 b 8^"B" ds fs  a  c   ds  fs  ds c  a fs ds
 e 8^"E" gs b   d  f   gs  b   gs f  d b gs
 a,8^"A" cs e   g  bf  cs  e   cs bf g e cs
 d 8^"D" fs a   c  ef  fs  a   fs ef c a fs
\break
\time 4/4
 b,16 ds fs a c ds fs a c
  a fs ds c a fs ds
 e gs b d f gs b d f
  d b gs f d b gs

a,16 cs e g bf cs e g bf
  g e cs bf g e cs
 d fs a c ef fs a c ef
  c a fs ef c a fs


g,16 b d f af b d f af
  f d b af f d b
 c e g bf df e g bf df
  bf g e df bf g e

}

\score {
  <<
    %\new ChordNames \chordNames
    \new Staff { \dimInFourth }
    %\new Staff { \theChords }
  >>
  \layout {indent = 0 }
}
