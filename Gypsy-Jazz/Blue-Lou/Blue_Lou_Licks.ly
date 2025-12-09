\version "2.19.22"
\language "english"

\header {
  title = "Blue Lou Lick"
  subtitle = \markup \small "transcribed by Marc"
  composer = "Stephane Grappelli"
  country = "France"
  genre = "Jazz"
  subgenre = "Gypsy Jazz"
}


melody = \relative c'' {
  c8 cs d f d cs! c a f4
  r4 as'8 g, a f d
  c b bf a2 r4
  a''8 g a g e ds d c4 a8 f d e f a4 \tuplet 3/2 {c8 b bf}
  r4 r4
\break
\mark "A"
  e,8 g b d c b a c e g f e d f g a c b a g8 ~g4
}

words = \lyricmode {


}

\score {

    \new Staff { \melody }

  \layout { }
  \midi { }
}
