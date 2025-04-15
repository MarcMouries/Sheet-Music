
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


fisMajor = {
<<
  \new Staff {
    \clef treble
    \key fis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c fis 
    \relative c' {
      \CMajorScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \major
    \myStaffAndTimeSettings
    \transpose c fis 
    \relative c, {
      \CMajorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fisNaturalMinor = {
<<
  \new Staff {
    \clef treble
    \key fis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c fis 
    \relative c' {
      \CNaturalMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \minor
    \myStaffAndTimeSettings
    \transpose c fis 
    \relative c, {
      \CNaturalMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fisHarmonicMinor = {
<<
  \new Staff {
    \clef treble
    \key fis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c fis 
    \relative c' {
      \CHarmonicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \minor
    \myStaffAndTimeSettings
    \transpose c fis 
    \relative c, {
      \CHarmonicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fisMelodicMinor = {
<<
  \new Staff {
    \clef treble
    \key fis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c fis 
    \relative c' {
      \CMelodicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \minor
    \myStaffAndTimeSettings
    \transpose c fis 
    \relative c, {
      \CMelodicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fisDorianMinor = {
<<
  \new Staff {
    \clef treble
    \key fis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c fis 
    \relative c' {
      \CDorianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \minor
    \myStaffAndTimeSettings
    \transpose c fis 
    \relative c, {
      \CDorianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fisPhrygianMinor = {
<<
  \new Staff {
    \clef treble
    \key fis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c fis 
    \relative c' {
      \CPhrygianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \minor
    \myStaffAndTimeSettings
    \transpose c fis 
    \relative c, {
      \CPhrygianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fisBlues = {
<<
  \new Staff {
    \clef treble
    \key fis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c fis 
    \relative c' {
      \CBluesScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c fis 
    \relative c, {
      \CBluesScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fisGypsyMinor = {
<<
  \new Staff {
    \clef treble
    \key fis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c fis 
    \relative c' {
      \CGypsyScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c fis 
    \relative c, {
      \CGypsyScale
    }
  }
>>
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


fisIonian = {
<<
  \new Staff {
    \clef treble
    \key fis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c fis 
    \relative c' {
      \CIonianScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \major
    \myStaffAndTimeSettings
    \transpose c fis 
    \relative c, {
      \CIonianScale
    }
  }
>>
}


fisDorian = {
<<
  \new Staff {
    \clef treble
    \key fis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d fis 
    \relative c' {
      \DDorianScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \major
    \myStaffAndTimeSettings
    \transpose d fis 
    \relative c, {
      \DDorianScale
    }
  }
>>
}


fisPhrygian = {
<<
  \new Staff {
    \clef treble
    \key fis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e fis 
    \relative c' {
      \EPhrygianScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \major
    \myStaffAndTimeSettings
    \transpose e fis 
    \relative c, {
      \EPhrygianScale
    }
  }
>>
}


fisLydian = {
<<
  \new Staff {
    \clef treble
    \key fis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f fis 
    \relative c' {
      \FLydianScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \major
    \myStaffAndTimeSettings
    \transpose f fis 
    \relative c, {
      \FLydianScale
    }
  }
>>
}


fisMixolydian = {
<<
  \new Staff {
    \clef treble
    \key fis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, fis 
    \relative c' {
      \GMixolydianScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \major
    \myStaffAndTimeSettings
    \transpose g, fis 
    \relative c, {
      \GMixolydianScale
    }
  }
>>
}


fisEolian = {
<<
  \new Staff {
    \clef treble
    \key fis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, fis 
    \relative c' {
      \AEolianScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \major
    \myStaffAndTimeSettings
    \transpose a, fis 
    \relative c, {
      \AEolianScale
    }
  }
>>
}


fisLocrian = {
<<
  \new Staff {
    \clef treble
    \key fis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, fis 
    \relative c' {
      \BLocrianScale
    }
  }

  \new Staff {
    \clef bass
    \key fis \major
    \myStaffAndTimeSettings
    \transpose b, fis 
    \relative c, {
      \BLocrianScale
    }
  }
>>
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Fa dièse"
  subtitle = " "
}


% -------------------------------------------------------------------------

\score {
  \fisMajor
}

\score {
  \fisNaturalMinor
}

\score {
  \fisHarmonicMinor
}

\score {
  \fisMelodicMinor
}

\score {
  \fisBlues
}

\score {
  \fisGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #0.5

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #0.5


% -------------------------------------------------------------------------

\score {
  \fisIonian
}

\score {
  \fisDorian
}

\score {
  \fisPhrygian
}

\score {
  \fisLydian
}

\score {
  \fisMixolydian
}

\score {
  \fisEolian
}

\score {
  \fisLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #1
\markup {J. Menu - Crissier, le 18/08/2013}
