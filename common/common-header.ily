% Common header settings for all sheet music
% Include this file AFTER your \header block with:
%   \include "../../common/common-header.ily"
%
% This will automatically set tagline = ##f
%
% Example usage:
%   \version "2.24.0"
%   \language "english"
%
%   \header {
%     title = "Your Title"
%     composer = "Composer Name"
%     country = "Country"
%     style = "genre/style"
%   }
%
%   \include "../../common/common-header.ily"

\version "2.24.0"

% Helper function to check if transcriber exists
#(define (transcriber-exists layout props)
   (chain-assoc-get 'header:transcriber props))

\header {
  tagline = ##f
}
  \layout {
    \override LyricText.font-size = #-2
    \override LyricText.font-name = #"Arial"

    % Increase spacing between staff lines for better readability
    \context {
      \Score
      \override StaffSymbol.staff-space = #1.1  % Default is 1.0, increase to 1.1 for wider spacing
    }
  }

%\paper{ #(define fonts
%           (make-pango-font-tree
%            "Arial"
%            "Arial"
%            "Arial" (/ 18 20))) }


% \paper {
%   #(define fonts
%     (set-global-fonts
%     #:music "lilyboulez"
%     #:brace "emmentaler"
%     #:roman "copperplate"
%     #:sans "Helvetica"
%     #:typewriter "Andale Mono"
%     #:factor (/ staff-height pt 20)
%   ))
% }

\paper {
  indent = 10 \mm

  % Spacing between title/composer and music
  markup-system-spacing.basic-distance = #16  % Space after header markup (title/composer) before first system
  markup-system-spacing.padding = #2
  
  %  between-system-space = 2.5\cm
%  between-system-padding = 2\cm
  %%set to ##t if your score is less than one page:
 % ragged-last-bottom = ##t
 % ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 0)
                             (minimum-distance . 8)
                             (padding . 10))
 % vertical spacing
 system-system-spacing =
    #'((basic-distance . 16)
       (minimum-distance . 12)
       (padding . 1)
       (stretchability . 60))



  % Custom title formatting - pulls from header fields above
  bookTitleMarkup = \markup {
    %\override #'(font-name . "Helvetica Neue")
    \override #'(font-name . "Arial") 
    
    \fill-line {
      \fontsize #-2
      \column {
        \line { \fromproperty #'header:notes }
        \line {
          \if \transcriber-exists {
            "Transcription by " \fromproperty #'header:transcriber
          }
        }
      }
      \center-column {
        \override #'(font-name . "Garamond Premier Pro Semibold") 
        \bold \fontsize #2 \smallCaps \fromproperty #'header:title
        \fontsize #-2 \fromproperty #'header:subtitle
      }
      \fontsize #-2
      \column {
        \fromproperty #'header:composer
      }
    }
  }
}



% \paper {
%   % Define how to format the title using the simple string from header
%   bookTitleMarkup = \markup {
%     \column {
%       \fill-line { 
%        \override #'(font-name . "Garamond Premier Pro Semibold") 
%         \fontsize #2 \smallCaps \fromproperty #'header:title
%       }
%       \fill-line {  \medium \fromproperty #'header:composer   }
%     }
%   }
% }

