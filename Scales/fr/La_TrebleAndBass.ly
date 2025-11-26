
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


aMajor = {
<<
  \new Staff {
    \clef treble
    \key a \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c a 
    \relative c' {
      \CMajorScale
    }
  }

  \new Staff {
    \clef bass
    \key a \major
    \myStaffAndTimeSettings
    \transpose c a 
    \relative c, {
      \CMajorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

aNaturalMinor = {
<<
  \new Staff {
    \clef treble
    \key a \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c a 
    \relative c' {
      \CNaturalMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key a \minor
    \myStaffAndTimeSettings
    \transpose c a 
    \relative c, {
      \CNaturalMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

aHarmonicMinor = {
<<
  \new Staff {
    \clef treble
    \key a \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c a 
    \relative c' {
      \CHarmonicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key a \minor
    \myStaffAndTimeSettings
    \transpose c a 
    \relative c, {
      \CHarmonicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

aMelodicMinor = {
<<
  \new Staff {
    \clef treble
    \key a \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c a 
    \relative c' {
      \CMelodicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key a \minor
    \myStaffAndTimeSettings
    \transpose c a 
    \relative c, {
      \CMelodicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

aDorianMinor = {
<<
  \new Staff {
    \clef treble
    \key a \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c a 
    \relative c' {
      \CDorianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key a \minor
    \myStaffAndTimeSettings
    \transpose c a 
    \relative c, {
      \CDorianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

aPhrygianMinor = {
<<
  \new Staff {
    \clef treble
    \key a \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c a 
    \relative c' {
      \CPhrygianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key a \minor
    \myStaffAndTimeSettings
    \transpose c a 
    \relative c, {
      \CPhrygianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

aBlues = {
<<
  \new Staff {
    \clef treble
    \key a \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c a 
    \relative c' {
      \CBluesScale
    }
  }

  \new Staff {
    \clef bass
    \key a \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c a 
    \relative c, {
      \CBluesScale
    }
  }
>>
}


% -------------------------------------------------------------------------

aGypsyMinor = {
<<
  \new Staff {
    \clef treble
    \key a \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c a 
    \relative c' {
      \CGypsyScale
    }
  }

  \new Staff {
    \clef bass
    \key a \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c a 
    \relative c, {
      \CGypsyScale
    }
  }
>>
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


aIonian = {
<<
  \new Staff {
    \clef treble
    \key a \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c a 
    \relative c' {
      \CIonianScale
    }
  }

  \new Staff {
    \clef bass
    \key a \major
    \myStaffAndTimeSettings
    \transpose c a 
    \relative c, {
      \CIonianScale
    }
  }
>>
}


aDorian = {
<<
  \new Staff {
    \clef treble
    \key a \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d a 
    \relative c' {
      \DDorianScale
    }
  }

  \new Staff {
    \clef bass
    \key a \major
    \myStaffAndTimeSettings
    \transpose d a 
    \relative c, {
      \DDorianScale
    }
  }
>>
}


aPhrygian = {
<<
  \new Staff {
    \clef treble
    \key a \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e a 
    \relative c' {
      \EPhrygianScale
    }
  }

  \new Staff {
    \clef bass
    \key a \major
    \myStaffAndTimeSettings
    \transpose e a 
    \relative c, {
      \EPhrygianScale
    }
  }
>>
}


aLydian = {
<<
  \new Staff {
    \clef treble
    \key a \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f a 
    \relative c' {
      \FLydianScale
    }
  }

  \new Staff {
    \clef bass
    \key a \major
    \myStaffAndTimeSettings
    \transpose f a 
    \relative c, {
      \FLydianScale
    }
  }
>>
}


aMixolydian = {
<<
  \new Staff {
    \clef treble
    \key a \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, a 
    \relative c' {
      \GMixolydianScale
    }
  }

  \new Staff {
    \clef bass
    \key a \major
    \myStaffAndTimeSettings
    \transpose g, a 
    \relative c, {
      \GMixolydianScale
    }
  }
>>
}


aEolian = {
<<
  \new Staff {
    \clef treble
    \key a \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, a 
    \relative c' {
      \AEolianScale
    }
  }

  \new Staff {
    \clef bass
    \key a \major
    \myStaffAndTimeSettings
    \transpose a, a 
    \relative c, {
      \AEolianScale
    }
  }
>>
}


aLocrian = {
<<
  \new Staff {
    \clef treble
    \key a \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, a 
    \relative c' {
      \BLocrianScale
    }
  }

  \new Staff {
    \clef bass
    \key a \major
    \myStaffAndTimeSettings
    \transpose b, a 
    \relative c, {
      \BLocrianScale
    }
  }
>>
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de La"
  subtitle = " "
  composer = "Marc Mouries"
  style = "practice exercise"
}


% -------------------------------------------------------------------------

\score {
  \aMajor
}

\score {
  \aNaturalMinor
}

\score {
  \aHarmonicMinor
}

\score {
  \aMelodicMinor
}

\score {
  \aBlues
}

\score {
  \aGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #0.5

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #0.5


% -------------------------------------------------------------------------

\score {
  \aIonian
}

\score {
  \aDorian
}

\score {
  \aPhrygian
}

\score {
  \aLydian
}

\score {
  \aMixolydian
}

\score {
  \aEolian
}

\score {
  \aLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #1
\markup {J. Menu - Crissier, le 18/08/2013}
