\version "2.10.33"

\header{
  title = "Scales"
  arranger = \markup { \small "arr. Paul Makepeace" \teeny "http://paulm.com/music" }
  instrument = "Violin"
  meter = "1) détaché 2) slurred 3) Staccato"
}

#(set-global-staff-size 20)

\score {
  \relative{
    \key d \major
    d8 e8 fis8 g8 a8 b8 cis8 d8 d8 cis8 b8 a8 g4 fis8 e8 d8
  }
  \header {
    piece = "D Major"
  }
}

\score {
  \relative a' {
    \key a \major
    a8 b8 cis8 d8 e8 fis8 gis8 a8 a8 gis fis8 e8 d8 cis8 b a 
    \bar ":|:"
    \times 2/3 {a8 cis8 e8} 
    \times 2/3 {a8 e8 cis8} a2 \bar ":|"
  }
  \header {
    piece = "A Major"
  }
}

\score {
  \relative{
    \key g \major
    g8 a8 b8 c8 d8 e8 fis8 g8 a8 b8 c8 d8 e8 fis8 g4
    g8 fis8 e8 d8 c8 b8 a8 
    g8 fis8 e8 d8 c8 b8 a8 g4
    \break
    \times 2/3 { g8 b8 d8 }  \times 2/3 { g8 b8 d8 }
    \times 2/3 { g8 d8 b8 }  \times 2/3 { g8 d8 b8 } 
    
    \times 2/3 { g8 b8 d8 }  \times 2/3 { g8 b8 d8 }
    \times 2/3 { g8 d8 b8 }  \times 2/3 { g8 d8 b8 } 
    g1
  }
  \header {
    piece = "G Major"
  }
  \layout{
  }
}

