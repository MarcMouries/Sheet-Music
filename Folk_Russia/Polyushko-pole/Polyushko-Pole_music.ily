\version "2.19.7"
\language "english"

\header {
  title = "Polyushko-polye"
  subtitle = "Plaine, ma plaine (French) - The Cossack Patrol (English)"
  instrument = "Violin"
  composer = "Lev Knipper (1898-1974)"
  arranger = "Composed in 1934"
  country = "Russia"
  genre = "Folk"
}

global = {
  \time 4/4
  \tempo 4=100
}

chordNames = \chordmode {
  g1:m d1:m g1:m  d1
  ef1   d1  ef1    d1
}

melody = \relative d'' {
  \global
  \key g \minor
  bf2 g4 bf
  a2 f4  d
  bf'8 a g f g4 d'4
  a2 d,2
  \break
  g4 f8 ef d c d ef
  d4 a' fs d
  g4 f8 ef d c d ef
  d2 r16 d cs d e fs g a
}
