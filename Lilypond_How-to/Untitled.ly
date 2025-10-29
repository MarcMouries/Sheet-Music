\version "2.24.0"

% ==========================================================
% Helpers
% ==========================================================

% 1) Your writeMusic (unchanged, just reformatted)
#(define-markup-command (writeMusic layout props music) (ly:music?)
   (let* ((score (ly:make-score music))
          (score-layout (ly:output-def-clone $defaultlayout)))
     (ly:output-def-set-variable! score-layout 'indent 0)
     (ly:score-add-output-def! score score-layout)
     (interpret-markup layout props (markup #:score score))))

% 2) Inline code (monospace)
#(define-markup-command (code layout props s) (string?)
   (interpret-markup layout props (markup #:typewriter s)))

% 3) Two-column example: music on the left, code on the right
#(define-markup-command (exampleRow layout props mus codeStr)
   (ly:music? string?)
   (interpret-markup layout props
     (markup
       \fill-line {
         \column { \writeMusic mus }
         \column { "=>" }
         \column { \code codeStr }
       })))

% 4) Section header helper (title + small subtitle)
#(define-markup-command (sectionHeader layout props title subtitle)
   (string? string?)
   (interpret-markup layout props
     (markup
       \vspace #1
       \fill-line {
         ""
         \column {
           \center-align \fontsize #3 \bold title
           \vspace #0.25
           \center-align \italic subtitle
         }
         ""
       }
       \vspace #0.5)))
