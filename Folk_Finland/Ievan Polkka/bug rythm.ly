\version "2.16"
\include "english.ly"

#(set-default-paper-size "letter")
#(set-global-staff-size 23)

%\layout { indent = 0.0\cm }
\paper {
  annotate-spacing = ##f
  %top-margin = 10
}

\header {
  title = "bug repeat "
  style = "finnish traditional"
}

melody = {
  \key a \major
  \time 2/4
  \relative c' {    
    r4. r16
    fs16
    \repeat volta 2
    {
      |  cs8 fs8 fs8.  gs16
      cs8 cs b a 
    }
    \alternative {
      { a8 fs16[ fs8.] r16 fs}
      { a8 fs16[ fs8.] r16 fs'}
    }
    r2
  
}
}

\score {
  \new Staff { \melody  }
}