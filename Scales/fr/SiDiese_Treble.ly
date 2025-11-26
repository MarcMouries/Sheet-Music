
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Si dièse"
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


bisMajor = {
  \new Staff {
    \clef treble
    \key bis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c bis 
    \relative c' {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

bisNaturalMinor = {
  \new Staff {
    \clef treble
    \key bis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c bis 
    \relative c' {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

bisHarmonicMinor = {
  \new Staff {
    \clef treble
    \key bis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c bis 
    \relative c' {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

bisMelodicMinor = {
  \new Staff {
    \clef treble
    \key bis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c bis 
    \relative c' {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

bisDorianMinor = {
  \new Staff {
    \clef treble
    \key bis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c bis 
    \relative c' {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

bisPhrygianMinor = {
  \new Staff {
    \clef treble
    \key bis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c bis 
    \relative c' {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

bisBlues = {
  \new Staff {
    \clef treble
    \key bis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c bis 
    \relative c' {
      \CBluesScale
    }
  }
}


% -------------------------------------------------------------------------

bisGypsyMinor = {
  \new Staff {
    \clef treble
    \key bis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c bis 
    \relative c' {
      \CGypsyScale
    }
  }
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


bisIonian = {
  \new Staff {
    \clef treble
    \key bis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c bis 
    \relative c' {
      \CIonianScale
    }
  }
}


bisDorian = {
  \new Staff {
    \clef treble
    \key bis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d bis 
    \relative c' {
      \DDorianScale
    }
  }
}


bisPhrygian = {
  \new Staff {
    \clef treble
    \key bis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e bis 
    \relative c' {
      \EPhrygianScale
    }
  }
}


bisLydian = {
  \new Staff {
    \clef treble
    \key bis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f bis 
    \relative c' {
      \FLydianScale
    }
  }
}


bisMixolydian = {
  \new Staff {
    \clef treble
    \key bis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, bis 
    \relative c' {
      \GMixolydianScale
    }
  }
}


bisEolian = {
  \new Staff {
    \clef treble
    \key bis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, bis 
    \relative c' {
      \AEolianScale
    }
  }
}


bisLocrian = {
  \new Staff {
    \clef treble
    \key bis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, bis 
    \relative c' {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\score {
  \bisMajor
}

\score {
  \bisNaturalMinor
}

\score {
  \bisHarmonicMinor
}

\score {
  \bisMelodicMinor
}

\score {
  \bisBlues
}

\score {
  \bisGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


% -------------------------------------------------------------------------

\score {
  \bisIonian
}

\score {
  \bisDorian
}

\score {
  \bisPhrygian
}

\score {
  \bisLydian
}

\score {
  \bisMixolydian
}

\score {
  \bisEolian
}

\score {
  \bisLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
