\version "2.19.37"
\language "english"

\header {
  title = "Passacaglia"
  subtitle = "After Handel's Harpsichord Suite No. 7 - Arpeggios"
  composer = "Johan Halvorsen (1864-1935)"
  country = "Norway"
  style = "passacaglia"
  tagline = ""
}

\markup \vspace #1


\book { 
\bookOutputSuffix "C" 
   \score { 
     %first arpeggio 
     \relative c' { c e g c } 
     \midi { } 
   } 
} 

\book { 
   \bookOutputSuffix "D" 
   \score { 
     %second arpeggio 
     \relative c' { d fs a d } 
     \midi { } 
   } 
} 


chordNames = \chordmode {
  g1:m  f1  ef1 d2 g2:m  
}

melodyA = \relative c'' {
  bf8  d   g   f   ef  d   c   bf 
  a8   c   f   ef  d   c   bf  a
  g8   bf  ef  d   c   bf  a   g
  fs8  a   d   c   bf  a   g4      
}


\score { 
  <<
    \new ChordNames {\chordNames}
    \new Staff      { \melodyA   }
  >>
}
\score { 
  <<
    \new ChordNames {\transpose g fs \chordNames}
    \new Staff      {\transpose g fs \melodyA   }
  >>
}
\score { 
  <<
    \new ChordNames {\transpose g e \chordNames}
    \new Staff      {\transpose g e \melodyA   }
  >>
}
\score { 
  <<
    \new ChordNames {\transpose g d \chordNames}
    \new Staff      {\transpose g d \melodyA   }
  >>
}
\score { 
  <<
    \new ChordNames {\transpose g c \chordNames}
    \new Staff      {\transpose g c \melodyA  }
  >>
}
\score { 
  <<
    \new ChordNames {\transpose g b \chordNames}
    \new Staff      {\transpose g b, \melodyA   }
  >>
}
\score { 
  <<
    \new ChordNames {\transpose g a \chordNames}
    \new Staff      {\transpose g a, \melodyA   }
  >>
}
\score { 
  <<
    \new ChordNames {\transpose g f \chordNames}
    \new Staff      {\transpose g f \melodyA   }
  >>
}