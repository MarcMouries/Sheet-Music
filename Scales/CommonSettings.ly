\version "2.17.19"  % necessary for upgrading to future LilyPond versions.


% -------------------------------------------------------------------------

\include "../BasicScales.ly"


% -------------------------------------------------------------------------

\paper {
	ragged-right= ##t
	ragged-bottom=##f
	ragged-last-bottom=##t
}


% -------------------------------------------------------------------------

myTempoMark = #(define-music-function (parser location padding marktext)
	(number? string?)
	#{
	\once \override Score . RehearsalMark #'padding = $padding
	\once \override Score . RehearsalMark #'self-alignment-X = #left

	\once\override TextScript #'self-alignment-X = #LEFT
	\mark \markup { \bold $marktext }
	#})


% -------------------------------------------------------------------------

myStaffAndTimeSettings = {
	%	Hide time signature
	\override Staff.TimeSignature #'stencil = ##f
	
	%	Remove naturals before sharps or flats, that are obsolete
	\set Staff.extraNatural = ##f
	
	% Display 8 fourths per bar, i.e. a full scale for most of the modes
	\time 8/4
}
