scoop = #(define-music-function ( note) (ly:music?) 
#{ 
  \once \override Slur #'extra-offset = #'(-.8 . 1.5) 
  \once \override Slur #'rotation = #'(-10 0 0) 
  \hideNotes \appoggiatura $note \unHideNotes 
#}) 

\relative c'' { 
  g4 \scoop f e f2 
} 
\relative c'' { 
  f \scoop g4 e f2 
} 


\relative c { 
c'2 
\once \override Slur #'extra-offset = #'(-1 . 0) 
\hideNotes \grace c8( \unHideNotes f4) g8 a 
} 


#(define (scoop-stencil grob)
  (ly:stencil-add
    (ly:note-head::print grob)
    (grob-interpret-markup grob
      (markup #:with-dimensions '(0 . 0) '(0 . 0)
              #:translate '(-0.2 . -0.5)
              #:path 0.25 '((moveto 0 0)
                            (curveto 0 -1 -1 -1.5 -1.5 -1.5))))))

scoop = \once \override NoteHead #'stencil = #scoop-stencil

\new Staff { \scoop c''4 }