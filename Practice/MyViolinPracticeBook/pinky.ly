\version "2.19.4"
\language "english"

\header {
  title = "4th Finger Exercises"
  composer = "Marc Mouries"
  genre = "Exercise"
}

global = {
  \time 4/4
  \key c \major
 % \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1
  
}

\markup { EXERCISE I (fast pinky use) }
\markup \vspace #0.2
\markup {
  \justify {
     Play a scale in perfect fourths (A-D, B-E, C\sharp - F\sharp, etc) in repeated pairs of notes. 
The bottom note (A, B, C\sharp etc) are double-dotted eighth. The top note (D, E, F\sharp, etc) should be the fastest 32nd imaginable.
  }
}
melody = \relative c'' {
  \global
  a,8.. d32 b8.. e32 cs8.. fs32
  
}





\score {
  <<
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}


\markup { EXERCISE II (harmonics transitioning into scale in fourths) }
\markup \vspace #0.2

exerciseTwo = \relative c'' {
  \global
  
     a,4  <a d\harmonic>4
     b4  <b e\harmonic>4
     c4  <c f\harmonic>4
     d4  <d g\harmonic>4

  
}
\score {
  <<
    \new Staff {\exerciseTwo }
  >>
  \layout { }
  \midi { }
}