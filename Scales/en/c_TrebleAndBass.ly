
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


cMajor = {
<<
  \new Staff {
    \clef treble
    \key c \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c c 
    \relative c' {
      \CMajorScale
    }
  }

  \new Staff {
    \clef bass
    \key c \major
    \myStaffAndTimeSettings
    \transpose c c 
    \relative c {
      \CMajorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

cNaturalMinor = {
<<
  \new Staff {
    \clef treble
    \key c \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c c 
    \relative c' {
      \CNaturalMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key c \minor
    \myStaffAndTimeSettings
    \transpose c c 
    \relative c {
      \CNaturalMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

cHarmonicMinor = {
<<
  \new Staff {
    \clef treble
    \key c \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c c 
    \relative c' {
      \CHarmonicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key c \minor
    \myStaffAndTimeSettings
    \transpose c c 
    \relative c {
      \CHarmonicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

cMelodicMinor = {
<<
  \new Staff {
    \clef treble
    \key c \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c c 
    \relative c' {
      \CMelodicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key c \minor
    \myStaffAndTimeSettings
    \transpose c c 
    \relative c {
      \CMelodicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

cDorianMinor = {
<<
  \new Staff {
    \clef treble
    \key c \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c c 
    \relative c' {
      \CDorianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key c \minor
    \myStaffAndTimeSettings
    \transpose c c 
    \relative c {
      \CDorianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

cPhrygianMinor = {
<<
  \new Staff {
    \clef treble
    \key c \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c c 
    \relative c' {
      \CPhrygianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key c \minor
    \myStaffAndTimeSettings
    \transpose c c 
    \relative c {
      \CPhrygianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

cBlues = {
<<
  \new Staff {
    \clef treble
    \key c \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c c 
    \relative c' {
      \CBluesScale
    }
  }

  \new Staff {
    \clef bass
    \key c \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c c 
    \relative c {
      \CBluesScale
    }
  }
>>
}


% -------------------------------------------------------------------------

cGypsyMinor = {
<<
  \new Staff {
    \clef treble
    \key c \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c c 
    \relative c' {
      \CGypsyScale
    }
  }

  \new Staff {
    \clef bass
    \key c \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c c 
    \relative c {
      \CGypsyScale
    }
  }
>>
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


cIonian = {
<<
  \new Staff {
    \clef treble
    \key c \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c c 
    \relative c' {
      \CIonianScale
    }
  }

  \new Staff {
    \clef bass
    \key c \major
    \myStaffAndTimeSettings
    \transpose c c 
    \relative c {
      \CIonianScale
    }
  }
>>
}


cDorian = {
<<
  \new Staff {
    \clef treble
    \key c \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d c 
    \relative c' {
      \DDorianScale
    }
  }

  \new Staff {
    \clef bass
    \key c \major
    \myStaffAndTimeSettings
    \transpose d c 
    \relative c {
      \DDorianScale
    }
  }
>>
}


cPhrygian = {
<<
  \new Staff {
    \clef treble
    \key c \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e c 
    \relative c' {
      \EPhrygianScale
    }
  }

  \new Staff {
    \clef bass
    \key c \major
    \myStaffAndTimeSettings
    \transpose e c 
    \relative c {
      \EPhrygianScale
    }
  }
>>
}


cLydian = {
<<
  \new Staff {
    \clef treble
    \key c \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f c 
    \relative c' {
      \FLydianScale
    }
  }

  \new Staff {
    \clef bass
    \key c \major
    \myStaffAndTimeSettings
    \transpose f c 
    \relative c {
      \FLydianScale
    }
  }
>>
}


cMixolydian = {
<<
  \new Staff {
    \clef treble
    \key c \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, c 
    \relative c' {
      \GMixolydianScale
    }
  }

  \new Staff {
    \clef bass
    \key c \major
    \myStaffAndTimeSettings
    \transpose g, c 
    \relative c {
      \GMixolydianScale
    }
  }
>>
}


cEolian = {
<<
  \new Staff {
    \clef treble
    \key c \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, c 
    \relative c' {
      \AEolianScale
    }
  }

  \new Staff {
    \clef bass
    \key c \major
    \myStaffAndTimeSettings
    \transpose a, c 
    \relative c {
      \AEolianScale
    }
  }
>>
}


cLocrian = {
<<
  \new Staff {
    \clef treble
    \key c \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, c 
    \relative c' {
      \BLocrianScale
    }
  }

  \new Staff {
    \clef bass
    \key c \major
    \myStaffAndTimeSettings
    \transpose b, c 
    \relative c {
      \BLocrianScale
    }
  }
>>
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Do"
  subtitle = " "
}


% -------------------------------------------------------------------------

\score {
  \cMajor
}

\score {
  \cNaturalMinor
}

\score {
  \cHarmonicMinor
}

\score {
  \cMelodicMinor
}

\score {
  \cBlues
}

\score {
  \cGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #0.5

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #0.5


% -------------------------------------------------------------------------

\score {
  \cIonian
}

\score {
  \cDorian
}

\score {
  \cPhrygian
}

\score {
  \cLydian
}

\score {
  \cMixolydian
}

\score {
  \cEolian
}

\score {
  \cLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #1
\markup {J. Menu - Crissier, le 18/08/2013}
