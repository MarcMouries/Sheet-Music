\version "2.24.4"

\markup {
  "The following music source is included verbatim:"
  \verbatim-file #"./verbatim-snippet.ly"
}

\score { \include "./verbatim-snippet.ly"}




\markup \strut
\markup \strut

\markup \fill-line {
  \column { \score { \include "./verbatim-snippet.ly"}}
  \column { "=>" }
  \column { \verbatim-file #"./verbatim-snippet.ly"  }
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


\markup \fill-line {
  \column { "This is the text" "on the left," }
  \column { "and the text" "on the right"  }
}

\markup \concat {
  \left-column { "This is the text" "on the left," }
  \hspace #2 \raise #1 \draw-line #'(0 . -4) \hspace #2
  \left-column { "and the text" "on the right"  }
}