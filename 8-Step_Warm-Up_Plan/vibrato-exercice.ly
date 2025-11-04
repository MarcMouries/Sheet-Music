\version "2.13"
\include "english.ly"

#(set-global-staff-size 24)

\score {
  \relative d''{
    \key d \major
    d4-3( cs-3) d( cs) d( cs) d( cs) 
    \bar ":|:"
    d8-3( cs-3 d cs)  d( cs d cs) d( cs d cs) d( cs d cs) 
\bar ":|:"
\break
     \set tupletSpannerDuration = #(ly:make-moment 1 4)
    \times 2/3 {d8-3( cs-3 d  cs d cs) } 
    \times 2/3 {d( cs d  cs d cs) } 
    \times 2/3 {d( cs d  cs d cs) } 
    \times 2/3 {d( cs d  cs d cs) }  
\bar ":|:"
    d16-3( cs-3) d( cs) d cs d cs 
    d16( cs) d( cs) d cs d cs 
    d16( cs) d( cs) d cs d cs 
    d16( cs) d( cs) d cs d cs 

 }
  \header {
    piece = "Vibrato"
  }
  \layout {
    indent = 0\in
  }
}