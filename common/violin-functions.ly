\version "2.24.0"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Marc Mouries
%
%

harmonicPitch = #(define-music-function (note) (ly:music?)
                   #{
                     \once \override Voice.Beam.stencil = ##f
                     \override Voice.Beam.transparent = ##t

                     \once \override Voice.Stem.stencil = ##f
                     \once \override Voice.Flag.stencil = ##f
                     \once \override Voice.NoteHead.font-size = #-4
                     \tiny
                     \override Stem.stencil = ##f
                     \override Flag.stencil = ##f
                     \parenthesize $note
                   #})

%%  MARK UP COMMANDS
%  usage:
% <note> _\rit
% <note> -\rit
% <note> ^\rit

posV    = \markup { \smaller \bold "V pos." }

extFourth  = \markup \circle \finger 4

%%%%%%%%%%%%%%%%%%%
% SLIDE
%%%%%%%%%%%%%%%%%%%
slide = #(define-music-function (startnote) (ly:pitch?)
           #{
             % the next two lines ensure the glissando is long enough
             % to be visible
             \once \override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
             \once \override Glissando.minimum-length = #3.5
             \once \hideNotes
             \grace $startnote \glissando
           #})

#(define-markup-command (sul layout props text) (markup?)
   "Draw a double box around text."
   (interpret-markup layout props
                     (markup #:translate '(-1.0 . 0)
                             #:bold  text)))

sulE     = \markup { \sul "sul E"}
sulA     = \markup { \sul "sul A"}
sulD     = \markup { \sul "sul D"}
sulG     = \markup { \sul "sul G"}
%sulE    = \markup { \bold \italic "sul E" }
%sulA    = \markup { \bold \italic "sul A" }
%sulD    = \markup { \bold \italic "sul D" }
%sulG    = \markup { \bold \italic "sul G" }


%%{a'^"sul D" r r r }
%%{a'^\sulD r r r }




% usage:
%<note> _\rit <note> -\rit <note> ^\rit


% _"a tempo"
% harmonic
% ritardo
% definition:
rit    = \markup {  \italic "rit." }
dim    = \markup {  \italic "dim." }
lento  = \markup {  \italic "lento" }




%%% Format %%%

smark =#(define-music-function (string) (string?)
          (make-music
           'TextScriptEvent
           'direction UP
           'text (markup #:small string)))

% USAGE : put it _before_ the note where it should appear:
% c4 \smark "III" d \smark "IV" e f
% the "III" appears over the d, while "IV" is placed over the e.



looksSlower = #(define-music-function (music)
                 (ly:music?)
                 (let ((new-music (ly:music-deep-copy music)))
                   (shift-duration-log new-music -2 0)
                   new-music))

%% Shift Finger
%% Print a finger number preceded by a "-" to indicate a shift
%% Usage: c4-\shift -3

shift =
#(define-music-function (fingering) (ly:music?)
   (let ((music (make-music 'FingeringEvent))
         (finger (ly:music-property fingering 'digit)))
     (set! (ly:music-property music 'tweaks)
           (acons 'stencil
                  (lambda (grob)
                    (let ((dash-ext (ly:stencil-extent
                                     (grob-interpret-markup grob (make-char-markup #x2012))
                                     X)))
                      (ly:grob-translate-axis! grob (/ (interval-length dash-ext) -2) X)
                      (grob-interpret-markup grob (make-concat-markup
                                                   (list (make-char-markup #x2012)
                                                         (number->string finger))))))
                  (ly:music-property music 'tweaks)))
     music))

%% Print a finger number preceded by a \"-\" to indicate a shift"
shiftUp = #(define-music-function (text) (string?)
             (set! text (make-concat-markup
                         (list (make-char-markup #x2012) text)))
             (make-music 'TextScriptEvent
                         'direction UP
                         'text (markup #:center-align #:finger text)
                         )
             )
%% Print a finger number preceded by a \"-\" to indicate a shift"
shiftDown = #(define-music-function (text) (string?)
               (set! text (make-concat-markup
                           (list (make-char-markup #x2012) text)))
               (make-music 'TextScriptEvent
                           'direction DOWN
                           'text (markup #:center-align #:finger text)
                           )
               )


%% staccato %%%%%%%%%%%%%%%%%
#(define (make-script x)
   (make-music 'ArticulationEvent
               'articulation-type x))

#(define (add-script m x)
   (case (ly:music-property m 'name)
     ((NoteEvent) (set! (ly:music-property m 'articulations)
                        (append (ly:music-property m 'articulations)
                                (list (make-script x))))
                  m)
     ((EventChord)(set! (ly:music-property m 'elements)
                        (append (ly:music-property m 'elements)
                                (list (make-script x))))
                  m)
     (else #f)))

#(define (add-staccato m)
   (add-script m "staccato"))

addStaccato = #(define-music-function (music)
                 (ly:music?)
                 (map-some-music add-staccato music))

%% end staccato %%

% usage:
% <note> _\rit <note> -\rit <note> ^\rit
aTempo     = \markup { \italic "a tempo" }
doux       = \markup { \bold \italic "doux" }
espressivo = \markup { \bold \italic "espressivo" }
rall       = \markup { \smaller \italic "rall. a tempo" }
rit        = \markup { \italic "rit." }
pocorit    = \markup { \italic "poco rit." }
CCcresc    = \markup { \bold \italic "cresc." }


%%% Bowing Marks %%%
db  = #(make-articulation 'downbow)
%ub  = #(make-articulation 'upbow)
ub = #(let ((m (make-articulation 'upbow)))
        (set! (ly:music-property m 'tweaks)
              (acons 'font-size -2
                     (ly:music-property m 'tweaks)))
        m)




% usage: is \tri{c8 d e }
tri = #(define-music-function (music) (ly:music?)
         #{\tuplet 3/2 $music #})

% usage: is \sext{c8 d e f g a }
sext = #(define-music-function (music) (ly:music?)
          #{\tuplet 6/4 $music #})


% usage: is \glissSize #5 a e
%
glissSize = #(define-event-function (length)
               (number?)
               #{
                 \tweak minimum-length #length
                 \tweak springs-and-rods #ly:spanner::set-spacing-rods
                 \glissando
               #}
               )

%%
% RESTEZ
%

restezFinger =
#(define-music-function (StringNumber music)(string? ly:music?)
   (let ((arg (string-append "" StringNumber)))
     #{
       \override TextSpanner.style = #'solid
       \override TextSpanner.font-size = #-3
       \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
       \override TextSpanner.bound-details.left.text = \markup {\number $StringNumber }
       $(text-spanner-start-stop music)
     #}))



triplet =
#(define-music-function (notes) (ly:music?)
   #{ \tuplet 3/2 { #notes } #})


restezFinger_OLD =
#(define-music-function (FingerNumber music) (string? ly:music?)
   %% workaround
   %% http://lilypond.1069038.n5.nabble.com/Re-Cello-fingering-indications-td166091.html
   (set! music (event-chord-wrap! music))
   #{
     \override Voice.TextSpanner.style = #'solid
     \override Voice.TextSpanner.font-size = #-5
     %\override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
     \override TextSpanner.bound-details.left.text = \markup { \number $FingerNumber " "}
     #(begin
       (let* ((elts (ly:music-property music 'elements)))
         (set! (ly:music-property (car elts) 'elements)
               (cons (make-music 'TextSpanEvent 'span-direction -1)
                     (ly:music-property (car elts) 'elements)))
         (set! (ly:music-property (car (reverse elts)) 'elements)
               (cons (make-music 'TextSpanEvent 'span-direction 1)
                     (ly:music-property (car (reverse elts)) 'elements)))
         (make-music 'SequentialMusic 'elements (list music))))
   #})

%
#(define (text-spanner-start-stop mus)
   (let ((elts (ly:music-property mus 'elements)))
     (make-music 'SequentialMusic 'elements
                 (append
                  (list (make-music 'TextSpanEvent 'span-direction -1))
                  (reverse (cdr (reverse elts)))
                  (list (make-music 'TextSpanEvent 'span-direction 1))
                  (list (last elts))))))

%% Restez in the same position
restezPos =
#(define-music-function (strg music)(string? ly:music?)
   (let ((arg (string-append "" strg)))
     #{
       \override TextSpanner.bound-details.left.text = $arg
       \override TextSpanner.style = #'solid
       \override TextSpanner.font-size = #-3
       $(text-spanner-start-stop music)
     #}))

%% Restez in the same position
restez =
#(define-music-function (music)( ly:music?)
   (let ((arg (string-append "" "")))
     #{
       \override TextSpanner.bound-details.left.text = "Restez"
       \override TextSpanner.style = #'solid
       \override TextSpanner.font-size = #-3
       \override TextSpanner.bound-details =
       #`((left
           (text . ,#{ \markup { "Restez" } #})
           (Y . 0)
           (padding . 0.25)
           (attach-dir . -2))
          (right
           (text . ,#{ \markup { \draw-line #'( 0 . -.5) } #})
           (Y . 0)
           (padding . 0.25)
           (attach-dir . 2)))

       $(text-spanner-start-stop  music)
     #}
     )
   )
