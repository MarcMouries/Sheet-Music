\include "english.ly"
\version "2.14.0"

#(set-global-staff-size 22)
\paper {
 indent = 0 \cm
}
\header {
    title = "The Butterfly"
    composer = "Tommy Potts"
    enteredBy = "Marc"
  video = ""
}

melody =  {
  \time 9/8
  \key e \minor
  \relative c'' {
	| b4\downbow  e,8( g4) e8( fs4.)
	| b4          e,8( g4) e8( fs8 ) e d
	| b4\downbow  e,8( g4) e8( fs4.)
	| b4(         d8) d4 b8\upbow( a) fs8 d
	|
  }
}
\score {
    \melody
}
  
  