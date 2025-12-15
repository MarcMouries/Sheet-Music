\version "2.19.15"
\language "english"

\header {
  title = "Tsiganisky"
  instrument = "Violin"
  composer = "Traditional Russian"
  country = "Russia"
  genre = "Folk"
}

global = {
  \time 4/4
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  g1:m g1:m g1:m g1:m
}

melody = \relative bf' {
  \global
  \key g \minor
  \partial 8*3
  g'8 g g g4 ef8 c8 ~ c8
  g'8 g g g4 d8 bf8 ~ bf8
  g'8 g g g4 fs8 g a g f ef
  d1
}
