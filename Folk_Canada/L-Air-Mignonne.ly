\version "2.24.4"
\language "english"

\header {
  title = "L'Air Mignonne"
  subtitle = "barndance"
  composer = "Simon Riopel"
}

\layout {   indent =  0}


global = {
  \key a \major
  \time 4/4
}
melody = \relative a' {
  \global
  \partial 4. e8 a b |

  % A part
  \repeat volta 2 {
    cs4. e8 cs8 b a b |
    cs4. e8 cs8 b a b |
    fs4. a8 e4. cs'8  |
  }
  \alternative {
    { b8 a gs a b e, a b | }
    { b8 a gs b a b cs e | }
  }

  % B part
  \repeat volta 2 {
    fs4. a8 fs8 e8 cs8 e8
    fs4. a8 fs8 e8 cs8 a8 
    fs4. a8 e4. cs'8 |
  }
  \alternative {
    { b8 a gs a b <a e>  cs e  }
    { b8 a gs b  a2  }
  }
  \fine
}




ChordNames = \chordmode {
  \global

  \partial 4. s4. |

    % A part
  \repeat volta 2 {
    a1 |
    a1 |
    fs2:m e2  |
  }
  \alternative {
    { e1 | }
    { e1 | }
  }

  % B part
  \repeat volta 2 {
    fs1:m
    fs1:m
    fs1:m 
  }
  \alternative {
    { a1  }
    { e2 a2  }
  }
  
}

\score {
  <<
    \new ChordNames { \ChordNames }
    \new Staff { \melody }
  >>
}
