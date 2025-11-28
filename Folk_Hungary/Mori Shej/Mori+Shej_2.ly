\version "2.19.32"
\include "../../stylesheets/stylesheet_fiddle.ly"
\header {
  title = "Mori Shej"
  subtitle = "Mori Shej, Szabina (My Daughter Sabina)"
  composer = "József Balogh (Kályi Jág)"
  country = "Hungary"
  style = "lullaby"
  origin = "Rom"
  tagline = ""
}
melody =  \relative c'' {
  \tempo 4 = 120
  \override Staff.TimeSignature.style = #'C
  \time 4/4 
  \key a \minor  
  \repeat volta 2 {
    
   a8. ^"Am" a16 a8  a4 a8    b4
   a8    g4 g8    a4 g4    
    e8 ^"C"   f   e4    e4. 
    d8    e8    f8  e4   e2
  }
  \break
  \repeat volta 2 {
    d2 ^"G"    d4. d8    
    e8    fis8    fis8
    g8   ~    g2 
    a8 ^"Am"  b8   ~    b8    a8   ~    a4
    g4
    e8    d8   ~    d8    c8   ~    c2
  \break  
    b8 ^"G"   c8    d c d c  d4      e4 ^"E7"   d8[    c8]
    e4    d8    c8   
    a4 ^"Am"   a4   ~    a2    \bar "|"   a2
    ~    a2
  }
}




\score{
  <<
    \context Staff="default"
    {
      \melody
    }

  >>
  \layout {
  }
  \midi {}
}