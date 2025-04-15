\include "bars-per-line-engraver.ly"
\include "markups.ly"
words = {}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff {

%%%%%%%%%%%%%%%%%%%%%
      %   bracket-repeats %
%%%%%%%%%%%%%%%%%%%%%
      %  \override Staff.MeasureCounter.font-encoding = #'latin1
      %  \override Staff.MeasureCounter.font-size = 0
      %  \override Staff.MeasureCounter.stencil = #repeat-stencil
      %  \override Staff.MeasureCounter.outside-staff-horizontal-padding = #0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


      \melody
    }
    %\new Staff { \violonDeux }
    \addlyrics { \words }
  >>
  \layout {
    indent = 0
    \context {
      \Score
      %use the line below to insist on your layout
      %\override NonMusicalPaperColumn.line-break-permission = ##f
      \consists #(bars-per-line-engraver '(4))
      %% end 4 bars per line
      % longer glissando
      \override Glissando.minimum-length = #4
      \override Glissando.springs-and-rods =  #ly:spanner::set-spacing-rods
      % longer glissando
    }
    \context {
      \Staff
      \consists #Measure_counter_engraver % Add this line to the LAYOUT STAFF CONTEXT

    }
  }
  \midi {
    \context {
      \Score
      % tempoWholesPerMinute = #(ly:make-moment 104/4)
    }
  }
}