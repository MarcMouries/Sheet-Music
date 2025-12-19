
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


disMajor = {
  \new Staff {
    \clef bass
    \key dis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c dis 
    \relative c {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

disNaturalMinor = {
  \new Staff {
    \clef bass
    \key dis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c dis 
    \relative c {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

disHarmonicMinor = {
  \new Staff {
    \clef bass
      \key dis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c dis 
    \relative c {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

disMelodicMinor = {
  \new Staff {
    \clef bass
    \key dis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c dis 
    \relative c {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

disDorianMinor = {
  \new Staff {
    \clef bass
    \key dis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c dis 
    \relative c {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

disPhrygianMinor = {
  \new Staff {
    \clef bass
    \key dis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c dis 
    \relative c {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

disBlues = {
  \new Staff {
    \clef bass
    \key dis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c dis 
    \relative c {
      \CBluesScale
    }
  }
}


% -------------------------------------------------------------------------

disGypsyMinor = {
  \new Staff {
    \clef bass
    \key dis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c dis 
    \relative c {
      \CGypsyScale
    }
  }
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


disIonian = {
  \new Staff {
    \clef bass
    \key dis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c dis 
    \relative c {
      \CIonianScale
    }
  }
}


disDorian = {
  \new Staff {
    \clef bass
    \key dis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d dis 
    \relative c {
      \DDorianScale
    }
  }
}


disPhrygian = {
  \new Staff {
    \clef bass
    \key dis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e dis 
    \relative c {
      \EPhrygianScale
    }
  }
}


disLydian = {
  \new Staff {
    \clef bass
    \key dis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f dis 
    \relative c {
      \FLydianScale
    }
  }
}


disMixolydian = {
  \new Staff {
    \clef bass
    \key dis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, dis 
    \relative c {
      \GMixolydianScale
    }
  }
}


disEolian = {
  \new Staff {
    \clef bass
    \key dis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, dis 
    \relative c {
      \AEolianScale
    }
  }
}


disLocrian = {
  \new Staff {
    \clef bass
    \key dis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, dis 
    \relative c {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Ré dièse"
  subtitle = " "
  composer = "Marc Mouries"
  genre = "Exercise"
}


% -------------------------------------------------------------------------

\score {
  \disMajor
}

\score {
  \disNaturalMinor
}

\score {
  \disMelodicMinor
}

\score {
  \disMelodicMinor
}

\score {
  \disBlues
}

\score {
  \disGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


% -------------------------------------------------------------------------

\score {
  \disIonian
}

\score {
  \disDorian
}

\score {
  \disPhrygian
}

\score {
  \disLydian
}

\score {
  \disMixolydian
}

\score {
  \disEolian
}

\score {
  \disLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
