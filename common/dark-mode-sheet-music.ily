% Dark Mode Sheet Music Include File
% Include this file to render LilyPond scores with dark background and light notation
%
% Usage:
%   \include "../../common/dark-mode-sheet-music.ily"
%
% Original concept and UI by Simon Albrecht
% page-post-process implementation thanks to Thomas Morley:
% https://lists.gnu.org/archive/html/lilypond-user/2025-01/msg00018.html
%
% Color options for notation (print-color):
%   - "white"        : Pure white (high contrast)
%   - "ivory"        : Off-white, easier on eyes (recommended)
%   - "antiquewhite" : Warm off-white
%   - "navajowhite"  : Warmer, slightly yellow tint
%
% Color options for background (background-color):
%   - "black"           : Pure black
%   - #(x11-color "gray20") : Dark gray (recommended, matches web dark mode)
%   - "midnightblue"    : Deep blue
%   - "darkslategray"   : Dark blue-gray

\version "2.24.0"

\paper {
  % Dark gray background - matches the web interface dark mode
  background-color = #(x11-color "gray20")

  % Ivory notation - softer than pure white, easier on eyes
  print-color = "ivory"

  % Page post-processor to apply colors to the entire page
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
