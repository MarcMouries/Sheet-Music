
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------


\header{
  title = "Gammes de Si"
  subtitle = " "
}


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


bMajor = {
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
}


% -------------------------------------------------------------------------

bNaturalMinor = {
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
}


% -------------------------------------------------------------------------

bHarmonicMinor = {
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
}


% -------------------------------------------------------------------------

bMelodicMinor = {
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
}


% -------------------------------------------------------------------------

bDorianMinor = {
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
}


% -------------------------------------------------------------------------

bPhrygianMinor = {
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
}


% -------------------------------------------------------------------------

bBlues = {
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
}


% -------------------------------------------------------------------------

bGypsyMinor = {
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
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


bIonian = {
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
}


bDorian = {
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
}


bPhrygian = {
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
}


bLydian = {
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
}


bMixolydian = {
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
}


bEolian = {
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
}


bLocrian = {
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

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


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


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
