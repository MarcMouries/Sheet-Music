\version "2.24.0"
\language "english"

global = {
  \time 2/4
  \tempo 4=100
}

\header {
  title = "Down To The River To Pray"
  composer = "Traditional American"
  country = "USA"
  genre = "Folk"
  style = "spiritual"
}

chordNames = \chordmode {
  \global
  \key e \major
  b1
}

melody = \relative c'' {
  \global
  \key e \major
  \partial 8 b8
  b4 cs e4 e8 e
  e e e4 e2
  fs8 fs fs gs
  \break

fs4 e gs fs8( e) e4
  cs8 (b8)

  \break
  b4 gs
  b4. cs8
  e4 cs e gs
  \break
  fs2
  e8 e4 cs8 b2 r2
  \break
   fs'2 fs4 e4 gs4 b
   fs8 (e4.)
\break
   gs4 b  fs8 (e4.)
   e8 e4. cs8( b4.)
\break
   fs'2 fs4 e4 gs4 b
   fs8 (e4.)
   \break

   gs4 fs8 e e e cs4 b2


}

words = \lyricmode {
  As I went down in the ri -- ver to pray,
Stud -- y -- in' a -- bout that good old __ way
And __ who shall wear the star -- ry crown
Good Lord, show me the way
O sis -- ters let's go down__
Let's go down, come on down
O sis -- ters let's go down
Down in the riv -- er to pray

}
