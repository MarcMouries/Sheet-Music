\version "2.14.0"
\include "english.ly"
% large staff
#(set-global-staff-size 22)

\paper{
  paper-width   = 20\cm
  top-margin    = 1.5\cm
  bottom-margin = 1.5\cm
}
\header {
  title = "Hatikvah (The Hope)"
  arranger = "Arr. Marc Mouries"
  tagline = ""
  subtitle = "Israel's National Anthem"
  composer = "Traditional"
}

global= {
    \time 2/4
    \key d \minor
  }
	 
violinOne = \new Voice { \relative d''{
   d8(  e)  f(  g) | a4  a    | bf8( a) bf( d)  | a2      | \break
   g4  g8 g    | f4  f    | e8  d e f   | d4. a8  | \break
   d8  e  f  g | a4  a    | bf8 a bf d  | a2      | \break
   g4  g8 g    | f4  f    | e8  d e f   | d2      | \break
   d4  d'      | d   d    | c8  d c bf  | a2      | \break
   d,4 d'      | d   d    | c8  d c bf  | a2      | \break
   g4  g8 g    | f4  f    | g8  a bf c  | a4 g8 f | \break    
   g4  g       | f4  f8 f | e8  d e f   | d2      | \break
   g4  g8 g    | f4  f    | g8  a bf c  | a4 g8 f | \break    
   g4  g       | f4  f8 f | e8  d e f   | d2      | \break
  \bar "|." }}
	 
	 
\score {
        \new StaffGroup <<
           \new Staff << \global \violinOne >>
        >>
          \layout {
    indent = 0\in
  }
     }
	