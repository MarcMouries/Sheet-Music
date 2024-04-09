\version "2.19.53"

\header {
  title = "Jerusulam Ridge"
  subtitle = "https://youtu.be/JWySDSagHGU"
  composer = "Kenny Baker"
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  a1:m

}

melody = \relative c' {
  \global
  a8 b c d e8 r8 e8\upbow( g)
  e\downbow d c e d c e c(
  a8 b) c\downbow d e g a  g(
  e d) c\downbow e  d  c( a g)
  
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
%  \midi { }
}
