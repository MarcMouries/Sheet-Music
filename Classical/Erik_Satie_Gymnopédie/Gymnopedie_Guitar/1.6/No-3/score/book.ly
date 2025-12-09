\version "2.18.2"

global = {
	\key a \minor
	\clef "G_8"
	\time 3/4 
	\set Staff.connectArpeggios = ##t
}

%\include "score/spacing.ly"
\include "No-3/score/dynamicsa.ly"
\include "No-3/score/dynamicsb.ly"
\include "No-3/score/dynamicsc.ly"
\include "No-3/score/guitar1.ly"
\include "No-3/score/guitar2.ly"
\include "No-3/score/guitar3.ly"
\include "No-3/score/guitar4.ly"

\bookpart {
 \paper {
	page-count = #4
%	systems-per-page = #3
	system-count = #11

	top-margin = 18 \mm
	bottom-margin = 8 \mm
	left-margin = 18 \mm
	right-margin = 18 \mm

	top-system-spacing =
                #'((basic-distance . 6)
                   (minimum-distance . 4)
                   (padding . 0))
%                   (stretchability . 4))

	system-system-spacing =
	    #'((basic-distance . 20)
	       (minimum-distance . 12)
	       (padding . 4)
	       (stretchability . 4))

	ragged-last-bottom = ##f
	ragged-bottom = ##f
}

\header {
  dedication = \markup \center-column {
        \fontsize #0.7
        \italic
        "à Charles Levadé "
        }

\include "../../../../../../common/common-header.ily"

  title = \markup \center-column {
		\null
		\italic
		\bold
		\fontsize #6.0
		"Gymnopédie"
		\null
	}

  subtitle = \markup \center-column {
		\fontsize #5.0
		"No 3"
	}

  composer = \markup \center-column {
		\fontsize #1.2
		{
		\null
		"Éric Satie (1866 - 1925)"
		}
	}

  arranger = \markup \center-column {
	 	\fontsize #1.2
		{
		\null
		"    Claude Debussy (1862 - 1918)"
		"                    Steve Shorter (2021)"
		\null
		\null
		}
	}

%  poet = " "
%
%  piece = "v1.2"
%  piece = " "
%  genre = "Classical"
 %copyright = \markup  \fill-line { \tiny { \line { Steve Shorter (2021). \epsfile #0 #10 #'"by-sa.eps" }}}
 }

 \tocItem \markup \column { "Gymnopédie No-3" " " }

 \score {
    \new GrandStaff \with {
            \override StaffGrouper #'staff-staff-spacing =
                #'((basic-distance . 10)
                   (minimum-distance . 6)
                   (padding . 2))
    }
    <<
	\set GrandStaff.instrumentName =
		\markup {
			\override #'(font-family . "Sans")
			\abs-fontsize #14.0 \bold "Guitar  " 
		}

	\new Staff \with { \consists "Span_arpeggio_engraver" }
                   << \global \guitarone >>
	\new Dynamics \dynamicsa
	\new Staff \with { \consists "Span_arpeggio_engraver" }
                   << \global \guitartwo >>
	\new Dynamics \dynamicsb
	\new Staff \with { \consists "Span_arpeggio_engraver" }
                   << \global \guitarthree >>
	\new Dynamics \dynamicsc
	\new Staff \with { \consists "Span_arpeggio_engraver" }
                   << \global \guitarfour >>
    >>

    \layout { #(layout-set-staff-size 19)  }
    }
}
