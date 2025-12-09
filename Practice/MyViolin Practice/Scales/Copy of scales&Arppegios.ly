\version "2.10.33"

\header{
  title = "Scales"
  arranger = \markup { \small "arr. Marc Mouries" \teeny "marc@mouries.net"
  composer = "Marc Mouries"
  genre = "Exercise"
}

\include "../../../common/common-header.ily"
  instrument = "Violin"
  meter = "1) détaché 2) slurred 3) Staccato"
}

#(set-global-staff-size 22)

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
    piece = "G Major - 2 Octaves"
  }
  \layout{
  }
}

%%%%%%%%

\score {
  \relative{
    \key g \major

    g8   b    a    g   
	a    b    c    d 
	e    fis  g    a
    b    c    d-1  ^\markup { \small "III" } e
	fis  g    a    b
	c-1  ^\markup { \small "V" } d    e    fis 
	g-4  fis  e    d
	c    b-4 ^\markup { \small "I" }  a    g
	fis  e    d    c
	b    a    g    fis
	e   d     c    b
	a   g     b    a
  }
  \header {
    piece = "G Major Scale - 3 Octaves"
  }
  \layout{
  }
}

\score {
  \relative{
    \key g \major
	\time 6/8
    g8-0  ^\markup { \small "I"  }    b    d-0 
	g-1   ^\markup { \small "III"}    b    d-1
	g-1   ^\markup { \small "VI" }    b    d-1 
	g-4  d-1  b 
	g-1  d-1 ^\markup { \small "III" } b
	g  d  b | g1.
  }
  \header {
    piece = "G Major Arpegio- 3 Octaves"
  }
  \layout{
  }
}