\version "2.24.0"
\language "english"

\header{
  title = "Scheherazade – Mvt. 2: The Kalendar Prince"
  composer = "Nikolai Rimsky-Korsakov"
    style = "classical"
  tagline = ##f
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A) Solo Violin Recitative
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
recitViolin = \relative c''' {
  \key d \major
  \time 12/8
  \tempo "Lento (recit.)" 4.=52
  \mark \markup \box "A — Solo Recitative"

  b2.~ b8
  \tuplet 3/2 { a16 b a }
  \tuplet 3/2 { g16 a g }
  \tuplet 3/2 { fs16 g fs }
  \tuplet 3/2 { e16 g b }
  \tuplet 3/2 { d16 cs b }
  
   b4.~ b8
    \tuplet 3/2 { a16 b a }
  \tuplet 3/2 { g16 a g }
  \tuplet 3/2 { fs16 g fs }
  \tuplet 3/2 { e16 g b }
  \tuplet 3/2 { d16 cs b }
  
   b4.~ b8

  \bar "||"
}


\score {
  \new Staff { \recitViolin }
  \layout {}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% B) Kalendar Prince theme (for violin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
kalendarThemeVln = \relative c'' {
  \key d \major
  \time 3/8
  \tempo "Andantino" 4.=60
  \mark \markup \box "B — Kalendar Prince Theme"

  | r8 fs16 e16 fs8              
  | e16 d e8 d16 cs 
  | d8 b8 d16 cs 
  | d8 cs16 e d cs 
  | b4.

  \bar "|."
}

\score {
  \new Staff { \kalendarThemeVln }
  \layout {}
}


