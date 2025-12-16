\version "2.24.0"
\language "english"
%\paper{ ragged-right=##t }
#(set-global-staff-size 20)

\header {
  title    = "Eine Kleine Nachtmusik"
  subsubtitle = "Serenade No. 13 for strings in G major, K 525"
  composer = "W. A. Mozart"
  country = "Austria"
  arranger = \markup { \fontsize #-2.5 "arr. Marc Mouriès"}

\include "../../common/common-header.ily"
}

\layout { indent = 10 \mm}

\score {
  \relative g'' {
    \time 4/4
    \key g \major
    \tempo "Alegro"
    \set Staff.midiInstrument = "violin"
    %<d b' g'>4 
    g
    r8 d8 g4 r8 d8
    | g8 d8 g8 b8 d4 r4
    | c4-\downbow r8 a8 c4 r8 a8
    | c8 a8 fs8 a8 d,4 r4
    %\break
    %<d b' g'>4 
    g8 r8 g4. b8(  a8) g8
    
    \break
    | g8( fs8) fs4 (fs8) a8 c8 fs,8
    |  a8 g8 g4 (g8) b8 a8 g8
    | g8 fs8 fs4 (fs8) a8 c8 fs,8
    \break
    | g8 g8 g16 fs e fs g8-. g8-. b16 a g a
    | b8-. b8-. d16 c b c d4 r4
    \bar "||"
  }

  \midi { }
  \layout {
    \context {
      \Score
      \override SeparationItem.padding = #0.99
    }
  }
}