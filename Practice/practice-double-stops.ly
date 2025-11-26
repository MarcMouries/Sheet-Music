\version "2.24.1"
\language "english"
\header {
  title = "Practice Double Stops"
  subtitle = "https://youtube.com/shorts/QYJfU_ZCEq0"
  composer = "Marc Mouries"
  style = "practice exercise"
}

global = {
  \time 4/4
  \key c \major
}

chordNames = \chordmode {
  \global


}

melody = \relative c' {
  \global
  
  <d fs>
  <d fs ~>
  ( 
  <cs fs> <cs e >
  )

  <cs~  e >
  ( 
  <cs fs> <d fs >
  )

  < d   fs >(

  < e   g >)
  < e ~  g > (
  < e   a >
  < fs  a >)
\break

  << g   b  >>
  << g   b  >>
  << g   cs >>
  << a   cs >>
  
  << a   cs >>
  << a   cs >>
  << b   d  >>
  << b   d  >>
  
  << b   e  >>
  << cs  e  >>



}



\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
