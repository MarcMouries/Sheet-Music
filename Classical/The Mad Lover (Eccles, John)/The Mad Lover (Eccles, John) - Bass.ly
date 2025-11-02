\version "2.24.4"
\language "english"

\header {
  title = "The Mad Lover"
  subtitle = "5. Aire (Bass)"
  composer = "John Eccles (1668–1735)"
  tagline = ""
}

global = {
  \time 3/4
  \key e \minor
}

bass = \relative e {
  %\clef bass
  \global

  % Bars 1–8
  e'2. | 
  \repeat volta 2{
  d2. | c2. | b2. | e2 e'4 | d2. | c2. | b2. |
  \break % Bars 9–12
  e,2 e'4 | d2. | c2. | b2. |
  \break % Bars 13–16
  e,2 e'4 | d2. | c2. | b2. |
  \break % Bars 17–20
  e,2 e4 | fs2 fs4 | g2 g4 | a4 b4 b,|
  \break % Bars 21–24
  e2 e4 | fs2 fs4 | g2 g4 |  a4 b4 b,|
  \break % Bars 25–28
  e2 e'4 | d2 d4 | c2 c4 |  b2 b4 |
  \break % Bars 29–32
  e,2 e'4 | d2 d4 | c2 c4 | b2 b4 
  \break % Bars 33–36
  | e,2 e4 | fs2 fs4 | gs2 gs4 | a4 b4 b,
  \break % Bars 37–40 plus the first ending and the second ending
  | e2  e4 | fs2 fs4 | gs2 gs4 | a4 b4 b,
  }
  \alternative {
    { e2 e'4 }           % first ending
    { e2. \bar "|." }    % second ending
  }
}

\score {
  \new Staff \bass
  \layout { }
  \midi { \tempo 4 = 100 }
}
