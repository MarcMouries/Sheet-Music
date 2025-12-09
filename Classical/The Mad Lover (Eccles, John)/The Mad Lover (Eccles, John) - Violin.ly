\version "2.24.4"
\language "english"

\include "../../stylesheets/twoByTwoBeaming.ly"
\include "../../stylesheets/bars-per-line-engraver.ly"


\header {
  title = "The Mad Lover"
  composer = "John Eccles (1668 – 1735)"
  country = "England"
  genre = "Classical"
}

\include "../../common/common-header.ily"

global = {
  \time 3/4
  \key e \minor
  \tempo 4 = 100
}

\layout {
  indent = 0
  \context {
    \Score
    % Align marks with the key signature at system starts
    \override RehearsalMark.break-align-symbols = #'(key-signature)
    % Slight left alignment is usually nicer above the key
    \override RehearsalMark.self-alignment-X = #LEFT
    % Fine-tune horizontal/vertical nudges if desired:
    \override RehearsalMark.X-offset = #4
    \override RehearsalMark.Y-offset = #-2
  }
}




chordNames = \chordmode {
  \global
  \set majorSevenSymbol = \markup { maj7 }
  \mark \markup \box "A"
  e2.:m            d2.               c2.              b2.:m
  e2.:m            d2.               c2.              b2.:m
  \mark \markup \box "B"
  e2.:m            d2.               c2.              b2.:m
  e2.:m            d2.               c2.              b2.:m
  \mark \markup \box "C"
  e2.:m            d2.               c2.              b2.:m
  e2.:m            d2.               c2.              b2.:m
  \mark \markup \box "D"
  e2.:m            d2.               c2.              b2.:m
  e2.:m            d2.               c2.              b2.:m
  \mark \markup \box "E"
  e2.:m            d2.               c2.              b2.:m
  e2.:m            d2.               c2.              b2.:m
  e2.:m            e2.:m
}

melody = \relative c'' {
  \global
  % === Phrase A  ===
  r8 b e g fs e
  \repeat volta 2 {
    fs   b,    b   fs'    g  fs
    fs   a,   a  e'    fs   e
    e   g,   fs   e     fs   ds'
    e   b     e   g    fs   e
    fs   b,    b   g'   g  fs
    fs   a,   a  e'    fs   e
    e   g,   fs   e     fs   ds'

    % === Phrase B  ===
    e   g,   g  b     b   d!
    d  fs,    fs   a    a  c
    c  e,    e   g    g  b
    b   ds,    ds   fs     fs   a
    a  g    g  b     b   d!
    d  fs,    fs   a    a  c
    c  e,    e   g    g  b
    b   ds,!   ds   fs     fs   a

    % === Phrase C  ===
    a  g    g  e'    e   g,
    g  a    a  e'    e   a,
    a  b     b   e     e   b
    b   c    c  fs,    fs   a
    a  g    g  e'    e   g,
    g  a    a  e'    e   a,
    a  b     b   e     e   b
    b   c    c  fs,    fs   a

    % === Phrase X  ===
    a  g    g  b,    b   g'
    g  fs     fs   b,    b   fs'
    fs   e     e   b     b   e
    e   ds     ds   fs     fs   a
    a  g    g  b,    b   g'
    g  fs     fs   b,    b   fs'
    fs   e     e   b     b   e
    e   ds     ds   fs     fs   a
    a  gs     gs   e'    e   gs,
    gs   a    a  e'    e   a,
    a  b     b   e     e   b
    c  b     a  g    fs   ds'
    e   gs,    gs   e'    e   gs,
    gs   a    a  e'    e   a,
    a  b     b   e     e   b
    c  b     a  g    fs   ds'
  }
  \alternative {
    { e b e g fs e   } % First time
    { e2. \bar "|."  }  % Final barline
  }
}

% Score 1: Original version in F minor

% \book {
%
%   \bookpart {
%     \header {
%       title = "The Mad Lover"
%       composer = "John Eccles"
%       piece = "Original in F minor"
%     }
%     \score {
%       <<
%         \new ChordNames \chordNames
%         \new Staff {
%           \melody
%         }
%       >>
%       \layout {
%         \context {
%           \Voice
%           \twoByTwoBeaming
%         }
%         \context {
%           \Score
%           %use the line below to insist on your layout
%           %\override NonMusicalPaperColumn.line-break-permission = ##f
%           \consists #(bars-per-line-engraver '(5 4 4 4 4 4  4  4 4  5))
%         }
%       }
%     }
%   }% bookpart
% } % book



% Score 2: Transposed version (down a semitone to E minor)
\book {
  \bookpart {
    \header {
      title = "The Mad Lover"
      subtitle = "5. Air"
      composer = "John Eccles (1668 – 1735)"
      %piece = "Transposed down from F minor to E minor"
    }
    \score {
      <<
        \new ChordNames {
          \transpose c c { \chordNames }
        }
        \new Staff {
          \transpose c c { \melody    }
        }
      >>
      \layout {
        \context {
          \Voice
          \twoByTwoBeaming
        }
        \context {
          \Score
          %use the line below to insist on your layout
          %\override NonMusicalPaperColumn.line-break-permission = ##f
          \consists #(bars-per-line-engraver '(4 4 4 4 4 4 4 4 4 6))
        }
      }
    }
  }% bookpart
} % book

