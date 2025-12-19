
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
  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c gis 
    \relative c, {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

gisNaturalMinor = {
  \new Staff {
    \clef bass
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c gis 
    \relative c, {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

gisHarmonicMinor = {
  \new Staff {
    \clef bass
      \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c gis 
    \relative c, {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

gisMelodicMinor = {
  \new Staff {
    \clef bass
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c gis 
    \relative c, {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

gisDorianMinor = {
  \new Staff {
    \clef bass
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c gis 
    \relative c, {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

gisPhrygianMinor = {
  \new Staff {
    \clef bass
    \key gis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c gis 
    \relative c, {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

gisBlues = {
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
}


% -------------------------------------------------------------------------

gisGypsyMinor = {
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
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


gisIonian = {
  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c gis 
    \relative c, {
      \CIonianScale
    }
  }
}


gisDorian = {
  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d gis 
    \relative c, {
      \DDorianScale
    }
  }
}


gisPhrygian = {
  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e gis 
    \relative c, {
      \EPhrygianScale
    }
  }
}


gisLydian = {
  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f gis 
    \relative c, {
      \FLydianScale
    }
  }
}


gisMixolydian = {
  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, gis 
    \relative c, {
      \GMixolydianScale
    }
  }
}


gisEolian = {
  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, gis 
    \relative c, {
      \AEolianScale
    }
  }
}


gisLocrian = {
  \new Staff {
    \clef bass
    \key gis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, gis 
    \relative c, {
      \BLocrianScale
    }
  }
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
  \gisMelodicMinor
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

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


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


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
