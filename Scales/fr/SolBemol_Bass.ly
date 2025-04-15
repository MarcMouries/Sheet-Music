
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


gesMajor = {
  \new Staff {
    \clef bass
    \key ges \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c ges 
    \relative c, {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

gesNaturalMinor = {
  \new Staff {
    \clef bass
    \key ges \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c ges 
    \relative c, {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

gesHarmonicMinor = {
  \new Staff {
    \clef bass
      \key ges \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c ges 
    \relative c, {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

gesMelodicMinor = {
  \new Staff {
    \clef bass
    \key ges \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c ges 
    \relative c, {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

gesDorianMinor = {
  \new Staff {
    \clef bass
    \key ges \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c ges 
    \relative c, {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

gesPhrygianMinor = {
  \new Staff {
    \clef bass
    \key ges \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c ges 
    \relative c, {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

gesBlues = {
  \new Staff {
    \clef bass
    \key ges \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c ges 
    \relative c, {
      \CBluesScale
    }
  }
}


% -------------------------------------------------------------------------

gesGypsyMinor = {
  \new Staff {
    \clef bass
    \key ges \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c ges 
    \relative c, {
      \CGypsyScale
    }
  }
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


gesIonian = {
  \new Staff {
    \clef bass
    \key ges \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c ges 
    \relative c, {
      \CIonianScale
    }
  }
}


gesDorian = {
  \new Staff {
    \clef bass
    \key ges \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d ges 
    \relative c, {
      \DDorianScale
    }
  }
}


gesPhrygian = {
  \new Staff {
    \clef bass
    \key ges \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e ges 
    \relative c, {
      \EPhrygianScale
    }
  }
}


gesLydian = {
  \new Staff {
    \clef bass
    \key ges \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f ges 
    \relative c, {
      \FLydianScale
    }
  }
}


gesMixolydian = {
  \new Staff {
    \clef bass
    \key ges \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, ges 
    \relative c, {
      \GMixolydianScale
    }
  }
}


gesEolian = {
  \new Staff {
    \clef bass
    \key ges \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, ges 
    \relative c, {
      \AEolianScale
    }
  }
}


gesLocrian = {
  \new Staff {
    \clef bass
    \key ges \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, ges 
    \relative c, {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\header{
  title = "Gammes de Sol bémol"
  subtitle = " "
}


% -------------------------------------------------------------------------

\score {
  \gesMajor
}

\score {
  \gesNaturalMinor
}

\score {
  \gesMelodicMinor
}

\score {
  \gesMelodicMinor
}

\score {
  \gesBlues
}

\score {
  \gesGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


% -------------------------------------------------------------------------

\score {
  \gesIonian
}

\score {
  \gesDorian
}

\score {
  \gesPhrygian
}

\score {
  \gesLydian
}

\score {
  \gesMixolydian
}

\score {
  \gesEolian
}

\score {
  \gesLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
