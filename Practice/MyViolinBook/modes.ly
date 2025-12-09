


\include "BasicScales.ly"
\include "../common/scale-diagram.ly"
\include "myStaffAndTimeSettings.ly"

\header {
  title = "Modes"
  composer = "Marc Mouries"
  genre = "Exercise"
}

%{
Snippet for overlay markup command - absolute positioning of items

Defines a new markup command \overlay which takes a list of markup elements and positions them all at the same point.
        By translating each markup element, you can gain control of the absolute position of each.
%}

#(define-public (stack-stencil-overlay stencils)
  "Recursive function to add stencils together"
  (if (and (pair? stencils)
           (ly:stencil? (car stencils)))

      (if (and (pair? (cdr stencils))
               (ly:stencil? (cadr stencils)))
          (let ((tail (stack-stencil-overlay (cdr stencils)))
                (head (car stencils)))
               (ly:stencil-add head tail))
          (car stencils))
      point-stencil))

#(define-markup-command (overlay layout props args)
  (markup-list?)
  "Overlay arguments one on top of the next"
  (let ((stencils (interpret-markup-list layout props args)))
       (stack-stencil-overlay
         (remove ly:stencil-empty? stencils))))


LydianScaleViolin=\markup\scale-diagram-violin
             #'( (4 2 1) (4 4 2) (4 6 3) (4 8 4)
                 (3 2 1) (3 4 2) (3 6 3) (3 7 4)
                 (2 2 1) (2 4 2) (2 6 3) (2 7 4)
                 (1 2 1) (1 4 2) (1 5 3)
                ) #7 #1.7

LydianFlatSevenScaleViolin=\markup\scale-diagram-violin
             #'( (4 2 1) (4 4 2) (4 6 3) (4 8 4)
                 (3 2 1) (3 4 2) (3 5 3) (3 7 4)
                 (2 2 1) (2 4 2) (2 6 3) (2 7 4)
                 (1 2 1) (1 3 2) (1 5 3)
                ) #7 #1.7

IonianScaleViolin=\markup\scale-diagram-violin
             #'( (4 2 1) (4 4 2) (4 6 3) (4 7 4)
                 (3 2 1) (3 4 2) (3 6 3) (3 7 4)
                 (2 2 1) (2 4 2) (2 5 3) (2 7 4)
                 (1 2 1) (1 4 2) (1 5 3)
                ) #7 #1.7

MyxolydianScaleViolin=\markup\scale-diagram-violin
             #'( (4 2 1) (4 4 2) (4 6 3) (4 7 4)
                 (3 2 1) (3 4 2) (3 5 3) (3 7 4)
                 (2 2 1) (2 4 2) (2 5 3) (2 7 4)
                 (1 2 1) (1 3 2) (1 5 3)
                ) #7 #1.7

DorianScaleViolin=\markup\scale-diagram-violin
             #'( (4 2 1) (4 4 2) (4 5 3) (4 7 4)
                 (3 2 1) (3 4 2) (3 5 3) (3 7 4)
                 (2 2 1) (2 3 2) (2 5 3) (2 7 4)
                 (1 2 1) (1 3 2) (1 5 3)
                ) #7 #1.7

AeolianScaleViolin=\markup\scale-diagram-violin
             #'( (4 2 1) (4 4 2) (4 5 3) (4 7 4)
                 (3 2 1) (3 3 2) (3 5 3) (3 7 4)
                 (2 2 1) (2 3 2) (2 5 3) (2 7 4)
                 (1 1 1) (1 3 2) (1 5 3)
                ) #7 #1.7

PhrygianScaleViolin=\markup\scale-diagram-violin
             #'( (4 2 1) (4 3 2) (4 5 3) (4 7 4)
                 (3 2 1) (3 3 2) (3 5 3) (3 7 4)
                 (2 1 1) (2 3 2) (2 5 3) (2 7 4)
                 (1 1 1) (1 3 2) (1 5 3)
                ) #7 #1.7

LocrianScaleViolin=\markup\scale-diagram-violin
           #'( (4 2 1) (4 3 2) (4 5 3) (4 7 4)
               (3 1 1) (3 3 2) (3 5 3) (3 7 4)
               (2 1 1) (2 3 2) (2 5 3) (2 6 4)
               (1 1 1) (1 3 2) (1 5 3)
              ) #7 #1.8
AlteredScaleViolin=\markup\scale-diagram-violin
           #'( (4 2 1) (4 3 2) (4 5 3) (4 6 4)
               (3 1 1) (3 3 2) (3 5 3) (3 7 4)
               (2 1 1) (2 3 2) (2 4 3) (2 6 4)
               (1 1 1) (1 3 2) (1 5 3)
              ) #7 #1.8

Lydian     = \transpose f  c \relative c' { \FLydianScale }
Ionian     = \transpose c  c \relative c' { \CIonianScale }
Myxolidian = \transpose g, c \relative c' { \GMixolydianScale }
Dorian     = \transpose d  c \relative c' { \DDorianScale }
Aeolian    = \transpose a, c \relative c' { \AEolianScale }
Phrygian   = \transpose e  c \relative c' { \EPhrygianScale }
Locrian    = \transpose b, c \relative c' { \BLocrianScale }

LydianFlatSeven = \transpose f  c \relative c' { \FLydianFlatSeven}
Altered    = \transpose c  c \relative c' { \CAltered}



#(define posX 10)
\markup '#posX
#(define posXincr 10)

%\markup \translate #(cons posX 10) \center-align posX
#(define posX (+ posX posXincr))
%\markup \translate #(cons posX 10) \center-align posX
#(define posX (+ posX posXincr))
%\markup \translate #(cons posX 10) \center-align posX


#(define posY 10)
#(define posYincr 10)
%\markup \translate #(cons 10 posY) \center-align posY
#(define posX (+ posY posYincr))
%\markup \translate #(cons 10 (* 2 posY)) \center-align posY
%\markup \translate #(cons 10 (* 3 posY)) \center-align posY
%\markup \translate #(cons 10 (* 4 posY)) \center-align posY


\markup {
  \overlay {
    %\justify-string #"Modes"
      \translate #'(0 . -3) \overlay {

      \translate #'(0  . -1) \left-align \bold Mode
      \translate #'(25 . -1) \left-align \bold Notes
      \translate #'(85 . -1) \left-align \bold Fingering

      \translate #'(0  . -9) \left-align \column {\bold Lydian \small \concat {"Raised 4" {\raise #0.6 { \smaller th }}}}
      \translate #'(18 . -10) \left-align \score { \new Staff {\myStaffAndTimeSettings \Lydian}}
      \translate #'(85 . -10) \left-align \LydianScaleViolin

      \translate #'(0  . -20) \left-align \column {\bold Ionian \small "Standard Major"}
      \translate #'(18 . -20) \left-align \score { \new Staff {\myStaffAndTimeSettings \Ionian}}
      \translate #'(85 . -20) \left-align \IonianScaleViolin

      \translate #'(0  . -30) \left-align \column {
        {\bold Myxolydian \small "Standard Major" }
        {\small \concat {"Flat 7" {\raise #0.6 { \smaller th }}}}
      }
      \translate #'(18 . -30) \left-align \score { \new Staff {\myStaffAndTimeSettings \Myxolidian}}
      \translate #'(85 . -30) \left-align \MyxolydianScaleViolin


      \translate #'(-4  . -10) \left-align \bold "L"
      \translate #'(-4  . -20) \left-align \bold "I"
      \translate #'(-4  . -30) \left-align \bold "M"
      \translate #'(-4  . -40) \left-align \bold "D"
      \translate #'(-4  . -50) \left-align \bold "A"
      \translate #'(-4  . -60) \left-align \bold "P"
      \translate #'(-4  . -70) \left-align \bold "L"


      \translate #'(0  . -40) \left-align \column {\bold Dorian \small "Standard Major"}
      \translate #'(18 . -40) \left-align \score { \new Staff {\myStaffAndTimeSettings \Dorian}}
      \translate #'(85 . -40) \left-align \DorianScaleViolin

      \translate #'(0  . -50) \left-align \column {\bold Aeolian \small "Standard Major"}
      \translate #'(18 . -50) \left-align \score { \new Staff {\myStaffAndTimeSettings \Aeolian}}
      \translate #'(85 . -50) \left-align \AeolianScaleViolin

      \translate #'(0  . -60) \left-align \column {\bold Phrygian \small "Standard Major"}
      \translate #'(18 . -60) \left-align \score { \new Staff {\myStaffAndTimeSettings \Phrygian}}
      \translate #'(85 . -60) \left-align \PhrygianScaleViolin

      \translate #'(0  . -70) \left-align \column {\bold Locrian \small "Standard Major"}
      \translate #'(18 . -70) \left-align \score { \new Staff {\myStaffAndTimeSettings \Locrian}}
      \translate #'(85 . -70) \left-align \LocrianScaleViolin


      \translate #'(0  . -90) \left-align \column {
        {\bold \concat {"Lydian " \flat 7}}
        {\small \concat {"Raised 4" {\raise #0.6 { \smaller th }}}}
        {\small \concat {"Flat 7" {\raise #0.6 { \smaller th }}}}
      }
      \translate #'(18 . -90) \left-align \score { \new Staff {\myStaffAndTimeSettings \LydianFlatSeven}}
      \translate #'(85 . -90) \left-align \LydianFlatSevenScaleViolin

      \translate #'(0  . -100) \left-align \column {\bold "Altered" \small "?"}
      \translate #'(18 . -100) \left-align \score { \new Staff {\myStaffAndTimeSettings \Altered}}
      \translate #'(85 . -100) \left-align \AlteredScaleViolin


      }
  }
}

\pageBreak
\markuplist {
  \justified-lines {
 Record examples, about 30 to 60 seconds each,
 playing on each of these six chord scales,
demonstrating that you are comfortable with
each scale:  }
  \wordwrap-lines {
 Record examples, about 30 to 60 seconds each,
 playing on each of these six chord scales,
demonstrating that you are comfortable with
each scale:    ...
  }

}
\markup {
  \column {
    \line  \smallCaps { La vida breve }
    \line \bold { Acto I }
    \wordwrap \italic {
 Record examples, about 30 to 60 seconds each,
 playing on each of these six chord scales,
demonstrating that you are comfortable with
each scale:
    }
    \hspace #0
  }
}

\markup "A Lydian flat7"
\markup "C Locrian"
\markup "F7 altered"
\markup "D Dorian"
\markup "B Lydian"
\markup "Eb Aeolian"


  \score {
     \new Staff \with {
       instrumentName = \markup\box\column {
       \line { \hspace #10 }
       \line { A Lydian flat7 }
       \line { "" }
     }
   }
   {
    \myStaffAndTimeSettings
    \transpose c a, \LydianFlatSeven
   }
   \layout {indent = 2\cm }
 }
  \score {
     \new Staff \with {
       instrumentName = \markup\box\column {
       \line { \hspace #10 }
       \line { C Locrian }
       \line { "" }
     }
   }
   {
    \myStaffAndTimeSettings
    \Locrian
   }
   \layout {indent = 2\cm }
 }
  \score {
     \new Staff \with {
       instrumentName = \markup\box\column {
       \line { \hspace #10 }
       \line { F 7 Altered }
       \line { "" }
     }
   }
   {
    \myStaffAndTimeSettings
    \transpose c f \Altered
   }
   \layout {indent = 2\cm }
 }

  \score {
     \new Staff \with {
       instrumentName = \markup\box\column {
       \line { \hspace #10 }
       \line { D Dorian }
       \line { "" }
     }
   }
   {
    \myStaffAndTimeSettings
    \transpose c d \Dorian
   }
   \layout {indent = 2\cm }
 }

   \score {
     \new Staff \with {
       instrumentName = \markup\box\column {
       \line { \hspace #10 }
       \line { B Lydian }
       \line { "" }
     }
   }
   {
    \myStaffAndTimeSettings
    \transpose c b, \Lydian
   }
   \layout {indent = 2\cm }
 }

   \score {
     \new Staff \with {
       instrumentName = \markup\box\column {
       \line { \hspace #10 }
       \line { \concat {E \flat " Eolian"}}
       \line { "" }
     }
   }
   {
    \myStaffAndTimeSettings
    \transpose c ef \Aeolian
   }
   \layout {indent = 2\cm }
 }
