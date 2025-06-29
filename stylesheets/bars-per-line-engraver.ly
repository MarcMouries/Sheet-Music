\version "2.24.0"
%==========================================================
%  bars-per-line-engraver
%
%  This Scheme engraver for LilyPond lets you control how many
%  measures appear per line by specifying a repeating pattern
%  of bar counts.
%
%  Example:
%    \layout {
%      \context {
%        \Score
%        \consists #(bars-per-line-engraver '(2 3 4))
%      }
%    }
%
%  This will break lines after 2, then 3, then 4 bars, and repeat
%  the pattern throughout the score. Useful for consistent layout,
%  especially in music with changing time signatures.
%
%  Note:
%    The spacing engine may override line breaks if a line is too cramped.
%    To force breaks, you can uncomment the 'line-break-permission override
%    in the engraver if needed.
%
%  Source: http://lsr.di.unimi.it/LSR/Item?id=838
%  LSR completed by P.P. Schneider in Feb. 2014 for v2.18
%==========================================================


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
