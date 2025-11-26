\version "2.24.3"
\language "english"

\header {
  title = "The Mad Lover"
  subtitle = "5. Aire"
  composer = "John Eccles"
  instrument = "Viola"
    style = "classical"
  tagline = ##f
}

viola = \relative c'' {
  %\clef alto
  \key e \minor
  \time 3/4

  % The viola line is an inner-voice ground mostly alternating C and A-flat.
  % Temporary cell (replace with exact measures if you’re entering by hand):
  %   c'2 aes4  = C half + A-flat quarter (3/2 meter)

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
  \break % Bars 9–12
  | b2 b4 
  | b4 a4 fs4 
  | g4. g8 g8[ a8] 
  | b4 fs4 b4 
  \break % Bars 13–16
  | b2 b4 
  | b4 a4 fs4 
  | g4. g8 g8[ a8] 
  | b4 fs4 b4 
  \break % Bars 17-20
  | b2 b4 
  | a2 a4 
  | g4 b4 b4 
  | a4 fs4 b4
  \break % Bars 21–24
  | b2 b4 
  | a2 a4 
  | g4 b4 b4 
  | a4 fs4 b4
  \break % Bars 25–28
  | b4 e,4 g8 e 
  | fs2 fs8 d
  | e2 e4  
  | fs2 ds4
  \break % Bars 29–32
  | e2 g8 e 
  | fs2 fs8 d
  | e2 e4  
  | fs2 b4
  \break % Bars 33–36
  | b2 b4 
  | a2 a4 
  | gs4 b4 b4 
  | a4 fs4 b4
  \break
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

\score {
  \new Staff  { \viola }
}
