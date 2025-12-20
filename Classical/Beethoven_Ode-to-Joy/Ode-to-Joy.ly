\version "2.24.0"
\language "english"

#(set-global-staff-size 22)

\header {
  title = "Ode to Joy"
  subtitle = "Ninth Symphony Theme"
  composer_OLD = "L. V. Beethoven (1770–1827)"
  country = "Germany"
  composer =  "Ludwig van Beethoven"
  style = "Hymn"
}

\include "../../common/common-header.ily"

global = {
  \time 4/4
  \key a \major
  %	\skip 1*16
  \bar "|."
}

sop =  \relative c''{
  | cs4 cs d e 
  | e d cs b
  | a a b cs
  | cs4. b8 b2 
  \break
  | cs4 cs d e
  | e d cs b
  | a a b cs
  | b4. a8 a2 
  \break
  b4 b cs a
  | b  cs8[( d]) cs4 a
  | b  cs8[( d]) cs4 b
  | a b e2
  \break
  | cs4 cs d e
  | e d cs b
  | a a b cs
  | b4. a8 a2
  
}

alto =  \transpose d, d{
  a,4 a, b, a, | a,4. b,8 a,4 gs, | e, e, gs, a,| a,4. gs,8 gs,2 |
  a,4 a, b, a, | a,4. b,8 a,4 gs, | e, e, gs, a,| a,4 gs, e,2 |
  e,4 e, e, e, | e, e, e, e, | e, e, gs, gs, | fs, ds, e,2 |
  e,4 a, b, b, cs  a,8[( b,]) a,4 fs, | fs, e, gs, a, |a, gs, a,2 |
}



\score{
  \new StaffGroup
  \relative c' <<
    \new Staff { \global \sop}
    %\new Staff { \global \alto }
  >>
  \layout {
    indent = 0.0\mm
  }
  \midi {  \tempo 4=100}
}