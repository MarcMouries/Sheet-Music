\version "2.24.4"
\language "english"

\header {
  title = "hedgehog video music"
  subtitle = "https://www.youtube.com/shorts/mRy9mGiiDVo"
}

global = {
  \time 4/4
  \key d \minor
    \tempo 4=100
}

chordNames = \chordmode {
  \global
  d:m
  
}

melody = \relative c'' {
  \global
  f4 d a f 
  d1
  f'4 c a g2  a8 bf a2
  \break
  f'4 d a f 
  d1
  f'4 d f g4 ~ g4. f8 e2
  \break
  f4 d a f 
  d1
  f'4 c a g2  a8 bf a2
    \break
f'4 d a f 
  d1
  a'2 r4 r4 
  r1
}



\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}

\score {
  <<
    \new ChordNames \transpose d a, \chordNames
    \new Staff { \transpose d a, \melody }
  >>
  \layout { }
  \midi { }
}