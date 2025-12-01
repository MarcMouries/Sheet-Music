\version "2.24.4"
\language "english"

\header {
  title = "Waterfall Arpeggios"
}

\include "../common/common-header.ily"

global = { \time 4/4 }

% -------------------------
% C major 
% -------------------------
waterfall_C = \relative c''' {
  \global \key c \major
  g8 e c d   e c g a   c g e f
  g e c d   e c g a   c2
}

% -----------------------------------------
% G major 
% -----------------------------------------
waterfall_G = \relative c''' {
  \global \key g \major
  b8-4 g e fs   g e b c   e b g a
  b g e fs      g e b c   g2
}

% ----------------
% D major 
% ----------------
waterfall_D = \relative c''' {
  \global \key d \major
  a8 fs d e   fs d a b   d a fs g
  a fs d e    fs d a b   d2
}

% -------------------------------------------------
% A major 
% -------------------------------------------------
waterfall_A = \relative c''' {
  \global \key a \major
  a8-3 e cs d   e cs a b   cs a e fs
  a e cs d      e cs a b    a2
}

% -----------------------------------------
% B major 
% -----------------------------------------
waterfall_B = \relative c''' {
  \global \key b \major
  b8-4 fs ds e   fs ds b cs   ds b fs gs
  b fs ds e      fs ds b cs    b2
}

% ----------------------------------------------
% B♭ major 
% ----------------------------------------------
waterfall_Bf = \relative c''' {
  \global \key bf \major
  bf8-4 f d ef   f d bf c   d bf f g
  bf f d ef      f d bf c    bf2
}

% ----------------------------------------------
% E♭ major 
% ----------------------------------------------
waterfall_Ef = \relative c''' {
  \global \key ef \major
  bf8-4 g ef f   g ef bf c   ef bf g af
  bf g ef f      g ef bf c    ef2
}

% -------------------------
% Simple I-chord labels
% -------------------------
chords_C  = \chordmode { c1 }
chords_G  = \chordmode { g1 }
chords_D  = \chordmode { d1 }
chords_A  = \chordmode { a1 }
chords_B  = \chordmode { b1 }
chords_Bf = \chordmode { bf1 }
chords_Ef = \chordmode { ef1 }

\book {
  \bookpart {
    \markup \bold \larger "C major"
    \score { << \new ChordNames \chords_C  \new Staff { \waterfall_C } >> }

    \markup \bold \larger "G major"
    \score { << \new ChordNames \chords_G  \new Staff { \waterfall_G } >> }

    \markup \bold \larger "D major"
    \score { << \new ChordNames \chords_D  \new Staff { \waterfall_D } >> }

    \markup \bold \larger "A major"
    \score { << \new ChordNames \chords_A  \new Staff { \waterfall_A } >>  }

    \markup \bold \larger "B major"
    \score { << \new ChordNames \chords_B  \new Staff { \waterfall_B } >>  }

    \markup \bold \larger "B♭ major"
    %\markup \bold \larger \concat {"B" \flat " major"}

    \score { << \new ChordNames \chords_Bf \new Staff { \waterfall_Bf } >> }

    \markup \bold \larger "E♭ major"
    \score { << \new ChordNames \chords_Ef \new Staff { \waterfall_Ef } >>  }
  }
}
