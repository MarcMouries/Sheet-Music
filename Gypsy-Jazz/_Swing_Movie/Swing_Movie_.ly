\version "2.24.0"
\language "english"

%\include "profondo.ily"
%\include "LilyJAZZ.ily"
%\include "improviso.ily"
%\include "paganini.ily"



\header {
  title = "from the Movie Swing (2002)"
  composer = ""
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=200
}

chordNames = \chordmode {
  \global
  a1:7 d2:7 a1:9

}

melody = \relative c'' {
  \global
  a'2 cs,8 d fs a
  c2 b4 a 
  g2 fs8 g gs a
  bf2 a4 g
  \break
  fs4
  %\tuplet 3/2
  {d'8-4 c b } a8 fs
  d8
  %\tuplet 3/2
  {b8 bf a} gs8  fs'4 cs8 d8~
  d2 cs8 r8 r4
}

\markup \override #'(box-padding . 0.4) \box "In A"
\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout {indent=0 }
  \midi { }
}


\markup \override #'(box-padding . 0.4) \box "In D"

\score {
  <<
    \new ChordNames { \transpose a d, \chordNames}
    \new Staff      { \transpose a d  \melody    }
  >>
  \layout {indent=0 }
  \midi { }
}


#(define (average a b c) (/ (+ a b c) 3))

#(define-markup-command (draw-line layout props dest)
  (number-pair?)
  #:category graphic
  #:properties ((thickness 1))
  "…documentation…"
  (let ((th (* (ly:output-def-lookup layout 'line-thickness)
               thickness))
        (x (car dest))
        (y (cdr dest)))
    (make-line-stencil th 0 0 x y)))

   % \markup \draw-line #'(20 . 0)


\markup \concat {
  \left-column { "This is the text" "on the left," }
  \hspace #2 \raise #1 \draw-line #'(0 . -4) \hspace #2
  \left-column { "and the text" "on the right"  }
}

\markup \strut
\markup \strut

\markup \fill-line {
  \column { "This is the text" "on the left," }
  \column { "and the text" "on the right"  }
}