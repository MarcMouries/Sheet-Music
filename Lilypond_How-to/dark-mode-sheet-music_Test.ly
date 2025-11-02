\version "2.24.4"
\include "./dark-mode-sheet-music.ly"

\header {
  title = \markup { Rendering LilyPond files white on black }
  subtitle = \markup { for screen and projector use }
}

% this sampling function is quite crude and doesn’t cover custom RBG values
% (except for "grayNN" equivalents)
#(define-markup-command (color-sample layout props clr)
   (color?)
   (let ((name (if (string? clr)
                   (string-append "\"" clr "\"")
                   (string-append "#(x11-color \"gray"
                                  (number->string (inexact->exact (* 100 (car clr))))
                                  "\")"))))
     (interpret-markup layout props
                       #{\markup \line \general-align #Y #-1 \with-color $clr {
                         \beam #5 #0 #2
                         \with-dimension-from #Y \typewriter "yl" \typewriter $name
                       }#})))

\markup \left-column {
  \strut
  \line { Any objects with unspecified colour are printed according to \typewriter print-color. }
  \vspace #.3
  \line { Here are samples of pure white along with other colours that may be }
  \line { more traditional, more pleasant or easier on the eye: }
  \typewriter {
    \color-sample "white"
    \color-sample "ivory"
    \color-sample "antiquewhite"
    \color-sample "navajowhite"
  }
  \vspace #.3
  \line { The background color may also be adjusted through the paper variable \typewriter background-color. Ideas: }
  \vspace #.3
  \combine
  \translate #'(-.7 . -10) \with-color #white \filled-box #'(0 . 50) #'(0 . 13) #.7
  \left-column {
    \color-sample "black"
    \color-sample #(x11-color "gray20")
    \color-sample "midnightblue"
    \color-sample "darkslategray"
  }
  \vspace #.3
  \line { Appendix 7 of the Notation Reference lists available colors. }
  \strut
}

{ \relative c' {c d e f g a} } \addlyrics { test }