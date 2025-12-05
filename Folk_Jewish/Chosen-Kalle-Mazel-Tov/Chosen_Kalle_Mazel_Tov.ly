\version "2.24.4"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

% This file is the PREVIEW WRAPPER for editing
% MASTER FILE for music content: Chosen_Kalle_Mazel_Tov_music.ily
% Edit the .ily file to change the melody/chords

\include "Chosen_Kalle_Mazel_Tov_music.ily"

\header {
  title = "Chosen Kalle Mazel Tov"
  composer = "Traditional"
  country = "Jewish"
  subtitle = "Traditional Yiddish/Klezmer"
  style = "klezmer"
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
  


