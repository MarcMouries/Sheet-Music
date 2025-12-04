% ****************************************************************
% Canon in D
% ****************************************************************

version "2.10.10"

\header {
  title = "Canon in D"
  subtitle = "Subtitle"
  composer = "J. Pachelbel"
  instrument = "Violin I"
  % copyright = "Copyright"
}

global= {
    \time 4/4
    \key c \major
  }
	 
	 
violinOne = \new Voice { \relative c''{
    \set Staff.instrument = "Violin 1 "     
    r1 | r1 
	\bar "|." }}
	 
violinTwo = \new Voice { \relative c''{
    \set Staff.instrument = "Violin 2 "     
    r1 | r1
    \bar "|." }}
	 
\score {
        \new StaffGroup <<
           \new Staff << \global \violinOne >>
           \new Staff << \global \violinTwo >>
        %   \new Staff << \global \viola >>
        %   \new Staff << \global \cello >>
        >>
        \layout { }
        % \midi { \tempo 4=60}
     }
	