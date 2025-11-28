\version "2.24.4"
\language "english"

\header {
  title = "Quizás, quizás, quizás"
  composer = "Osvaldo Farres"
  country = "Cuba"
}

global = {
  \time 4/4
  \key e \minor
  \tempo 4=100
}


chordNames = \chordmode {
  \global
  % PART A
  r1
  e:m        a2:m b2:7  e1:m  
  a2:m b2:7  e1:m    c2:9 b:9
  e1:m 
  % PART B
  e1:m  b1:7  b1:7   e1:6
  e1:6  b1:7  b1:7   e1:6
}

part_A = {r8 b,8 cs ds e fs
  g!4. e8 ~ e4 e4
  a2 \tuplet 3/2 {fs4 a fs }
  g4. e8 ~ e4 e4
  \break
  a2 \tuplet 3/2 {fs4 a fs }
  b4. g8 ~g4 b,4   
  g'4 r8 e8 fs4 r8 ds
  e1
}

melody = \relative c'' {
  \global
  
  % PART A
  \repeat volta 2 {
  r4   \part_A
  }

  
  \break
  % PART B
   r4 r8 b'8 e e e e
   ds4. a8 ~ a4 e'4   
   ds4. a8 ~ a4 ds4
   cs4. gs8 ~ gs2 ~
   \break
   gs4 r8 b8 e8 e e e
   ds4. a8 ~ a8 e'4 ds8
   ds4. a8 ~ a8 ds4 ds8
   cs4. gs8 ~ gs2 ~
   \break
   
   % PART A
   gs4   \part_A
}

words = \lyricmode {
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
