\version "2.24.0"
\language "english"

\include "../../stylesheets/stylesheet_fiddle.ly"
\header {
  title = "Jerusalem Ridge"
  composer = "Bill Monroe"
  country = "USA"
  arranger = "As performed by Kenny Baker"
  style = "bluegrass"
  video = "https://youtu.be/JWySDSagHGU"
}

\include "../../common/common-header.ily"

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
