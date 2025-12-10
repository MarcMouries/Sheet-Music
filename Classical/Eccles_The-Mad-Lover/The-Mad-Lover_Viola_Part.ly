% Viola part for "The Mad Lover" by John Eccles
% This file can be:
%   1. Compiled standalone to produce a viola part PDF
%   2. Included in full scores (the \score block is skipped)

\version "2.24.3"
\language "english"

global = {
  \time 3/4
  \key e \minor
}

viola = \relative c'' {
  \global
  % The viola line is an inner-voice ground mostly alternating notes
  % Bars 1–8
  b2 b4 |
  \repeat volta 2{
  | b2 b4
  | a2 a4
  | b2 b4
  | b2 b4
  | b2 b4
  | a2 a4
  | b2 b4
  % Bars 9–12
  | b2 b4
  | b4 a4 fs4
  | g4. g8 g8[ a8]
  | b4 fs4 b4
  % Bars 13–16
  | b2 b4
  | b4 a4 fs4
  | g4. g8 g8[ a8]
  | b4 fs4 b4
  % Bars 17-20
  | b2 b4
  | a2 a4
  | g4 b4 b4
  | a4 fs4 b4
  % Bars 21–24
  | b2 b4
  | a2 a4
  | g4 b4 b4
  | a4 fs4 b4
  % Bars 25–28
  | b4 e,4 g8 e
  | fs2 fs8 d
  | e2 e4
  | fs2 ds4
  % Bars 29–32
  | e2 g8 e
  | fs2 fs8 d
  | e2 e4
  | fs2 b4
  % Bars 33–36
  | b2 b4
  | a2 a4
  | gs4 b4 b4
  | a4 fs4 b4
  % Bars 37–40
  | b2 b4
  | a2 a4
  | gs4 b4 b4
  | a4 fs4 b4
  }
  \alternative {
    { b2 b4  }   % 1st ending
    { b2. \bar "|." }    % second ending
  }
}

% Conditional compilation: only generate \score if compiled standalone
% When included in another file with (ly:set-option 'included-as-part #t), skip the score

\header {
  title = "The Mad Lover"
  subtitle = "5. Air - Viola"
  composer = "John Eccles (1668–1735)"
  country = "England"
  instrument = "Viola"
  genre = "Classical"
}

\include "../../common/common-header.ily"

% Only generate score block if not included as part
#(if (not (ly:get-option 'included-as-part))
  (add-score
    #{
      \score {
        \new Staff \with {
          instrumentName = "Viola"
        } {
          \clef alto
          \viola
        }
        \layout { }
        \midi { }
      }
    #}))
