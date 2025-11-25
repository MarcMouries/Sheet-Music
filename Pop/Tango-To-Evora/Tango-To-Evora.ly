\version "2.19.83"
\language "english"

\header {
  title = "Tango To Evora"
  composer = "Loreena McKennitt"
  style = "tango"
  tagline = ""
}

global = {
  \time 4/4
  \key e \minor
  \tempo 4=100
}

chordNames = \chordmode {
  \global
}

melody = \relative c'' {
  \global
  \repeat volta 2 {
  b8 b b b c4 b4 
  r8 b b b e4 b4 
  a8 a a a b4 a4 
  r8 a a a b4 a4 
  \break
  g8 g g g a4 g4 
  r8 g g g a4 g4 
  fs8 fs fs fs g4 fs4 
  }
  \alternative {
    {   r8 fs fs fs g4 fs4    
        e1
        e1}
    {   r8 fs fs fs b2    
        b4. a8 g4 fs4 g1}
  }
 
  a8 a a a e'4 a4 
  r8 a, a a e'4. d16( c) 
  b8 b b b c4 b4 
  g8 g g g a4 g4 
  fs8 fs fs fs g4 fs4 
  r8 fs fs fs b2    
  b4. a8 g4 fs4 
  g1
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
