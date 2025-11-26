\version "2.24.4"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\header {
  title = "Chosen Kalle Mazel Tov"
  composer = "Traditional"
  subtitle = "Traditional Yiddish/Klezmer"
  style = "klezmer"
}

global = { \time 4/4 \key g \minor }

melody = \relative c' {
  \global
  
  \partial 4.   d8 g bf
  \repeat volta 2   {
  | d4 d
  cs4 d4
  bf8 a g4~
  g8 d g bf
  
  | d4 d
  cs4 d4
  \break
  
  e!8 f d4~
  d8 d e! fs
  g4 d4
  
  cs4 d4
  bf8 a g4
  \break
  r8 g a bf
  cs4. a8
  d16( c bf8) bf16( a) g8 
  g2
  }
  \alternative {
    { r2 }
    { r4 r4 }
  }
}

chordNames = \chordmode {
  \skip 4.
  g2:m  g2:m | d2:m  d2:7 |
  g2:m  g2:m | d2:m  d2:7 |
  g2:m  a2:7 | g2:m  g2:m | 
  a2:7  d2:7 | g2:m
}

words = \lyricmode {
  ai ai ai Cho -- son ka -- le ma -- zl tov,
  ai ai ai Cho -- son ka -- le ma -- zl tov,
  ai ai ai Cho -- son ka -- le ma -- zl tov,
  winsht al -- le heint a yom __ tov __ iz heint!
}

\book {
  \bookOutputName "Chosen_Kalle_Mazel_Tov"

  % --- Original in G minor ---
  \score {
    <<
      \new ChordNames \chordNames
      \new Staff { \melody }
      \addlyrics { \words }
    >>
    \layout { }
    \midi { \tempo 4 = 120 }
  }

% --- SPACE ---
\markup \vspace #1 %


  \markup \bold  "A minor"
  \score {
    <<
      \new ChordNames { \transpose g a { \chordNames } }
      \new Staff { \transpose g a { \melody } }
      \addlyrics { \words }
    >>
    \layout { }
    \midi { \tempo 4 = 120 }
  }



  % --- Transposed part in D minor ---
  \markup \bold "D minor"

  \score {
    <<
      \new ChordNames { \transpose g d { \chordNames } }
      \new Staff      { \transpose g d { \melody } }
      \addlyrics      { \words }
    >>
    \layout { }
    \midi { \tempo 4 = 120 }
  }
  
  
    % --- Transposed part in E minor ---
  \markup \bold  "E minor"
  \score {
    <<
      \new ChordNames { \transpose g e { \chordNames } }
      \new Staff      { \transpose g e { \melody } }
      \addlyrics      { \words }
    >>
    \layout { }
    \midi { \tempo 4 = 120 }
  }



}
  


