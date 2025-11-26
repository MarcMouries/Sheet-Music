\version "2.24.0"
\language "english"

\include "../../stylesheets/stylesheet_fiddle.ly"

\header {
  title = "Darby O' Gill - Fox Chase"
  subtitle = "Irish Jig – Ornamented (top) vs Plain (bottom)"
  style = "irish traditional"
}

global = {
  \time 6/8
  \key c \major
  \tempo 4.=130
}

chordNames = \chordmode { \global }

% =========================
% ORNAMENTED MELODY (top)
% =========================
melodyOrn = \relative c''' {
  \global

  % ===== A1 =====
  \mark \markup \box "A1"
  r4.         r8  g8 f8
  e8. d16 c8  \acciaccatura d16 c8  b  c          % cut on repeated c
  a8  b  \acciaccatura b16 c8    g8  b  c         % slide into c (grace before c)
  c8  b  c    g8  f  e

  \break
  % ===== A2 =====
  \mark \markup \box "A2"
  f8. e16 f8  d8 g'8 f8
  e8. d16 c8  \acciaccatura d16 c8  b  c
  a8  b  \acciaccatura b16 c8    g8  b  c
  c8  b  c    d,8  e  f

  \break
  % ===== B1 =====
  \mark \markup \box "B1"
  e8  c  \acciaccatura d16 c8    c8  g'' f8       % cut on 2nd c of "c c"
  e8. d16 c8  \acciaccatura d16 c8  b  c
  a8  b  \acciaccatura b16 c8    g8  b  c
  c8  b  c    g8  f  e

  \break
  % ===== B2 =====
  \mark \markup \box "B2"
  f8. e16 f8  d8 g'8 f8
  e8. d16 c8  \acciaccatura d16 c8  b  c
  a8  b  \acciaccatura b16 c8    g8  b  c
  c8  b  c    d,8  e  f

  \break
  % ===== C =====
  \mark \markup \box "C"
  % m17
  e8  c  \acciaccatura d16 c8    c4  d8           % cut only on the repeated c
  % m18
  e4  c8  f4 d8                                     % (no added grace; matches plain)
  % m19  (fixed: b is EIGHTH, slide into c as grace)
  e4  g8   a8  b8 \acciaccatura b16 c8
  % m20  (starts on g4, like plain staff)
  g4  e8  f4 d8
  % m21
  e4  c8  d8  c  bf

  \break
  % ===== C (cont.) =====
  % m22  (fixed: removed extra grace cluster)
  e4  c8  f4 d8
  % m23
  e4  g8   a8  b8 \acciaccatura b16 c8
  % m24
g8  c  \tuplet 3/2 { c16 c c }  d8  d8  f8         % bowed triplet on repeated c
  % m25
  e8  c  \acciaccatura d16 c8     c8 g  f         % cut between first two c's only

  \break
  % ===== C’ =====
  \mark \markup \box "C’"
  % m26
  e4  c8  f4 d8
  % m27
  e4  g8  a8 b c
  % m28
  g4  e8  f4 d8
  % m29
  e4  c8  d8 c bf

  \break
  % m30
  e4  c8  f4 d8
  % m31
  e4  g8  a8 b c
  % m32
g8  c  \tuplet 3/2 { c16 c c }  d8  d8  f8




  % m33
  e8  c  \acciaccatura d16 c8     c8 g' f
}

% =========================
% PLAIN MELODY (bottom) — EXACT COPY OF YOUR ORIGINAL
% =========================
melodyPlain = \relative c''' {
  \global

  % ===== A1 =====
  \mark \markup \box "A1"
  r4.         r8  g8 f8
  e8. d16 c8  c8  b  c
  a8  b  c    g8  b  c
  c8  b  c    g8  f  e

  \break
  % ===== A2 =====
  \mark \markup \box "A2"
  f8. e16 f8  d8 g'8 f8
  e8. d16 c8  c8  b  c
  a8  b  c    g8  b  c
  c8  b  c    d,8  e  f

  \break
  % ===== B1 =====
  \mark \markup \box "B1"
  e8  c  c    c8  g'' f8
  e8. d16 c8  c8  b  c
  a8  b  c    g8  b  c
  c8  b  c    g8  f  e

  \break
  % ===== B2 =====
  \mark \markup \box "B2"
  f8. e16 f8  d8 g'8 f8
  e8. d16 c8  c8  b  c
  a8  b  c    g8  b  c
  c8  b  c    d,8  e  f

  \break
  % ===== C =====
  \mark \markup \box "C"
  e8  c  c    c4  d8
  e4  c8 f4 d8
  e4 g8   a8 b c
  g4 e8 f4 d8 
  e4 c8 d8 c bf

  \break
  e4  c8 f4 d8
  e4 g8   a8 b c
  g8 c c   d e f 
  e8 c c   c8 g f

  \break
  % ===== C’ =====
  \mark \markup \box "C’"
  e4  c8 f4 d8    
  e4  g8   a8 b c
  g4 e8 f4 d8 
  e4 c8 d8 c bf

  \break  
  e4  c8 f4 d8
  e4 g8   a8 b c
  g8 c c   d e f 
  e8 c c   c8 g' f
}

\score {
   \new StaffGroup
   <<
      \new Staff = "ornamented" { \melodyOrn }
      \new Staff = "plain"      { \melodyPlain }
   >>
  \layout { }
  \midi { }
}
