
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Do dièse"
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


cisMajor = {
  \new Staff {
    \clef treble
    \key cis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c cis 
    \relative c' {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

cisNaturalMinor = {
  \new Staff {
    \clef treble
    \key cis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c cis 
    \relative c' {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

cisHarmonicMinor = {
  \new Staff {
    \clef treble
    \key cis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c cis 
    \relative c' {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

cisMelodicMinor = {
  \new Staff {
    \clef treble
    \key cis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c cis 
    \relative c' {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

cisDorianMinor = {
  \new Staff {
    \clef treble
    \key cis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c cis 
    \relative c' {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

cisPhrygianMinor = {
  \new Staff {
    \clef treble
    \key cis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c cis 
    \relative c' {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

cisBlues = {
  \new Staff {
    \clef treble
    \key cis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c cis 
    \relative c' {
      \CBluesScale
    }
  }
}


% -------------------------------------------------------------------------

cisGypsyMinor = {
  \new Staff {
    \clef treble
    \key cis \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c cis 
    \relative c' {
      \CGypsyScale
    }
  }
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


cisIonian = {
  \new Staff {
    \clef treble
    \key cis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c cis 
    \relative c' {
      \CIonianScale
    }
  }
}


cisDorian = {
  \new Staff {
    \clef treble
    \key cis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d cis 
    \relative c' {
      \DDorianScale
    }
  }
}


cisPhrygian = {
  \new Staff {
    \clef treble
    \key cis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e cis 
    \relative c' {
      \EPhrygianScale
    }
  }
}


cisLydian = {
  \new Staff {
    \clef treble
    \key cis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f cis 
    \relative c' {
      \FLydianScale
    }
  }
}


cisMixolydian = {
  \new Staff {
    \clef treble
    \key cis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, cis 
    \relative c' {
      \GMixolydianScale
    }
  }
}


cisEolian = {
  \new Staff {
    \clef treble
    \key cis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, cis 
    \relative c' {
      \AEolianScale
    }
  }
}


cisLocrian = {
  \new Staff {
    \clef treble
    \key cis \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, cis 
    \relative c' {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\score {
  \cisMajor
}

\score {
  \cisNaturalMinor
}

\score {
  \cisHarmonicMinor
}

\score {
  \cisMelodicMinor
}

\score {
  \cisBlues
}

\score {
  \cisGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


% -------------------------------------------------------------------------

\score {
  \cisIonian
}

\score {
  \cisDorian
}

\score {
  \cisPhrygian
}

\score {
  \cisLydian
}

\score {
  \cisMixolydian
}

\score {
  \cisEolian
}

\score {
  \cisLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
