
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Fa"
  subtitle = " "
  composer = "Marc Mouries"
  style = "practice exercise"
}


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


fMajor = {
  \new Staff {
    \clef treble
    \key f \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c f 
    \relative c' {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

fNaturalMinor = {
  \new Staff {
    \clef treble
    \key f \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c f 
    \relative c' {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

fHarmonicMinor = {
  \new Staff {
    \clef treble
    \key f \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c f 
    \relative c' {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

fMelodicMinor = {
  \new Staff {
    \clef treble
    \key f \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c f 
    \relative c' {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

fDorianMinor = {
  \new Staff {
    \clef treble
    \key f \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c f 
    \relative c' {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

fPhrygianMinor = {
  \new Staff {
    \clef treble
    \key f \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c f 
    \relative c' {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

fBlues = {
  \new Staff {
    \clef treble
    \key f \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c f 
    \relative c' {
      \CBluesScale
    }
  }
}


% -------------------------------------------------------------------------

fGypsyMinor = {
  \new Staff {
    \clef treble
    \key f \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c f 
    \relative c' {
      \CGypsyScale
    }
  }
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


fIonian = {
  \new Staff {
    \clef treble
    \key f \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c f 
    \relative c' {
      \CIonianScale
    }
  }
}


fDorian = {
  \new Staff {
    \clef treble
    \key f \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d f 
    \relative c' {
      \DDorianScale
    }
  }
}


fPhrygian = {
  \new Staff {
    \clef treble
    \key f \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e f 
    \relative c' {
      \EPhrygianScale
    }
  }
}


fLydian = {
  \new Staff {
    \clef treble
    \key f \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f f 
    \relative c' {
      \FLydianScale
    }
  }
}


fMixolydian = {
  \new Staff {
    \clef treble
    \key f \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, f 
    \relative c' {
      \GMixolydianScale
    }
  }
}


fEolian = {
  \new Staff {
    \clef treble
    \key f \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, f 
    \relative c' {
      \AEolianScale
    }
  }
}


fLocrian = {
  \new Staff {
    \clef treble
    \key f \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, f 
    \relative c' {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\score {
  \fMajor
}

\score {
  \fNaturalMinor
}

\score {
  \fHarmonicMinor
}

\score {
  \fMelodicMinor
}

\score {
  \fBlues
}

\score {
  \fGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


% -------------------------------------------------------------------------

\score {
  \fIonian
}

\score {
  \fDorian
}

\score {
  \fPhrygian
}

\score {
  \fLydian
}

\score {
  \fMixolydian
}

\score {
  \fEolian
}

\score {
  \fLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
