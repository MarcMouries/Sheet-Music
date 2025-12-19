% ****************************************************************
% Canon in D
% ****************************************************************
\version "2.14"
\include "english.ly"

#(set-global-staff-size 22)
\paper {
  #(set-paper-size "letter")
}

\header {
  title = "Canon in D"
  subtitle = "Duet for 2 violins"
  composer = "J. Pachelbel (1653-1706)"
  %instrument = "Violin I"
  % copyright = "Copyright"
  arranger = "Arranged by Marc Mouries"
  tagline = ""
}

global= { \time 4/4 \key d \major }

violinOne = \new Voice { \relative c''{
  \set Staff.instrumentName = "Violin I"
  r1  | r1 | 
  r1  | r1 |
  fs2-3 e  | d cs  | b a  | b cs |
  d-1 cs-2 | b a-4 | g fs | g e  |
  d4 (fs) a-4  (g) | fs (d) fs (e) | 
  d-4 (b) d-0 (a'-4) | g (b) a-4 (g) | 
  fs( d) e( cs')  | d( fs) a( a,) |
  b( g) a( fs) d( d')  d4.\trill cs8
  d1 |
  \bar "|." }}

violinTwo = \new Voice { \relative c''{
  \set Staff.instrumentName = "Violin II"
  d2 a   | b fs | g d  | g a  | 
  d  a   | b fs | g d  | g a  | 
  fs' e  | d cs | b a  | b cs |
  d   cs | b a  | g fs | g e  | 
  d4 (fs) a-4  (g) | fs (d) fs (e) | 
  d-4 (b) d-0 (a'-4) | g (b) a-4 (g) | 
  fs1
\bar "|." }}

viola = \new Voice { \relative c' {
  \set Staff.instrumentName = "Viola "
  \clef alto
  e2 d c1
\bar "|." }}

cello = \new Voice { \relative c' {
  \set Staff.instrumentName = "Cello  "
  \clef bass
  c2 b a1
\bar "|."}}

\score {
   \new StaffGroup <<
      \new Staff << \global \violinOne >>
      \new Staff << \global \violinTwo >>
      % \new Staff << \global \viola >>
      % \new Staff << \global \cello >>
   >>
   \layout {
    \context {
      \Score
      \override SpacingSpanner
                #'base-shortest-duration = #(ly:make-moment 1 16)
    }
  }
   \midi { }
}