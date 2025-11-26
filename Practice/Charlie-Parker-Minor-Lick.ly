\version "2.24.4"
\language "english"

\header {
  title = "Charlie Parker Minor Lick"
  subtitle = "Around the Circle of Fourths"
  subsubtitle = " "
  composer = "Marc Mouries"
  style = "practice exercise"
}

\layout { indent = 0}
%#(set-global-staff-size 18)
 
\paper {
   fonts = #(make-pango-font-tree   "Copperplate"   "sans-serif"  "monospace" (/ (* staff-height pt) 2.5))
   #(set-paper-size "a6")
}


  

chordNames = \chordmode {
  d1:m7    g1:m7    c1:m7    f1:m7
  bf1:m7   ef1:m7   af1:m7   cs1:m7
  fs1:m7   b1:m7    e1:m7    a1:m7
  
%   e1:m7    a1:m7    d1:m7    g1:m7 g1:m7
%   c1:m7    f1:m7    bf1:m7   ef1:m7   
}

melody = \relative c' {
  % Pattern for each key: 3–5–1–3–2–1–♭7–5 (natural minor)
% PART 1
  % Dm7: d e f g a bf c d
  f8  a  d  f   e  d  c  a |
  % Gm7: g a bf c d ef f g
  bf8 d  g  bf  a  g  f  d |
  % Cm7: c d ef f g af bf c
  ef,8 g  c  ef  d  c  bf g |
  % Fm7: f g af bf c df ef f
  af,8 c  f  af  g  f  ef c |
  % Bbm7: bf c df ef f gf af bf
  df8 f  bf df  c  bf af f |
  % Ebm7: ef f gf af bf cf df ef
  gf8 bf ef gf  f  ef df bf |
  % Abm7: af bf cf df ef ff gf af
  cf,8 ef af cf  bf af gf ef! |
  % C#m7 (enharm. Dbm): cs ds e fs gs a b cs
  e8  gs cs e   ds cs b  gs |
  % F#m7: fs gs a b cs d e fs
  a,8  cs fs a   gs fs e  cs |
  % Bm7: b cs d e fs g a b
  d8  fs b  d   cs b  a  fs |
  % Em7: e fs g a b c d e
  g8  b  e  g   fs e  d  b |
  % Am7: a b c d e f g a
  c,8  e  a  c   b  a  g  e |
  
  % PART 2
  % \break
%     % Em7: e fs g a b c d e
%   g,8  b  e  g   fs e  d  b |
%   % Am7: a b c d e f g a
%   c8  e  a  c   b  a  g  e |
%  % Dm7: d e f g a bf c d
%   f8  a  d  f   e  d  c  a |
%   % Gm7: g a bf c d ef f g
%   bf8 d  g  bf  a  g  f  d  f bf d,   bf  a  g  f  d
%   \break
%   % Cm7: c d ef f g af bf c
%   ef8 g  c  ef  d  c  bf g |
%    % Fm7: f g af bf c df ef f
%   af8 c  f  af  g  f  ef c |
  
}


\score {
  <<
    \new ChordNames { \chordNames }
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
