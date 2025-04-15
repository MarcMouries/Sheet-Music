\version "2.19.53"
\language "english"
\header {
  title = "Blues Scale"
}

global = {
  \time 4/4
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1:m
  
}

C_m_blues =  \relative c' {

  c8  ef  f gf g bf 
  c8  ef  f gf g bf 
  c8  bf g gf f ef
  c8  bf g gf f ef
}



\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \C_m_blues }
  >>
  \layout { }
}

\score {
  <<
    \new ChordNames  \transpose c cs \chordNames
    \new Staff {     \transpose c cs \C_m_blues }
  >>
}
\score {
  <<
    \new ChordNames  \transpose c gs, \chordNames
    \new Staff {     \transpose c gs, \C_m_blues }
  >>
}
\score {
  <<
    \new ChordNames  \transpose c b  \chordNames
    \new Staff {     \transpose c b, \C_m_blues }
  >>
  \layout { }
}


C_Arpeggios =  \relative c' {
  bf4  d   f   f
  ef4  g   bf  bf
  f4   a   c   c
}

\score {
  <<
    \new ChordNames \transpose bf bf \chordNames
    \new Staff {     \transpose bf bf \C_Arpeggios }
  >>
  \layout { }
}
\score {
  <<
    \new ChordNames \transpose bf b \chordNames
    \new Staff {     \transpose bf b \C_Arpeggios }
  >>
  \layout { }
}
\score {
  <<
    \new ChordNames \transpose bf b \chordNames
    \new Staff {     \transpose bf b \C_Arpeggios }
  >>
  \layout { }
}