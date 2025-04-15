
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


eesMajor = {
  \new Staff {
    \clef bass
    \key ees \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c ees 
    \relative c {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

eesNaturalMinor = {
  \new Staff {
    \clef bass
    \key ees \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c ees 
    \relative c {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

eesHarmonicMinor = {
  \new Staff {
    \clef bass
      \key ees \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c ees 
    \relative c {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

eesMelodicMinor = {
  \new Staff {
    \clef bass
    \key ees \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c ees 
    \relative c {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

eesDorianMinor = {
  \new Staff {
    \clef bass
    \key ees \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c ees 
    \relative c {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

eesPhrygianMinor = {
  \new Staff {
    \clef bass
    \key ees \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c ees 
    \relative c {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

eesBlues = {
  \new Staff {
    \clef bass
    \key ees \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c ees 
    \relative c {
      \CBluesScale
    }
  }
}


% -------------------------------------------------------------------------

eesGypsyMinor = {
  \new Staff {
    \clef bass
    \key ees \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c ees 
    \relative c {
      \CGypsyScale
    }
  }
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


eesIonian = {
  \new Staff {
    \clef bass
    \key ees \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c ees 
    \relative c {
      \CIonianScale
    }
  }
}


eesDorian = {
  \new Staff {
    \clef bass
    \key ees \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d ees 
    \relative c {
      \DDorianScale
    }
  }
}


eesPhrygian = {
  \new Staff {
    \clef bass
    \key ees \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e ees 
    \relative c {
      \EPhrygianScale
    }
  }
}


eesLydian = {
  \new Staff {
    \clef bass
    \key ees \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f ees 
    \relative c {
      \FLydianScale
    }
  }
}


eesMixolydian = {
  \new Staff {
    \clef bass
    \key ees \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, ees 
    \relative c {
      \GMixolydianScale
    }
  }
}


eesEolian = {
  \new Staff {
    \clef bass
    \key ees \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, ees 
    \relative c {
      \AEolianScale
    }
  }
}


eesLocrian = {
  \new Staff {
    \clef bass
    \key ees \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, ees 
    \relative c {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Mi bémol"
  subtitle = " "
}


% -------------------------------------------------------------------------

\score {
  \eesMajor
}

\score {
  \eesNaturalMinor
}

\score {
  \eesMelodicMinor
}

\score {
  \eesMelodicMinor
}

\score {
  \eesBlues
}

\score {
  \eesGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


% -------------------------------------------------------------------------

\score {
  \eesIonian
}

\score {
  \eesDorian
}

\score {
  \eesPhrygian
}

\score {
  \eesLydian
}

\score {
  \eesMixolydian
}

\score {
  \eesEolian
}

\score {
  \eesLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
