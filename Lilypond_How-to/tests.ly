\version "2.24.4"


#(define-markup-command (exampleLR_A layout props left right) (markup? markup?)
   (interpret-markup layout props
     #{
       \markup \fill-line { \column { #left }  \column { \typewriter "➡" }   \column { #right }  }
     #}))



% #(define-markup-command (exampleLR_C layout props music_code) (ly:music? )
%    (interpret-markup layout props
%      #{
%        \markup \fill-line { \column { \score {#music_code} }  
%                             \column { \typewriter "➡" }
%                             \column { \score  #music_code }  }
%      #}))

#(define-markup-command (exampleLR_B layout props left right) (markup? markup?)
  (interpret-markup layout props
   (markup #:column (#:vspace 1
                     #:fill-line (#:fontsize 3 title)
                     #:vspace 1))))


\markup \section-title "Title 2"


example_bowing = \relative c'' { c4(\downbow d) e(\upbow f) }


%\markup \exampleLR_C \example_bowing


% 
% 
\markup \bold "1) Plain text left/right : Just with strings"
\markup \exampleLR_A "leftText" "rightText"
% 
% \markup \bold "2) Another example"
% \markup \exampleLR_A "foo" "bar"
% 
% 
% \markup \bold "1) Plain text left/right : Just with strings"
% \markup \exampleLR_A "leftText" "rightText"
% 
% \markup \bold "1) Plain text left/right : Just with strings"
% %\markup \exampleLR_B "leftText" "rightText"
% 
% \markup \bold "1) Plain text left/right : Just with strings"
% %\markup \exampleLR_B "leftText" "rightText"

% 
% 
% \markup \vspace #2  
% \markup \bold { "Bowing"}
% example_bowing = \relative c'' { c4(\downbow d) e(\upbow f) }
% 
% \markup \fill-line {
%   \column { \score { \example_bowing }} 
%   \column { "=>" }
%   \column { \typewriter "c4(\downbow d) e(\upbow f)" }  
% }
% 
% 
% \markup \bold "2) Score on the left, code on the right"
% \markup \exampleLR
%   \score { \new Staff { c'4 d e f }  }
%   \typewriter "c'4 d e f"





% --- Example row: left = music object, right = code string (wrapped) ---
% #(define-markup-command (exampleLRs layout props mus codestr)
%   (ly:string? string?)
%   (interpret-markup layout props
%     #{
%       \markup \fill-line {
%         \column {  #mus }
%         \column { \typewriter "⇨" }
%         \column {
%           \override #'(line-width . 95)
%           \typewriter \wordwrap-string #codestr
%         }
%       }
%     #}))

example_bowing = \relative c'' { c4(\downbow d) e(\upbow f) }


%\markup \exampleLRs \example_bowing "b"