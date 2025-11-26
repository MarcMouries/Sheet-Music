
% -------------------------------------------------------------------------

\include "../CommonSettings.ly"


% -------------------------------------------------------------------------

\header{
  title = "Gammes de __FRENCH_PITCH_NAME__"
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


__PITCH_FILENAME_FRAGMENT__Major = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Majeur"
    \transpose c __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \CMajorScale
    }
  }
}


% -------------------------------------------------------------------------

__PITCH_FILENAME_FRAGMENT__NaturalMinor = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur naturel (sans sensible)"
    \transpose c __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \CNaturalMinorScale
    }
  }
}


% -------------------------------------------------------------------------

__PITCH_FILENAME_FRAGMENT__HarmonicMinor = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur harmonique"
    \transpose c __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \CHarmonicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

__PITCH_FILENAME_FRAGMENT__MelodicMinor = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur mélodique"
    \transpose c __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \CMelodicMinorScale
    }
  }
}


% -------------------------------------------------------------------------

__PITCH_FILENAME_FRAGMENT__DorianMinor = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur dorien"
    \transpose c __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \CDorianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

__PITCH_FILENAME_FRAGMENT__PhrygianMinor = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur phrygien"
    \transpose c __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \CPhrygianMinorScale
    }
  }
}


% -------------------------------------------------------------------------

__PITCH_FILENAME_FRAGMENT__Blues = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Blues"
    \transpose c __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \CBluesScale
    }
  }
}


% -------------------------------------------------------------------------

__PITCH_FILENAME_FRAGMENT__GypsyMinor = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \minor
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mineur tsigane"
    \transpose c __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \CGypsyScale
    }
  }
}


% -------------------------------------------------------------------------
% The so-called "greek" modes, built from the white keys of the piano
% -------------------------------------------------------------------------


__PITCH_FILENAME_FRAGMENT__Ionian = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Ionien (majeur)"
    \transpose c __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \CIonianScale
    }
  }
}


__PITCH_FILENAME_FRAGMENT__Dorian = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Dorien"
    \transpose d __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \DDorianScale
    }
  }
}


__PITCH_FILENAME_FRAGMENT__Phrygian = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Phrygien"
    \transpose e __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \EPhrygianScale
    }
  }
}


__PITCH_FILENAME_FRAGMENT__Lydian = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Lydien"
    \transpose f __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \FLydianScale
    }
  }
}


__PITCH_FILENAME_FRAGMENT__Mixolydian = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Mixolydien (majeur sans sensible)"
    \transpose g, __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \GMixolydianScale
    }
  }
}


__PITCH_FILENAME_FRAGMENT__Eolian = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Eolien (mineur naturel, sans sensible)"
    \transpose a, __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \AEolianScale
    }
  }
}


__PITCH_FILENAME_FRAGMENT__Locrian = {
  \new Staff {
    \clef treble
    \key __LILY_PITCH__ \major
    \myStaffAndTimeSettings
    \myTempoMark #2.0 #"Locrien"
    \transpose b, __LILY_PITCH__ 
    \relative __TREBLE_REF__ {
      \BLocrianScale
    }
  }
}


% -------------------------------------------------------------------------

\score {
  \__PITCH_FILENAME_FRAGMENT__Major
}

\score {
  \__PITCH_FILENAME_FRAGMENT__NaturalMinor
}

\score {
  \__PITCH_FILENAME_FRAGMENT__HarmonicMinor
}

\score {
  \__PITCH_FILENAME_FRAGMENT__MelodicMinor
}

\score {
  \__PITCH_FILENAME_FRAGMENT__Blues
}

\score {
  \__PITCH_FILENAME_FRAGMENT__GypsyMinor
}


% -------------------------------------------------------------------------

\markup \vspace #2

\pageBreak

\markup \vspace #2

\markup {\huge "Modes dit \"grecs\":"}

\markup \vspace #1


% -------------------------------------------------------------------------

\score {
  \__PITCH_FILENAME_FRAGMENT__Ionian
}

\score {
  \__PITCH_FILENAME_FRAGMENT__Dorian
}

\score {
  \__PITCH_FILENAME_FRAGMENT__Phrygian
}

\score {
  \__PITCH_FILENAME_FRAGMENT__Lydian
}

\score {
  \__PITCH_FILENAME_FRAGMENT__Mixolydian
}

\score {
  \__PITCH_FILENAME_FRAGMENT__Eolian
}

\score {
  \__PITCH_FILENAME_FRAGMENT__Locrian
}


% -------------------------------------------------------------------------


\markup \vspace #2
\markup {J. Menu - Crissier, le 18/08/2013}
