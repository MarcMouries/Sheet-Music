\version "2.14.0"
\include "english.ly"

global= {
  \time 6/8
  \key d \major
}

violinOne = \new Voice \relative c'' {
  \set Staff.instrumentName = #"Violin 1"
  \set Staff.midiInstrument = "violin"
   a8.[  b16]  a8   fs4 r8   \bar "|."
}
 
\score {
  \new Staff << \global \violinOne >>
  \layout { }
  \midi { 
    \context {\Score tempoWholesPerMinute = #(ly:make-moment 40 4 ) } 
  }
}