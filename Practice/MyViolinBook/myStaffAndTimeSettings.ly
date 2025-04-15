
myStaffAndTimeSettings = {
	%	Hide time signature
	\override Staff.TimeSignature #'stencil = ##f

	%	Remove naturals before sharps or flats, that are obsolete
	\set Staff.extraNatural = ##f

	% Display 8 fourths per bar, i.e. a full scale for most of the modes
	\time 14/4
}