\version "2.24.4"
\language "english"

\header {
  title = "Enclosure Scale — F major"
  tagline = ""
}

global = { \time 4/4 }

\paper {
  indent = 0
}


\markup \column {
  \vspace #1
  \bold \larger "Exercise: Diatonic–Chromatic Enclosures (F major)"
  \line { "For each scale degree: play diatonic step above (in key), target note, half-step below (chromatic), back to target." }
  \line { "Stay relaxed, keep even eighths, and listen for clean intonation on the chromatic lower neighbors." }
  \vspace #0.5
}

enclosure_scale_F_major = \relative c'' {
  \global \key f \major
  % going up
  g8   f   e   f   
  bf8  a   gs  a   
  d8   c   b   c    
  g'8  f   e   f
  bf8  a   gs  a
  % going down
  g8   f   e   f   
  d8   c   b   c    
  bf8  a   gs  a   
  g8   f   e   f   
  f2
}

\score {
  \new Staff {
    \enclosure_scale_F_major
  }
  \layout { }
}
