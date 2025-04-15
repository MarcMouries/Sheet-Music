
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\header{
  title = "Gammes de La"
  subtitle = " "
}


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


aMajor = {
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
}


% -------------------------------------------------------------------------

aNaturalMinor = {
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
}


% -------------------------------------------------------------------------

aHarmonicMinor = {
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
}


% -------------------------------------------------------------------------

aMelodicMinor = {
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
}


% -------------------------------------------------------------------------

aDorianMinor = {
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
}


% -------------------------------------------------------------------------

aPhrygianMinor = {
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
}


% -------------------------------------------------------------------------

aBlues = {
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
}


% -------------------------------------------------------------------------

aGypsyMinor = {
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
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


aIonian = {
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
}


aDorian = {
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
}


aPhrygian = {
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
}


aLydian = {
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
}


aMixolydian = {
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
}


aEolian = {
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
}


aLocrian = {
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

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


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


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
