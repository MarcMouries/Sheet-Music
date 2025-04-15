
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\header{
  title = "Gammes de La bémol"
  subtitle = " "
}


% -------------------------------------------------------------------------

\markup \vspace #2

\markup {\huge "Gammes les plus courantes:"}

\markup \vspace #1


% -------------------------------------------------------------------------
% Some usual scales
% -------------------------------------------------------------------------


aesMajor = {
  \new Staff {
    \clef treble
    \key aes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c aes 
    \relative c' {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

aesNaturalMinor = {
  \new Staff {
    \clef treble
    \key aes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c aes 
    \relative c' {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

aesHarmonicMinor = {
  \new Staff {
    \clef treble
    \key aes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c aes 
    \relative c' {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

aesMelodicMinor = {
  \new Staff {
    \clef treble
    \key aes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c aes 
    \relative c' {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

aesDorianMinor = {
  \new Staff {
    \clef treble
    \key aes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c aes 
    \relative c' {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

aesPhrygianMinor = {
  \new Staff {
    \clef treble
    \key aes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c aes 
    \relative c' {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

aesBlues = {
  \new Staff {
    \clef treble
    \key aes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c aes 
    \relative c' {
      \CBluesScale
    }
  }
}


% -------------------------------------------------------------------------

aesGypsyMinor = {
  \new Staff {
    \clef treble
    \key aes \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c aes 
    \relative c' {
      \CGypsyScale
    }
  }
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


aesIonian = {
  \new Staff {
    \clef treble
    \key aes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c aes 
    \relative c' {
      \CIonianScale
    }
  }
}


aesDorian = {
  \new Staff {
    \clef treble
    \key aes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d aes 
    \relative c' {
      \DDorianScale
    }
  }
}


aesPhrygian = {
  \new Staff {
    \clef treble
    \key aes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e aes 
    \relative c' {
      \EPhrygianScale
    }
  }
}


aesLydian = {
  \new Staff {
    \clef treble
    \key aes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f aes 
    \relative c' {
      \FLydianScale
    }
  }
}


aesMixolydian = {
  \new Staff {
    \clef treble
    \key aes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, aes 
    \relative c' {
      \GMixolydianScale
    }
  }
}


aesEolian = {
  \new Staff {
    \clef treble
    \key aes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, aes 
    \relative c' {
      \AEolianScale
    }
  }
}


aesLocrian = {
  \new Staff {
    \clef treble
    \key aes \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, aes 
    \relative c' {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\score {
  \aesMajor
}

\score {
  \aesNaturalMinor
}

\score {
  \aesHarmonicMinor
}

\score {
  \aesMelodicMinor
}

\score {
  \aesBlues
}

\score {
  \aesGypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


% -------------------------------------------------------------------------

\score {
  \aesIonian
}

\score {
  \aesDorian
}

\score {
  \aesPhrygian
}

\score {
  \aesLydian
}

\score {
  \aesMixolydian
}

\score {
  \aesEolian
}

\score {
  \aesLocrian
}


% -------------------------------------------------------------------------


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
