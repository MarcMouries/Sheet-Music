\version "2.19.1"
\language "english"
\header {
  title = "Symphony No.40 in G minor, K.550"
  composer = "Mozart, Wolfgang Amadeus"
}


Mozart_Symphony_No_Forty_in_G_minor = \relative c'' {
    \time 4/4
  \key bf \major
  r2 r4 ef8-4( d) 
  d4 ef8( d) 
  d4 ef8( d) 
  d4(  bf'4) r4 
  bf8( a) 
  g4 g8( f) 
  ef4 ef8( d) 
  c4(  c4) r4 d8 c 
  c4 d8 c c4 d8 c 
  \break
  c4( a'4) r4 a8 g
  fs4 fs8 ef d4 d8 c 
  bf4 bf r4 bf'8 a
  a4( c fs, a)
  g4 bf a8 g f ef
  d1 cs1 d1
  
}

\score {
    \new Staff { \Mozart_Symphony_No_Forty_in_G_minor }
  \layout { }  
  \header { piece = "Romanze" }
}