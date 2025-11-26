
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
  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c bes 
    \relative c, {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

besNaturalMinor = {
  \new Staff {
    \clef bass
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c bes 
    \relative c, {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

besHarmonicMinor = {
  \new Staff {
    \clef bass
      \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c bes 
    \relative c, {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

besMelodicMinor = {
  \new Staff {
    \clef bass
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c bes 
    \relative c, {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

besDorianMinor = {
  \new Staff {
    \clef bass
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c bes 
    \relative c, {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

besPhrygianMinor = {
  \new Staff {
    \clef bass
    \key bes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c bes 
    \relative c, {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

besBlues = {
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
}


% -------------------------------------------------------------------------

besGypsyMinor = {
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
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


besIonian = {
  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c bes 
    \relative c, {
      \CIonianScale
    }
  }
}


besDorian = {
  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d bes 
    \relative c, {
      \DDorianScale
    }
  }
}


besPhrygian = {
  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e bes 
    \relative c, {
      \EPhrygianScale
    }
  }
}


besLydian = {
  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f bes 
    \relative c, {
      \FLydianScale
    }
  }
}


besMixolydian = {
  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, bes 
    \relative c, {
      \GMixolydianScale
    }
  }
}


besEolian = {
  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, bes 
    \relative c, {
      \AEolianScale
    }
  }
}


besLocrian = {
  \new Staff {
    \clef bass
    \key bes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, bes 
    \relative c, {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Si bémol"
  subtitle = " "
  composer = "Marc Mouries"
  style = "practice exercise"
}


% -------------------------------------------------------------------------

\score {
  \besMajor
}

\score {
  \besNaturalMinor
}

\score {
  \besMelodicMinor
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

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


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


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
