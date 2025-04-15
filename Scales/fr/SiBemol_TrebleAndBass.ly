
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


besMajor = {
<<
  \new Staff {
    \clef treble
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c bes 
    \relative c' {
      \CMajorScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \transpose c bes 
    \relative c, {
      \CMajorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

besNaturalMinor = {
<<
  \new Staff {
    \clef treble
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c bes 
    \relative c' {
      \CNaturalMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \minor
    \myStaffAndTimeSettings
    \transpose c bes 
    \relative c, {
      \CNaturalMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

besHarmonicMinor = {
<<
  \new Staff {
    \clef treble
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c bes 
    \relative c' {
      \CHarmonicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \minor
    \myStaffAndTimeSettings
    \transpose c bes 
    \relative c, {
      \CHarmonicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

besMelodicMinor = {
<<
  \new Staff {
    \clef treble
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c bes 
    \relative c' {
      \CMelodicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \minor
    \myStaffAndTimeSettings
    \transpose c bes 
    \relative c, {
      \CMelodicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

besDorianMinor = {
<<
  \new Staff {
    \clef treble
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c bes 
    \relative c' {
      \CDorianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \minor
    \myStaffAndTimeSettings
    \transpose c bes 
    \relative c, {
      \CDorianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

besPhrygianMinor = {
<<
  \new Staff {
    \clef treble
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c bes 
    \relative c' {
      \CPhrygianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \minor
    \myStaffAndTimeSettings
    \transpose c bes 
    \relative c, {
      \CPhrygianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

besBlues = {
<<
  \new Staff {
    \clef treble
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c bes 
    \relative c' {
      \CBluesScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c bes 
    \relative c, {
      \CBluesScale
    }
  }
>>
}


% -------------------------------------------------------------------------

besGypsyMinor = {
<<
  \new Staff {
    \clef treble
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c bes 
    \relative c' {
      \CGypsyScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c bes 
    \relative c, {
      \CGypsyScale
    }
  }
>>
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


besIonian = {
<<
  \new Staff {
    \clef treble
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c bes 
    \relative c' {
      \CIonianScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \transpose c bes 
    \relative c, {
      \CIonianScale
    }
  }
>>
}


besDorian = {
<<
  \new Staff {
    \clef treble
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d bes 
    \relative c' {
      \DDorianScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \transpose d bes 
    \relative c, {
      \DDorianScale
    }
  }
>>
}


besPhrygian = {
<<
  \new Staff {
    \clef treble
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e bes 
    \relative c' {
      \EPhrygianScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \transpose e bes 
    \relative c, {
      \EPhrygianScale
    }
  }
>>
}


besLydian = {
<<
  \new Staff {
    \clef treble
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f bes 
    \relative c' {
      \FLydianScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \transpose f bes 
    \relative c, {
      \FLydianScale
    }
  }
>>
}


besMixolydian = {
<<
  \new Staff {
    \clef treble
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, bes 
    \relative c' {
      \GMixolydianScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \transpose g, bes 
    \relative c, {
      \GMixolydianScale
    }
  }
>>
}


besEolian = {
<<
  \new Staff {
    \clef treble
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, bes 
    \relative c' {
      \AEolianScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \transpose a, bes 
    \relative c, {
      \AEolianScale
    }
  }
>>
}


besLocrian = {
<<
  \new Staff {
    \clef treble
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, bes 
    \relative c' {
      \BLocrianScale
    }
  }

  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \transpose b, bes 
    \relative c, {
      \BLocrianScale
    }
  }
>>
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Si bémol"
  subtitle = " "
}


% -------------------------------------------------------------------------

\score {
  \besMajor
}

\score {
  \besNaturalMinor
}

\score {
  \besHarmonicMinor
}

\score {
  \besMelodicMinor
}

\score {
  \besBlues
}

\score {
  \besGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #0.5

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #0.5


% -------------------------------------------------------------------------

\score {
  \besIonian
}

\score {
  \besDorian
}

\score {
  \besPhrygian
}

\score {
  \besLydian
}

\score {
  \besMixolydian
}

\score {
  \besEolian
}

\score {
  \besLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #1
\markup {J. Menu - Crissier, le 18/08/2013}
