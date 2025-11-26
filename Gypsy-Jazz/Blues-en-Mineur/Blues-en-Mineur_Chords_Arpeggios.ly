\version "2.19.53"
\language "english"
\include "../common/bars-per-line-engraver.ly"




%% https://www.youtube.com/watch?v=EfnYL_lGSP0

\header {
  title = "Blues en Mineur"
  subtitle = "Chords & Arpgeggios"
  style = "gypsy jazz"
}


global = {
  \time 4/4
  \key c \major
}

chordNames = \chordmode {
  \global
  g1:m g:m g:m g:m 
  c1:m c:m g:m g:m 
  d1:7 d:7 g:m g:m 
}


melody_ = \relative c'' {
  \global
  
  g,4 bf d e 
  g4 bf d e 
  g4 bf g d  
   g4 bf d e 

  c,, ef g a
  c ef g a
  g4 d bf g  
  g4 d bf g  

  a c d fs 
  a c d fs 
  
  g4 d bf g
  bf g d bf
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff {    \melody }
  >>
\layout {
    \context {
      \Score
      %use the line below to insist on your layout
      %\override NonMusicalPaperColumn.line-break-permission = ##f
      \consists #(bars-per-line-engraver '(4))
    }
    indent = 0
  }
}