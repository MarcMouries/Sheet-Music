\version "2.19.25"
\language "english"

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

FurElise = \relative c'' {
   \time 3/8
 \partial 8 e16\pp^\markup { \bold "Poco moto." } ds e ds e b d c a8 r16 c, e a b8 r16 e, gs b
 c8 r16 e, e' ds e ds e b d c a8 r16 c, e a b8 r16 e, c' b  a4
}

chordNames = \chordmode {
   \time 3/8
  \partial 8 s8 
  e4.:7   a4.:m  e4.:7
 
}

%{
\markup "Fur Elise"
\score {
    \new Staff { \FurElise }
  \layout { indent = 0}
}
\markup "Fur Elise"
\score {
    \new Staff { \transpose e e, \FurElise }
  \layout { indent = 0}
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \transpose e a \FurElise }
  >>
  \layout { indent = 0}
}
\score {
    \new Staff { \transpose e g \FurElise }
  \layout { indent = 0}
}
\score {
    \new Staff { \transpose e f \FurElise }
  \layout { indent = 0}
}


\score {
    \new Staff { \transpose e d \FurElise }
  \layout { indent = 0}
}
\score {
    \new Staff { \transpose e c \FurElise }
  \layout { indent = 0}
}

%}