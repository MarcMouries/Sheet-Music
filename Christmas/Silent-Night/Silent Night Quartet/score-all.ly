
%{
\include "violin_1_part.ly"
\include "violin_2_part.ly"
\include "viola_part.ly"
\include "cello_part.ly"

\score {
 <<
  \violinGroup
  \violaGroup
  \celloGroup
  \continuoGroup
 >>

%}
%=============================================
%   Created by Marc
%   December 10, 2010
%=============================================

\version "2.14.0"
\include "english.ly"


\header {
  title     = "Silent Night"
  piece     = "moderato"
  opus      =  ""
  source    =  ""
  composer  = "Franz Grüber (1787-1863)"
  arranger  = "arr Marc"
  enteredby = "Marc"
  copyright = "public domain"
}

global= {
  \time 6/8
  \key d \major
}

violinOne = \new Voice \relative c'' {
  \set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  
  
   a8.[  b16]  a8   fs4 r8 
  \bar "|."
}
 
violinTwo = \new Voice \relative c' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"
  
   fs8.[  g16]  fs8   d4 r8 
  \bar "|."
}

viola = \new Voice \relative c' {
  \set Staff.instrumentName = #"Viola "  
	\set Staff.midiInstrument = "viola"
  \clef alto
  
  a2.
  \bar "|."
}

cello = \new Voice \relative c {
  \set Staff.instrumentName = #"Cello "
  \set Staff.midiInstrument = "cello"
  \clef bass
  
  fs2.
  \bar "|."
}

\score {
  \new StaffGroup
  <<
    \new Staff << \global \violinOne >>
    \new Staff << \global \violinTwo >>
    \new Staff << \global \viola >>
    \new Staff << \global \cello >>
  >>
  \layout { }
  \midi { 
    \context { 
      \Score tempoWholesPerMinute = #(ly:make-moment 60 8 ) } }
}