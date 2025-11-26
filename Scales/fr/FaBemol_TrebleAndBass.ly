
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


fesMajor = {
<<
  \new Staff {
    \clef treble
    \key fes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c fes 
    \relative c' {
      \CMajorScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \major
    \myStaffAndTimeSettings
    \transpose c fes 
    \relative c, {
      \CMajorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fesNaturalMinor = {
<<
  \new Staff {
    \clef treble
    \key fes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c fes 
    \relative c' {
      \CNaturalMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \minor
    \myStaffAndTimeSettings
    \transpose c fes 
    \relative c, {
      \CNaturalMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fesHarmonicMinor = {
<<
  \new Staff {
    \clef treble
    \key fes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c fes 
    \relative c' {
      \CHarmonicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \minor
    \myStaffAndTimeSettings
    \transpose c fes 
    \relative c, {
      \CHarmonicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fesMelodicMinor = {
<<
  \new Staff {
    \clef treble
    \key fes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c fes 
    \relative c' {
      \CMelodicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \minor
    \myStaffAndTimeSettings
    \transpose c fes 
    \relative c, {
      \CMelodicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fesDorianMinor = {
<<
  \new Staff {
    \clef treble
    \key fes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c fes 
    \relative c' {
      \CDorianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \minor
    \myStaffAndTimeSettings
    \transpose c fes 
    \relative c, {
      \CDorianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fesPhrygianMinor = {
<<
  \new Staff {
    \clef treble
    \key fes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c fes 
    \relative c' {
      \CPhrygianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \minor
    \myStaffAndTimeSettings
    \transpose c fes 
    \relative c, {
      \CPhrygianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fesBlues = {
<<
  \new Staff {
    \clef treble
    \key fes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c fes 
    \relative c' {
      \CBluesScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c fes 
    \relative c, {
      \CBluesScale
    }
  }
>>
}


% -------------------------------------------------------------------------

fesGypsyMinor = {
<<
  \new Staff {
    \clef treble
    \key fes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c fes 
    \relative c' {
      \CGypsyScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c fes 
    \relative c, {
      \CGypsyScale
    }
  }
>>
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


fesIonian = {
<<
  \new Staff {
    \clef treble
    \key fes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c fes 
    \relative c' {
      \CIonianScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \major
    \myStaffAndTimeSettings
    \transpose c fes 
    \relative c, {
      \CIonianScale
    }
  }
>>
}


fesDorian = {
<<
  \new Staff {
    \clef treble
    \key fes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d fes 
    \relative c' {
      \DDorianScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \major
    \myStaffAndTimeSettings
    \transpose d fes 
    \relative c, {
      \DDorianScale
    }
  }
>>
}


fesPhrygian = {
<<
  \new Staff {
    \clef treble
    \key fes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e fes 
    \relative c' {
      \EPhrygianScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \major
    \myStaffAndTimeSettings
    \transpose e fes 
    \relative c, {
      \EPhrygianScale
    }
  }
>>
}


fesLydian = {
<<
  \new Staff {
    \clef treble
    \key fes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f fes 
    \relative c' {
      \FLydianScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \major
    \myStaffAndTimeSettings
    \transpose f fes 
    \relative c, {
      \FLydianScale
    }
  }
>>
}


fesMixolydian = {
<<
  \new Staff {
    \clef treble
    \key fes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, fes 
    \relative c' {
      \GMixolydianScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \major
    \myStaffAndTimeSettings
    \transpose g, fes 
    \relative c, {
      \GMixolydianScale
    }
  }
>>
}


fesEolian = {
<<
  \new Staff {
    \clef treble
    \key fes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, fes 
    \relative c' {
      \AEolianScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \major
    \myStaffAndTimeSettings
    \transpose a, fes 
    \relative c, {
      \AEolianScale
    }
  }
>>
}


fesLocrian = {
<<
  \new Staff {
    \clef treble
    \key fes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, fes 
    \relative c' {
      \BLocrianScale
    }
  }

  \new Staff {
    \clef bass
    \key fes \major
    \myStaffAndTimeSettings
    \transpose b, fes 
    \relative c, {
      \BLocrianScale
    }
  }
>>
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Fa bémol"
  subtitle = " "
  composer = "Marc Mouries"
  style = "practice exercise"
}


% -------------------------------------------------------------------------

\score {
  \fesMajor
}

\score {
  \fesNaturalMinor
}

\score {
  \fesHarmonicMinor
}

\score {
  \fesMelodicMinor
}

\score {
  \fesBlues
}

\score {
  \fesGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #0.5

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #0.5


% -------------------------------------------------------------------------

\score {
  \fesIonian
}

\score {
  \fesDorian
}

\score {
  \fesPhrygian
}

\score {
  \fesLydian
}

\score {
  \fesMixolydian
}

\score {
  \fesEolian
}

\score {
  \fesLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #1
\markup {J. Menu - Crissier, le 18/08/2013}
