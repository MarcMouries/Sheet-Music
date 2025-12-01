\version "2.18.2"

global = {
	\key a \minor
	\clef "G_8"
	\time 3/4 
	\set Staff.connectArpeggios = ##t
}

%\include "score/spacing.ly"
\include "No-3/gtr3/guitar3.ly"
\include "No-3/gtr3/dynamicsc.ly"

\bookpart {
 \paper {
	page-count = #2
%	systems-per-page = #3
	system-count = #13

	top-margin = 18 \mm
	bottom-margin = 8 \mm
	left-margin = 18 \mm
	right-margin = 18 \mm

	top-system-spacing =
                #'((basic-distance . 14)
                   (minimum-distance . 10)
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
		\fontsize #4.0
		"Gymnopédie"
		\null
	}

  subtitle = \markup \center-column {
		\fontsize #3.0
		"No 3"
	}

  composer = \markup \center-column {
		\fontsize #1.0
		{
		\null
		"Éric Satie (1866 - 1925)"
		}
	}

  arranger = \markup \center-column {
	 	\fontsize #1.0
		{
		\null
		"    Claude Debussy (1862 - 1918)"
		"                    Steve Shorter (2021)"
		\null
		}
	}

%  poet = " "
%
%  piece = "v1.2"
%  piece = " "
%  style = "Romantic"
% copyright = \markup  \fill-line { \tiny { \line { Steve Shorter (2021). \epsfile #0 #10 #'"by-sa.eps" }}}
 }

 \tocItem \markup \column { "          Guitar 3 " " " }

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
			\abs-fontsize #12.0 \bold "Gtr3 " 
		}

	\new Staff \with { \consists "Span_arpeggio_engraver" }
                   << \global \guitarthree >>
	\new Dynamics \dynamicsc
    >>

    \layout { #(layout-set-staff-size 22)  }
    }
}
