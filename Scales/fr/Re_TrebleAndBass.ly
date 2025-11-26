
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


dMajor = {
<<
  \new Staff {
    \clef treble
    \key d \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c d 
    \relative c' {
      \CMajorScale
    }
  }

  \new Staff {
    \clef bass
    \key d \major
    \myStaffAndTimeSettings
    \transpose c d 
    \relative c {
      \CMajorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

dNaturalMinor = {
<<
  \new Staff {
    \clef treble
    \key d \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c d 
    \relative c' {
      \CNaturalMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key d \minor
    \myStaffAndTimeSettings
    \transpose c d 
    \relative c {
      \CNaturalMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

dHarmonicMinor = {
<<
  \new Staff {
    \clef treble
    \key d \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c d 
    \relative c' {
      \CHarmonicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key d \minor
    \myStaffAndTimeSettings
    \transpose c d 
    \relative c {
      \CHarmonicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

dMelodicMinor = {
<<
  \new Staff {
    \clef treble
    \key d \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c d 
    \relative c' {
      \CMelodicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key d \minor
    \myStaffAndTimeSettings
    \transpose c d 
    \relative c {
      \CMelodicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

dDorianMinor = {
<<
  \new Staff {
    \clef treble
    \key d \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c d 
    \relative c' {
      \CDorianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key d \minor
    \myStaffAndTimeSettings
    \transpose c d 
    \relative c {
      \CDorianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

dPhrygianMinor = {
<<
  \new Staff {
    \clef treble
    \key d \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c d 
    \relative c' {
      \CPhrygianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key d \minor
    \myStaffAndTimeSettings
    \transpose c d 
    \relative c {
      \CPhrygianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

dBlues = {
<<
  \new Staff {
    \clef treble
    \key d \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c d 
    \relative c' {
      \CBluesScale
    }
  }

  \new Staff {
    \clef bass
    \key d \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c d 
    \relative c {
      \CBluesScale
    }
  }
>>
}


% -------------------------------------------------------------------------

dGypsyMinor = {
<<
  \new Staff {
    \clef treble
    \key d \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c d 
    \relative c' {
      \CGypsyScale
    }
  }

  \new Staff {
    \clef bass
    \key d \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c d 
    \relative c {
      \CGypsyScale
    }
  }
>>
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


dIonian = {
<<
  \new Staff {
    \clef treble
    \key d \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c d 
    \relative c' {
      \CIonianScale
    }
  }

  \new Staff {
    \clef bass
    \key d \major
    \myStaffAndTimeSettings
    \transpose c d 
    \relative c {
      \CIonianScale
    }
  }
>>
}


dDorian = {
<<
  \new Staff {
    \clef treble
    \key d \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d d 
    \relative c' {
      \DDorianScale
    }
  }

  \new Staff {
    \clef bass
    \key d \major
    \myStaffAndTimeSettings
    \transpose d d 
    \relative c {
      \DDorianScale
    }
  }
>>
}


dPhrygian = {
<<
  \new Staff {
    \clef treble
    \key d \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e d 
    \relative c' {
      \EPhrygianScale
    }
  }

  \new Staff {
    \clef bass
    \key d \major
    \myStaffAndTimeSettings
    \transpose e d 
    \relative c {
      \EPhrygianScale
    }
  }
>>
}


dLydian = {
<<
  \new Staff {
    \clef treble
    \key d \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f d 
    \relative c' {
      \FLydianScale
    }
  }

  \new Staff {
    \clef bass
    \key d \major
    \myStaffAndTimeSettings
    \transpose f d 
    \relative c {
      \FLydianScale
    }
  }
>>
}


dMixolydian = {
<<
  \new Staff {
    \clef treble
    \key d \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, d 
    \relative c' {
      \GMixolydianScale
    }
  }

  \new Staff {
    \clef bass
    \key d \major
    \myStaffAndTimeSettings
    \transpose g, d 
    \relative c {
      \GMixolydianScale
    }
  }
>>
}


dEolian = {
<<
  \new Staff {
    \clef treble
    \key d \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, d 
    \relative c' {
      \AEolianScale
    }
  }

  \new Staff {
    \clef bass
    \key d \major
    \myStaffAndTimeSettings
    \transpose a, d 
    \relative c {
      \AEolianScale
    }
  }
>>
}


dLocrian = {
<<
  \new Staff {
    \clef treble
    \key d \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, d 
    \relative c' {
      \BLocrianScale
    }
  }

  \new Staff {
    \clef bass
    \key d \major
    \myStaffAndTimeSettings
    \transpose b, d 
    \relative c {
      \BLocrianScale
    }
  }
>>
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Ré"
  subtitle = " "
  composer = "Marc Mouries"
  style = "practice exercise"
}


% -------------------------------------------------------------------------

\score {
  \dMajor
}

\score {
  \dNaturalMinor
}

\score {
  \dHarmonicMinor
}

\score {
  \dMelodicMinor
}

\score {
  \dBlues
}

\score {
  \dGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #0.5

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #0.5


% -------------------------------------------------------------------------

\score {
  \dIonian
}

\score {
  \dDorian
}

\score {
  \dPhrygian
}

\score {
  \dLydian
}

\score {
  \dMixolydian
}

\score {
  \dEolian
}

\score {
  \dLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #1
\markup {J. Menu - Crissier, le 18/08/2013}
