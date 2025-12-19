
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


gisMajor = {
<<
  \new Staff {
    \clef treble
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c gis 
    \relative c' {
      \CMajorScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \transpose c gis 
    \relative c, {
      \CMajorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gisNaturalMinor = {
<<
  \new Staff {
    \clef treble
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c gis 
    \relative c' {
      \CNaturalMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \minor
    \myStaffAndTimeSettings
    \transpose c gis 
    \relative c, {
      \CNaturalMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gisHarmonicMinor = {
<<
  \new Staff {
    \clef treble
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c gis 
    \relative c' {
      \CHarmonicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \minor
    \myStaffAndTimeSettings
    \transpose c gis 
    \relative c, {
      \CHarmonicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gisMelodicMinor = {
<<
  \new Staff {
    \clef treble
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c gis 
    \relative c' {
      \CMelodicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \minor
    \myStaffAndTimeSettings
    \transpose c gis 
    \relative c, {
      \CMelodicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gisDorianMinor = {
<<
  \new Staff {
    \clef treble
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c gis 
    \relative c' {
      \CDorianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \minor
    \myStaffAndTimeSettings
    \transpose c gis 
    \relative c, {
      \CDorianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gisPhrygianMinor = {
<<
  \new Staff {
    \clef treble
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c gis 
    \relative c' {
      \CPhrygianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \minor
    \myStaffAndTimeSettings
    \transpose c gis 
    \relative c, {
      \CPhrygianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gisBlues = {
<<
  \new Staff {
    \clef treble
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c gis 
    \relative c' {
      \CBluesScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c gis 
    \relative c, {
      \CBluesScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gisGypsyMinor = {
<<
  \new Staff {
    \clef treble
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c gis 
    \relative c' {
      \CGypsyScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c gis 
    \relative c, {
      \CGypsyScale
    }
  }
>>
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


gisIonian = {
<<
  \new Staff {
    \clef treble
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c gis 
    \relative c' {
      \CIonianScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \transpose c gis 
    \relative c, {
      \CIonianScale
    }
  }
>>
}


gisDorian = {
<<
  \new Staff {
    \clef treble
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d gis 
    \relative c' {
      \DDorianScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \transpose d gis 
    \relative c, {
      \DDorianScale
    }
  }
>>
}


gisPhrygian = {
<<
  \new Staff {
    \clef treble
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e gis 
    \relative c' {
      \EPhrygianScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \transpose e gis 
    \relative c, {
      \EPhrygianScale
    }
  }
>>
}


gisLydian = {
<<
  \new Staff {
    \clef treble
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f gis 
    \relative c' {
      \FLydianScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \transpose f gis 
    \relative c, {
      \FLydianScale
    }
  }
>>
}


gisMixolydian = {
<<
  \new Staff {
    \clef treble
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, gis 
    \relative c' {
      \GMixolydianScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \transpose g, gis 
    \relative c, {
      \GMixolydianScale
    }
  }
>>
}


gisEolian = {
<<
  \new Staff {
    \clef treble
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, gis 
    \relative c' {
      \AEolianScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \transpose a, gis 
    \relative c, {
      \AEolianScale
    }
  }
>>
}


gisLocrian = {
<<
  \new Staff {
    \clef treble
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, gis 
    \relative c' {
      \BLocrianScale
    }
  }

  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \transpose b, gis 
    \relative c, {
      \BLocrianScale
    }
  }
>>
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Sol dièse"
  subtitle = " "
  composer = "Marc Mouries"
  genre = "Exercise"
}


% -------------------------------------------------------------------------

\score {
  \gisMajor
}

\score {
  \gisNaturalMinor
}

\score {
  \gisHarmonicMinor
}

\score {
  \gisMelodicMinor
}

\score {
  \gisBlues
}

\score {
  \gisGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #0.5

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #0.5


% -------------------------------------------------------------------------

\score {
  \gisIonian
}

\score {
  \gisDorian
}

\score {
  \gisPhrygian
}

\score {
  \gisLydian
}

\score {
  \gisMixolydian
}

\score {
  \gisEolian
}

\score {
  \gisLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #1
\markup {J. Menu - Crissier, le 18/08/2013}
