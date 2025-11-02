\version "2.24.4"

% 3 columns layout

#(define-markup-command (exampleLR_D layout props left_text right_text)  (markup? markup?)
   (interpret-markup layout props
      (markup
        #:column ( (#:vspace 1)
                   #:fill-line ( (#:column (left_text))
                                 (#:column ("➡"))
                                 (#:column (right_text))
                               )
                 )
          #:vspace 1)))

#(define-markup-command (exampleLR_E layout props left_text right_text) (markup? markup?)
   (interpret-markup layout props
      (markup
        #:column ( #:vspace 1
                   #:fill-line (  (#:column (left_text))
                                  (#:column ("➡"))
                                  (#:column (right_text))
                               )
                   #:vspace 1
                   ))))


#(define-markup-command (example layout props left_text right_text) (markup? markup?)
   (interpret-markup layout props
      (markup
          #:column (
              #:vspace 1
              #:fill-line (
                     (#:column (left_text))
                     (#:column ("➡"))
                     (#:column (right_text))
              ) ;; fill-line
              #:vspace 1
          ) ;; column
)))


\markup {
  \justify-line {
    ""
    \score { \relative c' { c4 d e f }}
    \combine \arrow-head #X #LEFT ##f \draw-line #'(3 . 0)
    "\verbatim-file"
    ""
  }
}

\markup \exampleLR_D "D leftText" "rightText"
\markup \exampleLR_D "D leftText" "rightText"
\markup \exampleLR_E "E leftText" "rightText"
\markup \exampleLR_E "E leftText" "rightText"




