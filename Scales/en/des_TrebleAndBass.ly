
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
<<
  \new Staff {
    \clef treble
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c des 
    \relative c' {
      \CMajorScale
    }
  }

  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \transpose c des 
    \relative c {
      \CMajorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

desNaturalMinor = {
<<
  \new Staff {
    \clef treble
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c des 
    \relative c' {
      \CNaturalMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key des \minor
    \myStaffAndTimeSettings
    \transpose c des 
    \relative c {
      \CNaturalMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

desHarmonicMinor = {
<<
  \new Staff {
    \clef treble
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c des 
    \relative c' {
      \CHarmonicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key des \minor
    \myStaffAndTimeSettings
    \transpose c des 
    \relative c {
      \CHarmonicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

desMelodicMinor = {
<<
  \new Staff {
    \clef treble
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c des 
    \relative c' {
      \CMelodicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key des \minor
    \myStaffAndTimeSettings
    \transpose c des 
    \relative c {
      \CMelodicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

desDorianMinor = {
<<
  \new Staff {
    \clef treble
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c des 
    \relative c' {
      \CDorianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key des \minor
    \myStaffAndTimeSettings
    \transpose c des 
    \relative c {
      \CDorianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

desPhrygianMinor = {
<<
  \new Staff {
    \clef treble
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c des 
    \relative c' {
      \CPhrygianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key des \minor
    \myStaffAndTimeSettings
    \transpose c des 
    \relative c {
      \CPhrygianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

desBlues = {
<<
  \new Staff {
    \clef treble
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c des 
    \relative c' {
      \CBluesScale
    }
  }

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
>>
}


% -------------------------------------------------------------------------

desGypsyMinor = {
<<
  \new Staff {
    \clef treble
    \key des \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c des 
    \relative c' {
      \CGypsyScale
    }
  }

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
>>
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


desIonian = {
<<
  \new Staff {
    \clef treble
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c des 
    \relative c' {
      \CIonianScale
    }
  }

  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \transpose c des 
    \relative c {
      \CIonianScale
    }
  }
>>
}


desDorian = {
<<
  \new Staff {
    \clef treble
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d des 
    \relative c' {
      \DDorianScale
    }
  }

  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \transpose d des 
    \relative c {
      \DDorianScale
    }
  }
>>
}


desPhrygian = {
<<
  \new Staff {
    \clef treble
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e des 
    \relative c' {
      \EPhrygianScale
    }
  }

  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \transpose e des 
    \relative c {
      \EPhrygianScale
    }
  }
>>
}


desLydian = {
<<
  \new Staff {
    \clef treble
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f des 
    \relative c' {
      \FLydianScale
    }
  }

  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \transpose f des 
    \relative c {
      \FLydianScale
    }
  }
>>
}


desMixolydian = {
<<
  \new Staff {
    \clef treble
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, des 
    \relative c' {
      \GMixolydianScale
    }
  }

  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \transpose g, des 
    \relative c {
      \GMixolydianScale
    }
  }
>>
}


desEolian = {
<<
  \new Staff {
    \clef treble
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, des 
    \relative c' {
      \AEolianScale
    }
  }

  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \transpose a, des 
    \relative c {
      \AEolianScale
    }
  }
>>
}


desLocrian = {
<<
  \new Staff {
    \clef treble
    \key des \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, des 
    \relative c' {
      \BLocrianScale
    }
  }

  \new Staff {
    \clef bass
    \key des \major
    \myStaffAndTimeSettings
    \transpose b, des 
    \relative c {
      \BLocrianScale
    }
  }
>>
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Ré bémol"
  subtitle = " "
}


% -------------------------------------------------------------------------

\score {
  \desMajor
}

\score {
  \desNaturalMinor
}

\score {
  \desHarmonicMinor
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

\markup \vspace #0.5

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #0.5


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


\markup \vspace #1
\markup {J. Menu - Crissier, le 18/08/2013}
