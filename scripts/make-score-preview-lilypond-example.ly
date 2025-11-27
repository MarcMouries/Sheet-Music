\version "2.24.4"
\language "english"

\header {
  title    = "Score Preview Example"
  subtitle = "a subtitle"
  composer = "Example Composer"
}



global = {
  \key g \major
  \time 4/4
}

fullMusic = \relative c' {
  \global

  % ============================================
  % PREVIEW: FIRST 4 BARS
  % ============================================
  
  
    c4 e g b |          % bar 1
    c2 b4 a |           % bar 2
    d4 d e f |          % bar 3
    g1 |                % bar 4
    \break             
  
    % Bars 1–4
    d,4 fs a b |
    c2 b4 a |
    d4 d e f |
    g1 |
    \break

    % Bars 5–8
    e,4 g b fs |
    a2 g4 a |
    b4 c d e |
    g1 |
  \break
  fs,4 a  c e |
  b2 g4 a |
  d4 c b a |
  g1 
  \break
    g,4 b d f |          % bar 1
    c2 b4 a |           % bar 2
    d4 d e f |          % bar 3
    g1 |                % bar 4
    \break             
  
    % Bars 1–4
    a,4 c e g |
    c2 b4 a |
    d4 d e f |
    g1 |
    \break

    
    b,,4 d fs a|  % Bars 25
    a2 g4 a |
    b4 c d e |
    g1 |
  \break
  c,4 e g b |          % bar 1
    c2 b4 a |           % bar 2
    d4 d e f |          % bar 3
    g1 |                % bar 4
    \break             
  
    % Bars 1–4
    d,4 fs a b |
    c2 b4 a |
    d4 d e f |
    g1 |
    \break

    % Bars 5–8
    e,4 g b fs |
    a2 g4 a |
    b4 c d e |
    g1 
  \bar "|."
}

\score {
  \new Staff \fullMusic
  \layout {
    indent = 0
    ragged-last = ##f
    ragged-bottom = ##f
  }
}
