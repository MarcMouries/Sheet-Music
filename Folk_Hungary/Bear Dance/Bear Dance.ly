\version "2.24.0"
\language "english"

\header {
  title = "Bear Dance"
  composer = "Traditional"
  country = "Hungary"
  genre = "Folk"
}

\include "../../common/common-header.ily"

#(set-global-staff-size 18)

global = {
  \time 4/4
  \key c \major
}

chordNames = \chordmode {
  \global
  
  d2:m a2:7 d2:m a2:7 
  d2:m a2:7 d2:m a2:7  
 %{    d1:m    d1:m   d1:m
  d1:m   d1:m    d1:m   d1:m
  d1:m   d1:m    d1:m   d1:m
  d1:m   d1:m    d1:m   d1:m
  d1:m   d1:m    d2:m g2:m  d1:m
 %}
}

melody = \relative c'' {
  \global
  \repeat volta 2 {
    \mark \default
  a'4 d8. d16 a8 a4 g8
  f8 f g8 g a2
  a4 d8. d16 a8 a4 g8
  f8 f e8 e d2
  \break
  g4 g8. g16 f8 f4 f8
  e8 e cs cs d2
  g4 g8. g16 f8 f4 f8
  e8 e cs cs d2
  }
\break
    \mark \default
  d8 e f d e f g4
  a8 a16( bf a8) g f e f d8
  d8 e f d e f g4
  a8 a16( bf a8) g f e d4
  \break
  f8 g a f g a bf4
  a8 a16( bf a8) g f e f d8
  f8 g a f g a bf4
  a8 a16( bf a8) g f e d4
  \break
    \repeat volta 2 {
    \mark \default

    r8 a'8 d d a a \tuplet 3/2  {bf16( c bf} a8) 
    r8 a8 d d a a \tuplet 3/2  {bf16( c bf} a8) 
    r8 a8-3 g8. a16 bf8 g f8. g16 
    a8 f e8 g  f  e d4
    }
  \break
      \mark "B'"

  f8 e d e f d g4
  a8 a16( bf a8) g f e f d8
  d8 e f d e f g4
  a8 a16( bf a8) g f e d4
 \break
  f8 g a f g a bf4
  a8 a16( bf a8) g f e f d8
  f8 g a f g a bf4
  a8 a16( bf a8) g f e d4
  \break
  \repeat volta 2 {
    \mark \default
    r8 a'8 a16 d c bf a d c bf a8 a8 
    r8 a8 a16 d c bf a d c bf a8 a8 
    r8 a8 g8. a16 bf8 g f8. g16 
    }
    \alternative {
    {  a8 f e8 g  f8  e d4}
    {  a'8 f a8-1 a b cs d4\fermata}
    }
    \bar "|."
}

\score {
  <<
   \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { \tempo 4 = 120}
}
