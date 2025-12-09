\version "2.19.26"

\paper {
  #(define fonts (set-global-fonts
    #:music "emmentaler"
    #:brace "emmentaler"
    #:roman "Century Gothic"
    #:sans "sans-serif"
    #:typewriter "monospace"
    #:factor (/ staff-height pt 20)
  ))
}



\header {
  title = "Formatting of piece headers"
  composer = "Marc Mouries"
  genre = "Exercise"
}

\paper {
   scoreTitleMarkup = \markup {
    \column {
      \on-the-fly #print-all-headers { \bookTitleMarkup \hspace #1 }
      \fill-line {
        \fontsize #3 \bold \fromproperty #'header:piece
        \fromproperty #'header:opus
      }
    }
  }
}

\markuplist {
  \vspace #1
  \fill-line {
    \justify-string # "If you have multiple pieces in a large work, 
        you can use multiple score parts and use the piece header 
        field to supply a title for each of the pieces. However, 
        the font is very small. You can either directly put the 
        markup into the piece=... header field, or better re-define 
        the scoreTitleMarkup function in the paper section."
  }
  \vspace #1
}

\score {
  \context Staff << { c'1 | R1 } >>
  \header{ piece="Piece 1" }
}

\score {
  \context Staff << { c'1 | R1 } >>
  \header{ piece="Piece 2" }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LSR workaround:
\markup\vspace #.5

\markup {
    "default"
}
\markup {
    \override #'(font-family . sans)
    "sans"
}
\markup {
    \override #'(font-family . typewriter)
    "typewriter"
}
\markup {
    "default"
}
\markup {
    \override #'(font-family . typewriter)
  "typewriter"
}