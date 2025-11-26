
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


bMajor = {
<<
  \new Staff {
    \clef treble
    \key b \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c b 
    \relative c' {
      \CMajorScale
    }
  }

  \new Staff {
    \clef bass
    \key b \major
    \myStaffAndTimeSettings
    \transpose c b 
    \relative c, {
      \CMajorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

bNaturalMinor = {
<<
  \new Staff {
    \clef treble
    \key b \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c b 
    \relative c' {
      \CNaturalMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key b \minor
    \myStaffAndTimeSettings
    \transpose c b 
    \relative c, {
      \CNaturalMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

bHarmonicMinor = {
<<
  \new Staff {
    \clef treble
    \key b \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c b 
    \relative c' {
      \CHarmonicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key b \minor
    \myStaffAndTimeSettings
    \transpose c b 
    \relative c, {
      \CHarmonicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

bMelodicMinor = {
<<
  \new Staff {
    \clef treble
    \key b \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c b 
    \relative c' {
      \CMelodicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key b \minor
    \myStaffAndTimeSettings
    \transpose c b 
    \relative c, {
      \CMelodicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

bDorianMinor = {
<<
  \new Staff {
    \clef treble
    \key b \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c b 
    \relative c' {
      \CDorianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key b \minor
    \myStaffAndTimeSettings
    \transpose c b 
    \relative c, {
      \CDorianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

bPhrygianMinor = {
<<
  \new Staff {
    \clef treble
    \key b \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c b 
    \relative c' {
      \CPhrygianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key b \minor
    \myStaffAndTimeSettings
    \transpose c b 
    \relative c, {
      \CPhrygianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

bBlues = {
<<
  \new Staff {
    \clef treble
    \key b \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c b 
    \relative c' {
      \CBluesScale
    }
  }

  \new Staff {
    \clef bass
    \key b \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c b 
    \relative c, {
      \CBluesScale
    }
  }
>>
}


% -------------------------------------------------------------------------

bGypsyMinor = {
<<
  \new Staff {
    \clef treble
    \key b \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c b 
    \relative c' {
      \CGypsyScale
    }
  }

  \new Staff {
    \clef bass
    \key b \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c b 
    \relative c, {
      \CGypsyScale
    }
  }
>>
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


bIonian = {
<<
  \new Staff {
    \clef treble
    \key b \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c b 
    \relative c' {
      \CIonianScale
    }
  }

  \new Staff {
    \clef bass
    \key b \major
    \myStaffAndTimeSettings
    \transpose c b 
    \relative c, {
      \CIonianScale
    }
  }
>>
}


bDorian = {
<<
  \new Staff {
    \clef treble
    \key b \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d b 
    \relative c' {
      \DDorianScale
    }
  }

  \new Staff {
    \clef bass
    \key b \major
    \myStaffAndTimeSettings
    \transpose d b 
    \relative c, {
      \DDorianScale
    }
  }
>>
}


bPhrygian = {
<<
  \new Staff {
    \clef treble
    \key b \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e b 
    \relative c' {
      \EPhrygianScale
    }
  }

  \new Staff {
    \clef bass
    \key b \major
    \myStaffAndTimeSettings
    \transpose e b 
    \relative c, {
      \EPhrygianScale
    }
  }
>>
}


bLydian = {
<<
  \new Staff {
    \clef treble
    \key b \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f b 
    \relative c' {
      \FLydianScale
    }
  }

  \new Staff {
    \clef bass
    \key b \major
    \myStaffAndTimeSettings
    \transpose f b 
    \relative c, {
      \FLydianScale
    }
  }
>>
}


bMixolydian = {
<<
  \new Staff {
    \clef treble
    \key b \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, b 
    \relative c' {
      \GMixolydianScale
    }
  }

  \new Staff {
    \clef bass
    \key b \major
    \myStaffAndTimeSettings
    \transpose g, b 
    \relative c, {
      \GMixolydianScale
    }
  }
>>
}


bEolian = {
<<
  \new Staff {
    \clef treble
    \key b \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, b 
    \relative c' {
      \AEolianScale
    }
  }

  \new Staff {
    \clef bass
    \key b \major
    \myStaffAndTimeSettings
    \transpose a, b 
    \relative c, {
      \AEolianScale
    }
  }
>>
}


bLocrian = {
<<
  \new Staff {
    \clef treble
    \key b \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, b 
    \relative c' {
      \BLocrianScale
    }
  }

  \new Staff {
    \clef bass
    \key b \major
    \myStaffAndTimeSettings
    \transpose b, b 
    \relative c, {
      \BLocrianScale
    }
  }
>>
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Si"
  subtitle = " "
  composer = "Marc Mouries"
  style = "practice exercise"
}


% -------------------------------------------------------------------------

\score {
  \bMajor
}

\score {
  \bNaturalMinor
}

\score {
  \bHarmonicMinor
}

\score {
  \bMelodicMinor
}

\score {
  \bBlues
}

\score {
  \bGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #0.5

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #0.5


% -------------------------------------------------------------------------

\score {
  \bIonian
}

\score {
  \bDorian
}

\score {
  \bPhrygian
}

\score {
  \bLydian
}

\score {
  \bMixolydian
}

\score {
  \bEolian
}

\score {
  \bLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #1
\markup {J. Menu - Crissier, le 18/08/2013}
