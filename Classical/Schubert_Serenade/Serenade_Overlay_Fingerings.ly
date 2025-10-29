\version "2.24.0"
\language "english"

% This file DOES NOT change your pitches. It includes your original score
% and overlays position/fingering markups at precise beats using skips (s).
% Adjust the skip counts if bar alignment differs in your source.

\include "Schubert_Serenade.ly"  % expects \violin defined

pos = #(define-music-function (parser location txt) (string?)
  #{ ^\markup \box \small \bold $txt #})
upF = #(define-music-function (parser location txt) (string?)
  #{ ^\markup \small $txt #})
downF = #(define-music-function (parser location txt) (string?)
  #{ _\markup \small $txt #})

% Overlay voice with only skips + text; aligns to measures 5–24.
overlayAnnot = {
  \time 3/4
  % mm1–4: rests/skips
  s2.*4

  % mm5 — put position and D-note fingering right on beat 2 (adjust if needed)
  % beat1
  s4^\markup { \box \small \bold "3rd → 4th" }
  % beat2: primary 4 on D string, 4th pos; alt 3 on D string, 5th pos
  s8^\markup { \small "D: 4 (D‑string, 4th pos)" } s8_\markup { \small "alt: 3 (D‑string, 5th pos)" }
  % beat3
  s4

  % mm6
  s2.*1

  % mm7
  s2.*1

  % mm8
  s2.*1

  % mm9 — F on beat 2
  s4^\markup { \box \small \bold "4th → 6th" }
  s8^\markup { \small "F: 4 (D‑string, 6th pos)" } s8_\markup { \small "alt: 3 (D‑string, 7th pos)" }
  s4

  % mm10 — E on beat 2
  s4^\markup { \box \small \bold "6th → 5th" }
  s8^\markup { \small "E: 4 (D‑string, 5th pos)" } s8_\markup { \small "alt: 3 (D‑string, 6th pos)" }
  s4

  % mm11–12
  s2.*2

  % mm13–16 — stay high then relax
  s2.^\markup { \box \small \bold "5th → 6th" }
  s2.*1
  s2.^\markup { \box \small \bold "6th (apex)" }
  s2.*1

  % mm17–20 — apex phrase
  s2.^\markup { \box \small \bold "6th → 7th" }
  s2.*3

  % mm21–24 — return
  s2.^\markup { \box \small \bold "5th" }
  s2.*3
}

\score {
  <<
    \new Staff \with { instrumentName = "Violin" } { \violin }
    \new Voice { \overlayAnnot }
  >>
  \layout { }
}
