\include "english.ly"
\version "2.24.0"

%=============================================
%   created by MuseScore Version: 1.3
%          September 28, 2014
%=============================================
%% http://lsr.di.unimi.it/LSR/Item?id=838

%LSR completed by P.P.Schneider on Feb. 2014 for v2.18

#(define ((bars-per-line-engraver bar-list) context)
  (let* ((working-copy bar-list)
         (total (1+ (car working-copy))))
    `((acknowledgers
       (paper-column-interface
        . ,(lambda (engraver grob source-engraver)
             (let ((internal-bar (ly:context-property context 'internalBarNumber)))
               (if (and (pair? working-copy)
                        (= (remainder internal-bar total) 0)
                        (eq? #t (ly:grob-property grob 'non-musical)))
                   (begin
                     (set! (ly:grob-property grob 'line-break-permission) 'force)
                     (if (null? (cdr working-copy))
                         (set! working-copy bar-list)
                         (begin
                           (set! working-copy (cdr working-copy))))
                           (set! total (+ total (car working-copy))))))))))))




#(set-global-staff-size 22)
#(set-default-paper-size "letter")

\paper {
 % line-width    = 190\mm
 % left-margin   = 10\mm
 % top-margin    = 10\mm
 % bottom-margin = 20\mm
  %%indent = 0 \mm
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##t
  %% in orchestral scores you probably want the two bold slashes
  %% separating the systems: so uncomment the following line:
  %% system-separator-markup = \slashSeparator
}


myMusic = \relative c'' {
    \time 6/8
    \partial 8
    \mark \default
    g8
    \repeat volta 2 {
            \repeat unfold 7 {  c8 c c c c c  }
      g4~g8 g4
    }
    \break

    \mark \default
        \partial 8 g8
    \repeat volta 2 {
            \repeat unfold 7 {  c8 c c c c c  }
    }
    \alternative {
     { c  c c  c c c}
     { c, c c  c c c}
    }
        \break
    \mark \default
    \repeat volta 2 {
      \repeat unfold 8 {  c8 c c c c c  }
    }
}

\score {
  \new Staff {
    %\once\override Score.RehearsalMark.self-alignment-X = #LEFT
    \override Score.RehearsalMark.break-align-symbols = #'(clef)

    \myMusic
  }
  \layout {
    indent = 0
    \context {
      \Score
      %use the line below to insist on your layout
      %\override NonMusicalPaperColumn.line-break-permission = ##f
      \consists #(bars-per-line-engraver '(4 4 4 5))
    }
  }
}