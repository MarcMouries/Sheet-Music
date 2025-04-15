
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


cesMajor = {
  \new Staff {
    \clef bass
    \key ces \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c ces 
    \relative c {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

cesNaturalMinor = {
  \new Staff {
    \clef bass
    \key ces \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c ces 
    \relative c {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

cesHarmonicMinor = {
  \new Staff {
    \clef bass
      \key ces \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c ces 
    \relative c {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

cesMelodicMinor = {
  \new Staff {
    \clef bass
    \key ces \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c ces 
    \relative c {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

cesDorianMinor = {
  \new Staff {
    \clef bass
    \key ces \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c ces 
    \relative c {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

cesPhrygianMinor = {
  \new Staff {
    \clef bass
    \key ces \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c ces 
    \relative c {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

cesBlues = {
  \new Staff {
    \clef bass
    \key ces \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c ces 
    \relative c {
      \CBluesScale
    }
  }
}


% -------------------------------------------------------------------------

cesGypsyMinor = {
  \new Staff {
    \clef bass
    \key ces \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c ces 
    \relative c {
      \CGypsyScale
    }
  }
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


cesIonian = {
  \new Staff {
    \clef bass
    \key ces \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c ces 
    \relative c {
      \CIonianScale
    }
  }
}


cesDorian = {
  \new Staff {
    \clef bass
    \key ces \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d ces 
    \relative c {
      \DDorianScale
    }
  }
}


cesPhrygian = {
  \new Staff {
    \clef bass
    \key ces \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e ces 
    \relative c {
      \EPhrygianScale
    }
  }
}


cesLydian = {
  \new Staff {
    \clef bass
    \key ces \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f ces 
    \relative c {
      \FLydianScale
    }
  }
}


cesMixolydian = {
  \new Staff {
    \clef bass
    \key ces \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, ces 
    \relative c {
      \GMixolydianScale
    }
  }
}


cesEolian = {
  \new Staff {
    \clef bass
    \key ces \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, ces 
    \relative c {
      \AEolianScale
    }
  }
}


cesLocrian = {
  \new Staff {
    \clef bass
    \key ces \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, ces 
    \relative c {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Do bémol"
  subtitle = " "
}


% -------------------------------------------------------------------------

\score {
  \cesMajor
}

\score {
  \cesNaturalMinor
}

\score {
  \cesMelodicMinor
}

\score {
  \cesMelodicMinor
}

\score {
  \cesBlues
}

\score {
  \cesGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


% -------------------------------------------------------------------------

\score {
  \cesIonian
}

\score {
  \cesDorian
}

\score {
  \cesPhrygian
}

\score {
  \cesLydian
}

\score {
  \cesMixolydian
}

\score {
  \cesEolian
}

\score {
  \cesLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
