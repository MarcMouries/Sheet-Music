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

\header {
  tagline = ##f
}
  \layout {
    \override LyricText.font-size = #-2
    \override LyricText.font-name = #"Arial"
  }

\paper {
  indent = 10 \mm

  % Spacing between title/composer and music
  markup-system-spacing.basic-distance = #16  % Space after header markup (title/composer) before first system
  markup-system-spacing.padding = #2


  % Custom title formatting - pulls from header fields above
  bookTitleMarkup = \markup {
    %\override #'(font-name . "Helvetica Neue")
    \override #'(font-name . "Arial") 
    
    \fill-line {
      \fontsize #-2
      \column {
        \line { \fromproperty #'header:notes }
        \line { \fromproperty #'header:arranger }
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