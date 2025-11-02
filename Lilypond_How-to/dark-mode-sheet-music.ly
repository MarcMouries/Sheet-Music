% Dark Mode Sheet Music
\version "2.24.0"
% Concept and UI by Simon Albrecht
% page-post-process implementation thanks to Thomas Morley:
% https://lists.gnu.org/archive/html/lilypond-user/2025-01/msg00018.html

\paper {
  tagline = ##f
  background-color = #(x11-color "gray20")
  print-color = "ivory"

  #(define (page-post-process layout pages)
     (let ((print-color (ly:output-def-lookup $defaultpaper 'print-color #f))
           (background-color
            (ly:output-def-lookup $defaultpaper 'background-color #f)))
       (for-each
        (lambda (page)
          (let ((page-stencil (ly:prob-property page 'stencil)))
            (set! (ly:prob-property page 'stencil)
                  (if (not background-color)
                      (stencil-with-color page-stencil print-color)
                      (ly:stencil-add
                       (stencil-with-color
                        (make-filled-box-stencil
                         (ly:stencil-extent page-stencil X)
                         (ly:stencil-extent page-stencil Y))
                        background-color)
                       (stencil-with-color page-stencil print-color))))))
        pages)))
}