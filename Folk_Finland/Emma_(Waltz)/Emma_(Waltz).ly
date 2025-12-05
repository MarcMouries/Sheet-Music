\version "2.24.4"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

% This file is the PREVIEW WRAPPER for editing
% MASTER FILE for music content: Emma_(Waltz)_music.ily
% Edit the .ily file to change the melody

\include "Emma_(Waltz)_music.ily"

\header {
  title    = "Emma's Waltz"
  composer = "Traditional Finnish"
  country = "Finland"
  style = "waltz"
}

\include "../../common/common-header.ily"

\score {  \new Staff { \emmaMelody } }


  \markup {
    \vspace #1
    \fill-line { \fontsize #3 \bold "in E" }
  }
\score {  \new Staff { \transpose d e \emmaMelody } }