
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


aisMajor = {
  \new Staff {
    \clef bass
    \key ais \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c ais 
    \relative c, {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

aisNaturalMinor = {
  \new Staff {
    \clef bass
    \key ais \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c ais 
    \relative c, {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

aisHarmonicMinor = {
  \new Staff {
    \clef bass
      \key ais \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c ais 
    \relative c, {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

aisMelodicMinor = {
  \new Staff {
    \clef bass
    \key ais \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c ais 
    \relative c, {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

aisDorianMinor = {
  \new Staff {
    \clef bass
    \key ais \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c ais 
    \relative c, {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

aisPhrygianMinor = {
  \new Staff {
    \clef bass
    \key ais \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c ais 
    \relative c, {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

aisBlues = {
  \new Staff {
    \clef bass
    \key ais \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c ais 
    \relative c, {
      \CBluesScale
    }
  }
}


% -------------------------------------------------------------------------

aisGypsyMinor = {
  \new Staff {
    \clef bass
    \key ais \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c ais 
    \relative c, {
      \CGypsyScale
    }
  }
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


aisIonian = {
  \new Staff {
    \clef bass
    \key ais \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c ais 
    \relative c, {
      \CIonianScale
    }
  }
}


aisDorian = {
  \new Staff {
    \clef bass
    \key ais \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d ais 
    \relative c, {
      \DDorianScale
    }
  }
}


aisPhrygian = {
  \new Staff {
    \clef bass
    \key ais \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e ais 
    \relative c, {
      \EPhrygianScale
    }
  }
}


aisLydian = {
  \new Staff {
    \clef bass
    \key ais \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f ais 
    \relative c, {
      \FLydianScale
    }
  }
}


aisMixolydian = {
  \new Staff {
    \clef bass
    \key ais \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, ais 
    \relative c, {
      \GMixolydianScale
    }
  }
}


aisEolian = {
  \new Staff {
    \clef bass
    \key ais \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, ais 
    \relative c, {
      \AEolianScale
    }
  }
}


aisLocrian = {
  \new Staff {
    \clef bass
    \key ais \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, ais 
    \relative c, {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de La dièse"
  subtitle = " "
  composer = "Marc Mouries"
  style = "practice exercise"
}


% -------------------------------------------------------------------------

\score {
  \aisMajor
}

\score {
  \aisNaturalMinor
}

\score {
  \aisMelodicMinor
}

\score {
  \aisMelodicMinor
}

\score {
  \aisBlues
}

\score {
  \aisGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


% -------------------------------------------------------------------------

\score {
  \aisIonian
}

\score {
  \aisDorian
}

\score {
  \aisPhrygian
}

\score {
  \aisLydian
}

\score {
  \aisMixolydian
}

\score {
  \aisEolian
}

\score {
  \aisLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
