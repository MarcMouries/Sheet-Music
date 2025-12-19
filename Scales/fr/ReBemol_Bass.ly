
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


desMajor = {
  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c des 
    \relative c {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

desNaturalMinor = {
  \new Staff {
    \clef bass
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c des 
    \relative c {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

desHarmonicMinor = {
  \new Staff {
    \clef bass
      \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c des 
    \relative c {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

desMelodicMinor = {
  \new Staff {
    \clef bass
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c des 
    \relative c {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

desDorianMinor = {
  \new Staff {
    \clef bass
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c des 
    \relative c {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

desPhrygianMinor = {
  \new Staff {
    \clef bass
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c des 
    \relative c {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

desBlues = {
  \new Staff {
    \clef bass
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c des 
    \relative c {
      \CBluesScale
    }
  }
}


% -------------------------------------------------------------------------

desGypsyMinor = {
  \new Staff {
    \clef bass
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c des 
    \relative c {
      \CGypsyScale
    }
  }
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


desIonian = {
  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c des 
    \relative c {
      \CIonianScale
    }
  }
}


desDorian = {
  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d des 
    \relative c {
      \DDorianScale
    }
  }
}


desPhrygian = {
  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e des 
    \relative c {
      \EPhrygianScale
    }
  }
}


desLydian = {
  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f des 
    \relative c {
      \FLydianScale
    }
  }
}


desMixolydian = {
  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, des 
    \relative c {
      \GMixolydianScale
    }
  }
}


desEolian = {
  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, des 
    \relative c {
      \AEolianScale
    }
  }
}


desLocrian = {
  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, des 
    \relative c {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Ré bémol"
  subtitle = " "
  composer = "Marc Mouries"
  genre = "Exercise"
}


% -------------------------------------------------------------------------

\score {
  \desMajor
}

\score {
  \desNaturalMinor
}

\score {
  \desMelodicMinor
}

\score {
  \desMelodicMinor
}

\score {
  \desBlues
}

\score {
  \desGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


% -------------------------------------------------------------------------

\score {
  \desIonian
}

\score {
  \desDorian
}

\score {
  \desPhrygian
}

\score {
  \desLydian
}

\score {
  \desMixolydian
}

\score {
  \desEolian
}

\score {
  \desLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
