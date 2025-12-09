\version "2.24.4"
\language "english"

\header {
  title = "Passacaglia - Double-stops"
  subtitle = "After Handel's Harpsichord Suite No. 7"
  composer = "Johan Halvorsen (1864-1935)"
  country = "Norway"
  genre = "Classical"
}

\include "../../common/common-header.ily"

\paper {
  ragged-right = ##f   % ← stretches staff to the right margin
  indent = 0
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
  <bf d>4. <bf d>8   <c  ef>4.  <bf d>8
  <a c>4.  <a  c>8   <bf d >4.  <a  c>8

  <g bf>4.  <g  bf>8   <a c >4.  <g  bf>8
  <fs a>4 d'4\open bf8.( a16 g4)
 
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



