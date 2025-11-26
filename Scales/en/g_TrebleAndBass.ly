
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


gMajor = {
<<
  \new Staff {
    \clef treble
    \key g \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c g 
    \relative c' {
      \CMajorScale
    }
  }

  \new Staff {
    \clef bass
    \key g \major
    \myStaffAndTimeSettings
    \transpose c g 
    \relative c, {
      \CMajorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gNaturalMinor = {
<<
  \new Staff {
    \clef treble
    \key g \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c g 
    \relative c' {
      \CNaturalMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key g \minor
    \myStaffAndTimeSettings
    \transpose c g 
    \relative c, {
      \CNaturalMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gHarmonicMinor = {
<<
  \new Staff {
    \clef treble
    \key g \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c g 
    \relative c' {
      \CHarmonicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key g \minor
    \myStaffAndTimeSettings
    \transpose c g 
    \relative c, {
      \CHarmonicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gMelodicMinor = {
<<
  \new Staff {
    \clef treble
    \key g \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c g 
    \relative c' {
      \CMelodicMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key g \minor
    \myStaffAndTimeSettings
    \transpose c g 
    \relative c, {
      \CMelodicMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gDorianMinor = {
<<
  \new Staff {
    \clef treble
    \key g \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c g 
    \relative c' {
      \CDorianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key g \minor
    \myStaffAndTimeSettings
    \transpose c g 
    \relative c, {
      \CDorianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gPhrygianMinor = {
<<
  \new Staff {
    \clef treble
    \key g \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c g 
    \relative c' {
      \CPhrygianMinorScale
    }
  }

  \new Staff {
    \clef bass
    \key g \minor
    \myStaffAndTimeSettings
    \transpose c g 
    \relative c, {
      \CPhrygianMinorScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gBlues = {
<<
  \new Staff {
    \clef treble
    \key g \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c g 
    \relative c' {
      \CBluesScale
    }
  }

  \new Staff {
    \clef bass
    \key g \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c g 
    \relative c, {
      \CBluesScale
    }
  }
>>
}


% -------------------------------------------------------------------------

gGypsyMinor = {
<<
  \new Staff {
    \clef treble
    \key g \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c g 
    \relative c' {
      \CGypsyScale
    }
  }

  \new Staff {
    \clef bass
    \key g \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c g 
    \relative c, {
      \CGypsyScale
    }
  }
>>
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


gIonian = {
<<
  \new Staff {
    \clef treble
    \key g \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c g 
    \relative c' {
      \CIonianScale
    }
  }

  \new Staff {
    \clef bass
    \key g \major
    \myStaffAndTimeSettings
    \transpose c g 
    \relative c, {
      \CIonianScale
    }
  }
>>
}


gDorian = {
<<
  \new Staff {
    \clef treble
    \key g \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d g 
    \relative c' {
      \DDorianScale
    }
  }

  \new Staff {
    \clef bass
    \key g \major
    \myStaffAndTimeSettings
    \transpose d g 
    \relative c, {
      \DDorianScale
    }
  }
>>
}


gPhrygian = {
<<
  \new Staff {
    \clef treble
    \key g \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e g 
    \relative c' {
      \EPhrygianScale
    }
  }

  \new Staff {
    \clef bass
    \key g \major
    \myStaffAndTimeSettings
    \transpose e g 
    \relative c, {
      \EPhrygianScale
    }
  }
>>
}


gLydian = {
<<
  \new Staff {
    \clef treble
    \key g \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f g 
    \relative c' {
      \FLydianScale
    }
  }

  \new Staff {
    \clef bass
    \key g \major
    \myStaffAndTimeSettings
    \transpose f g 
    \relative c, {
      \FLydianScale
    }
  }
>>
}


gMixolydian = {
<<
  \new Staff {
    \clef treble
    \key g \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, g 
    \relative c' {
      \GMixolydianScale
    }
  }

  \new Staff {
    \clef bass
    \key g \major
    \myStaffAndTimeSettings
    \transpose g, g 
    \relative c, {
      \GMixolydianScale
    }
  }
>>
}


gEolian = {
<<
  \new Staff {
    \clef treble
    \key g \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, g 
    \relative c' {
      \AEolianScale
    }
  }

  \new Staff {
    \clef bass
    \key g \major
    \myStaffAndTimeSettings
    \transpose a, g 
    \relative c, {
      \AEolianScale
    }
  }
>>
}


gLocrian = {
<<
  \new Staff {
    \clef treble
    \key g \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, g 
    \relative c' {
      \BLocrianScale
    }
  }

  \new Staff {
    \clef bass
    \key g \major
    \myStaffAndTimeSettings
    \transpose b, g 
    \relative c, {
      \BLocrianScale
    }
  }
>>
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Sol"
  subtitle = " "
  composer = "Marc Mouries"
  style = "practice exercise"
}


% -------------------------------------------------------------------------

\score {
  \gMajor
}

\score {
  \gNaturalMinor
}

\score {
  \gHarmonicMinor
}

\score {
  \gMelodicMinor
}

\score {
  \gBlues
}

\score {
  \gGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #0.5

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #0.5


% -------------------------------------------------------------------------

\score {
  \gIonian
}

\score {
  \gDorian
}

\score {
  \gPhrygian
}

\score {
  \gLydian
}

\score {
  \gMixolydian
}

\score {
  \gEolian
}

\score {
  \gLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #1
\markup {J. Menu - Crissier, le 18/08/2013}
