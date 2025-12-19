\version "2.19.40"
\language "english"
%%
%% http://lsr.dsi.unimi.it/LSR/Item?id=1040
%% created by Manuela
%% thanks to the German forum http://www.lilypondforum.de
%% feel free to change and distribute
%%
%% draw a circle of fifths with Lilypond
%% in the style like here https://commons.wikimedia.org/wiki/File:Quintenzirkeldeluxe.png
%% you can use more Scheme if you like
%% e.g. drawing the ticker lines with whitening cirle as one graph
%% needs no include files

\layout {
  indent = #0
  \context {
    \Staff
    \omit TimeSignature
    \omit BarLine
    explicitClefVisibility = #end-of-line-invisible
    explicitKeySignatureVisibility = #end-of-line-invisible
    \remove "Accidental_engraver"
  }
  \context {
    \Voice
    \omit NoteHead
    \omit Stem
  }
  \context {
    \Score
    \override BarNumber.break-visibility = #all-invisible
    \override KeyCancellation.break-visibility = #'#(#f #f #f)
  }
}

%% define score snippets als markups
%% in order of appearance

Cmaj=\markup \score { { \key c \major g'4 } \layout {  } }
Gmaj=\markup \score { { \key g \major g'4 } \layout {  } }
Dmaj=\markup \score { { \key d \major g'4 } \layout {  } }
Amaj=\markup \score { { \key a \major g'4 } \layout {  } }
Emaj=\markup \score { { \key e \major g'4 } \layout {  } }
Bmaj=\markup \score { { \key b \major g'4 } \layout {  } }
Fsmaj=\markup \score { { \key fs \major g'4 } \layout {  } }
Gfmaj=\markup \score { { \key gf \major g'4 } \layout {  } }
Dfmaj=\markup \score { { \key df \major g'4 } \layout {  } }
Afmaj=\markup \score { { \key af \major g'4 } \layout {  } }
Efmaj=\markup \score { { \key ef \major g'4 } \layout {  } }
Bfmaj=\markup \score { { \key bf \major g'4 } \layout {  } }
Fmaj=\markup \score { { \key f \major g'4 } \layout {  } }

#(define (st-rot stencil myangle)
   ;; just for shortening the code
   (ly:stencil-rotate stencil myangle 0 0))

#(define (x-width mystencil)
   (let* ((x-ext (ly:stencil-extent mystencil X)))
     (- (cdr x-ext) (car x-ext))))

#(define (y-width mystencil)
   (let* ((y-ext (ly:stencil-extent mystencil Y)))
     (- (cdr y-ext) (car y-ext))))

#(define (bogen winkel)
   (* ( / winkel 180) PI))

#(define (kreis-punkt radius winkel)
   ;; this function returns the coordinates of a point on a circumference
   ;; as pair depending on radius and angle
   ;; like a clock: start at midnight ;-)
   ;; winkel = angle (in degrees)
   ;; '(x . y)
   (let* ((wiboma (bogen winkel)) ;; calculate angle as radian measure
           (x-sin (sin wiboma))
           (y-cos (cos wiboma))
           (x-cor (* x-sin radius))
           (y-cor (* y-cos radius)))
     (cons x-cor y-cor)))

#(define (mittel-punkt stencil)
   ;; returns the coordinates of the middle of the stencil als pair
   ;; '( x-middle . y-middle)
   (let*
    ((x-li (car (ly:stencil-extent stencil X)))
     (x-re (cdr (ly:stencil-extent stencil X)))
     (y-li (car (ly:stencil-extent stencil Y)))
     (y-re (cdr (ly:stencil-extent stencil Y))))
    (cons (/ (+ x-li x-re) 2) (/ (+ y-li y-re) 2))))

#(define (move-to-circle radius winkel stencil)
   ;; move a stencil to the edge of a cirle
   ;; depending on radius and angle
   ;; the arithmetic middle of the stenil coordinates is the reference point
   ;; which is moved with its `mittel-punkt' to `kreis-punkt'
   (let* ((mittel (mittel-punkt stencil))
          (mittel-x (car mittel))
          (mittel-y (cdr mittel))
          (kreis (kreis-punkt radius winkel))
          (kreis-x (car kreis))
          (kreis-y (cdr kreis)))
     (ly:stencil-translate stencil
       (cons
        (- kreis-x mittel-x)
        (- kreis-y mittel-y)))))

#(define-markup-command (move-markup layout props mymark radius winkel)
   (markup? number? number?)
   (move-to-circle radius winkel (interpret-markup layout props mymark)))

#(define (move-to-circle-x radius winkel stencil delta)
   ;; move stencil down (at six)
   ;; winkel=0:  left aligned
   ;; winkel<>0: right aligned
   ;; just for Fs/Gf maj needed
   ;; two scales at six
   (let* ((mittel (mittel-punkt stencil))
          (mittel-x (car mittel))
          (mittel-y (cdr mittel))
          (kreis (kreis-punkt radius winkel))
          (kreis-x (car kreis))
          (kreis-y (cdr kreis)))
     (if (= winkel 0)
         (ly:stencil-translate stencil
           (cons
            (+ (* -2 mittel-x) delta)
            (* radius -1)))
         (ly:stencil-translate stencil
           (cons
            delta
            (* radius -1))))))

#(define-markup-command (move-markup-x layout props mymark radius winkel delta)
   (markup? number? number? number?)
   (move-to-circle-x radius winkel (interpret-markup layout props mymark) delta))

#(define-markup-command (move-and-scale layout props mymark faktor x-offset)
   (markup? number? number?)
   (ly:stencil-translate
    (ly:stencil-scale
     (interpret-markup layout props mymark)
     faktor faktor)
    (cons x-offset 0))
   )

#(define QC-radius 30) %% inner radius of the cirle
#(define Abstand 1.45)  %% try what looks best
#(define ticker-len 1.07)
#(define outer-radius (* QC-radius Abstand)) %% outer radius
#(define maj-radius (* QC-radius 1.16))  %% try what looks best
#(define min-radius (/ QC-radius 1.3)) %% try what looks best

#(define ticker-line
   ;; this is the archetype of the ticker lines
   ;; that connect the majors with the minors
   ;; I combine six of them rotated at 30, 60, ... degrees
   (make-filled-box-stencil (cons -0.1 0.1)
     (cons (* -1 QC-radius ticker-len) (* QC-radius ticker-len))))

%%%% Remark
%% While 2.20.-update use markup-command \overlay instead of 
%% multiple \combine
QuiZi=
\markup {
  %% Score snippets
  \combine \move-markup \Gmaj #outer-radius #30
  \combine \move-markup \Dmaj #outer-radius #60
  \combine \move-markup \Amaj #outer-radius #90
  \combine \move-markup \Emaj #outer-radius #120
  \combine \move-markup \Bmaj #outer-radius #150
  \combine \move-markup-x \Fsmaj #outer-radius #180 #0.5
  \combine \move-markup-x \Gfmaj #outer-radius #0 #-0.5
  \combine \move-markup \Dfmaj #outer-radius #210
  \combine \move-markup \Afmaj #outer-radius #240
  \combine \move-markup \Efmaj #outer-radius #270
  \combine \move-markup \Bfmaj #outer-radius #300
  \combine \move-markup \Fmaj #outer-radius #330
  %% ticker lines
  \combine \stencil \ticker-line
  \combine \stencil #(st-rot ticker-line 30)
  \combine \stencil #(st-rot ticker-line 60)
  \combine \stencil #(st-rot ticker-line 90)
  \combine \stencil #(st-rot ticker-line 120)
  \combine \stencil #(st-rot ticker-line 150)
  %% whiten the interior of the circle
  \with-color #white
  \combine \draw-circle #(/ QC-radius ticker-len) #0 ##t
  %% add major letters in blue
  \with-color   #blue
  \abs-fontsize #22 \bold
  \combine \move-markup \circle "C" #maj-radius #0
  \combine \move-markup "G" #maj-radius #30
  \combine \move-markup "D" #maj-radius #60
  \combine \move-markup "A" #maj-radius #90
  \combine \move-markup "E" #maj-radius #120
  \combine \move-markup "B" #maj-radius #150
  \combine \move-markup "G♭/F♯" #maj-radius #180
  \combine \move-markup "D♭" #maj-radius #210
  \combine \move-markup \concat {"A" \flat} #maj-radius #240
  \combine \move-markup \concat {"E" \flat} #maj-radius #270
  \combine \move-markup \concat {"B" \flat} #maj-radius #300
  \combine \move-markup "F" #maj-radius #330
  \with-color #red
  \combine \move-markup \circle "A" #min-radius #0
  \combine \move-markup "E" #min-radius #30
  \combine \move-markup "B" #min-radius #60
  \combine \move-markup "F♯" #min-radius #90
  \combine \move-markup "C♯" #min-radius #120
  \combine \move-markup "G♯" #min-radius #150
  \combine \move-markup "E♭/D♯" #min-radius #180
  \combine \move-markup "B♭" #min-radius #210
  \combine \move-markup "F" #min-radius #240
  \combine \move-markup "C" #min-radius #270
  \combine \move-markup "G" #min-radius #300
  \combine \move-markup "D" #min-radius #330
  \abs-fontsize #30
  \with-color #blue
  \combine \move-markup "Major" #outer-radius #0
  \with-color #red
  \combine \move-markup "Minor" #(* min-radius 0.6) #0
  \with-color #black
  \draw-circle #QC-radius #0.5 ##f

}
%% usage example
\markup \move-and-scale \QuiZi #0.8 #40

