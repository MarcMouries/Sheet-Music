\version "2.24.4"
\language "english"

\header {
  title = "Chord Tone Surround Exercises"
  subtitle = "Surround each chord tone with a diatonic upper neighbor and chromatic lower neighbor"
  tagline = ""
}

global = { \time 4/4 }

exerciseText = \markup {
  \column {
    \line { "For each chord tone of the I chord (1, 3, 5):" }
    \line { "    1) Play the diatonic scale step above" }
    \line { "    2) Then the chord tone" }
    \line { "    3) Then the half-step below" }
    \line { "    4) And resolve back to the chord tone" }
    \vspace #1
    \line { "(This develops accurate intonation and internal tonal awareness.)" }
  }
}

% =============================
% C major (C–E–G)
% =============================
surround_C = \relative c'' {
  \global \key c \major
  d8 c b c    f e ef e    a g fs g    c2
}

% =============================
% G major (G–B–D)
% =============================
surround_G = \relative c'' {
  \global \key g \major
  a8 g fs g    c b bf b    e d cs d    g2
}

% =============================
% D major (D–F#–A)
% =============================
surround_D = \relative c'' {
  \global \key d \major
  e8 d cs d    g fs f fs    b a gs a    d2
}

% =============================
% A major (A–C#–E)
% =============================
surround_A = \relative c'' {
  \global \key a \major
  b8 a gs a    d cs c cs    fs e ds e    a2
}

% =============================
% B major (B–D#–F#)
% =============================
surround_B = \relative c'' {
  \global \key b \major
  cs8 b as b    e ds d ds    gs fs f fs    b2
}

% =============================
% B♭ major (Bb–D–F)
% =============================
surround_Bf = \relative c'' {
  \global \key bf \major
  c8 bf a bf    ef d df d    g f e f    bf2
}

% =============================
% E♭ major (Eb–G–Bb)
% =============================
surround_Ef = \relative c'' {
  \global \key ef \major
  f8 ef d ef    af g gf g    c bf b bf   ef2
}

% =============================
% BOOK / SCORE OUTPUT
% =============================
\book {
  \bookpart {
    \markup \larger \bold "Chord Tone Surround Exercises"
    \markup \vspace #1
    \exerciseText

    
    
    \score { \new Staff \with { instrumentName = \markup \bold "C major" }  \surround_C }

    \markup \bold "G major"
    \score { \new Staff \surround_G }

    \markup \bold "D major"
    \score { \new Staff \surround_D }

    \markup \bold "A major"
    \score { \new Staff \surround_A }

    \markup \bold "B major"
    \score { \new Staff \surround_B }

    \markup \bold "B♭ major"
    \score { \new Staff \surround_Bf }

    \markup \bold "E♭ major"
    \score { \new Staff \surround_Ef }
  }
}
