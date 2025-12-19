\version "2.19.32"
\language "english"
\header {
  title = "Sérénade"
  composer = "Mel Bonis (1858 – 1937)"
  country = "France"
  genre = "Classical"
}

global = {
  \time 4/4
  \key e \minor
  \tempo "Allegro" 4 = 108

}

chordNames = \chordmode {
  \global
  e1:m  c1 a1:m e1:m

}

melody = \relative c'' {
  \global
  \override DynamicText.self-alignment-X = #1
  \override DynamicLineSpanner.staff-padding = #3

%%{
  e4-4 (\mp \>     b4) \!   r8 g(\< fs e)\!
  d'4\> ( c )\! r8 e,_3^"III"(\< d c)\!
  b'4\> ( a )\! r8 c ( b a)
  g8 \<( fs_1 b a)  d8 ( c g' fs)\!
  ds4\p \> ( e) \! r2

  g  4 \>( e4)\! r8 b( \<a g)\!
  fs'4\> ( e) \! r8 b( a g)
  fs8_1\<( g fs b\! as\> d cs fs)\!
  fs4 r4 r2
  c4(\> a4)\! r8 fs( g a)
  \break
  
 % %}
  b8( a b c cs d e fs) \breathe
  g4 fs e d8 e
  d4 c b fs8 b
  a4 e8 g fs2 ~
  fs2 r2
  \compressMMRests
  \override Staff.MultiMeasureRest.space-increment = 1.0
  R1*2


}


\score {
  <<
   % \new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}
