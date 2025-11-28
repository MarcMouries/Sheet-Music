\version "2.24.4"
\language "english"

\include "../../stylesheets/twoByTwoBeaming.ly"
\include "../../stylesheets/bars-per-line-engraver.ly"

\header {
  title = "The Mad Lover"
  composer = "John Eccles"
  country = "England"
  style = "classical"
}

global = {
  \time 3/4
  \key f \minor
  \tempo 4 = 100
}

chordNames = \chordmode {
  \global
  f2.:m  c2.:m df  c:m f:m c df
}

melody = \relative c'' {
  \global

  %  \twoByTwoBeaming

  r8 c f af g f
  \repeat volta 2 {
    g   c,    c   g'    af  g
    g   bf,   bf  f'    g   f
    f   af,   g   f     g   e'
    f   c     f   af    g   f
    g   c,    c   af'   af  g
    g   bf,   bf  f'    g   f
    f   af,   g   f     g   e'
    f   af,   af  c     c   ef!
    ef  g,    g   bf    bf  df
    df  f,    f   af    af  c
    c   e,    e   g     g   bf
    bf  af    af  c     c   ef!
    ef  g,    g   bf    bf  df
    df  f,    f   af    af  c
    c   e,!   e   g     g   bf
    bf  af    af  f'    f   af,
    af  bf    bf  f'    f   bf,
    bf  c     c   f     f   c
    c   df    df  g,    g   bf
    bf  af    af  f'    f   af,
    af  bf    bf  f'    f   bf,
    bf  c     c   f     f   c
    c   df    df  g,    g   bf
    bf  af    af  c,    c   af'
    af  g     g   c,    c   g'
    g   f     f   c     c   f
    f   e     e   g     g   bf
    bf  af    af  c,    c   af'
    af  g     g   c,    c   g'
    g   f     f   c     c   f
    f   e     e   g     g   bf
    bf  a     a   f'    f   a,
    a   bf    bf  f'    f   bf,
    bf  c     c   f     f   c
    df  c     bf  af    g   e'
    f   a,    a   f'    f   a,
    a   bf    bf  f'    f   bf,
    bf  c     c   f     f   c
    df  c     bf  af    g   e'
  }
  \alternative {
    % First time
    {
      f c f af g f
    }
    % Second time
    {
      f2. \bar "|."    % Final barline
    }
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
%       style = "classical"
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
      composer = "John Eccles"
      piece = "Transposed down to E minor"
    }
    \score {
      <<
        \new ChordNames {
          \transpose c b, {
            \chordNames
          }
        }
        \new Staff {
          \key e \minor
          \transpose c b, {
            \melody
          }
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
          \consists #(bars-per-line-engraver '(5 4 4 4 4 4  4  4 4  5))
        }
      }
    }
  }% bookpart
} % book

