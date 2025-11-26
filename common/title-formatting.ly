%% title-formatting.ly
%% Reusable title formatting styles for LilyPond sheet music
%%
%% Usage: \include "common/title-formatting.ly"
%%
%% This file provides several pre-defined title styles that pull data from
%% your \header block (title, composer, arranger, etc.) and format them
%% nicely on the page.
%%
%% Make sure your \header block contains plain strings (not \markup):
%%   \header {
%%     title = "My Title"
%%     composer = "Composer Name"
%%     arranger = "Arranger Name"
%%     style = "genre"
%%     tagline = ""
%%   }

\version "2.19.11"

%% STYLE 1: Simple centered title with composer
%% To use: Add this to your \paper block after including this file:
%%   \paper {
%%     \simpleTitle
%%   }
#(define simpleTitle
  #{
    bookTitleMarkup = \markup {
      \column {
        \vspace #1
        \fill-line {
          \fontsize #5
          \bold
          \fromproperty #'header:title
        }
        \vspace #0.5
        \fill-line {
          \fontsize #2
          \fromproperty #'header:composer
        }
        \vspace #1
      }
    }
  #})

%% STYLE 2: Real Book style (three columns)
%% To use: Add this to your \paper block:
%%   \paper {
%%     \realBookStyle
%%   }
#(define realBookStyle
  #{
    bookTitleMarkup = \markup {
      \fill-line {
        \fontsize #-5
        \column {
          \line { "Transcription" }
          \line { "by " \fromproperty #'header:arranger }
        }
        \center-column {
          \fontsize #1
          \bold
          \fromproperty #'header:title
          \fontsize #-3
          \fromproperty #'header:subtitle
        }
        \fontsize #-5
        \column {
          \fromproperty #'header:composer
          \line { "arr. " \fromproperty #'header:arranger }
        }
      }
    }
  #})

%% STYLE 3: Classical style (centered with subtitle)
%% To use: Add this to your \paper block:
%%   \paper {
%%     \classicalStyle
%%   }
#(define classicalStyle
  #{
    bookTitleMarkup = \markup {
      \column {
        \vspace #2
        \fill-line {
          \override #'(font-name . "Garamond Premier Pro Semibold")
          \abs-fontsize #15
          \smallCaps
          \fromproperty #'header:title
        }
        \vspace #0.5
        \fill-line {
          \fontsize #-1
          \italic
          \fromproperty #'header:subtitle
        }
        \vspace #0.5
        \fill-line {
          \medium
          \fromproperty #'header:composer
        }
        \vspace #1.5
      }
    }
  #})

%% STYLE 4: Minimal style (small, unobtrusive)
%% To use: Add this to your \paper block:
%%   \paper {
%%     \minimalStyle
%%   }
#(define minimalStyle
  #{
    bookTitleMarkup = \markup {
      \column {
        \vspace #0.5
        \fill-line {
          \fontsize #2
          \fromproperty #'header:title
        }
        \fill-line {
          \fontsize #-1
          \fromproperty #'header:composer
        }
        \vspace #0.5
      }
    }
  #})

%% Optional: Page headers (odd/even pages)
%% Uncomment and add to your \paper block if desired:
%%
%% oddHeaderMarkup = \markup {
%%   \fill-line {
%%     \on-the-fly #not-first-page
%%     \fromproperty #'page:page-number-string
%%     ""
%%     \on-the-fly #not-first-page
%%     \italic \fromproperty #'header:title
%%   }
%% }
%%
%% evenHeaderMarkup = \markup {
%%   \fill-line {
%%     \on-the-fly #not-first-page
%%     \italic \fromproperty #'header:composer
%%     ""
%%     \on-the-fly #not-first-page
%%     \fromproperty #'page:page-number-string
%%   }
%% }
