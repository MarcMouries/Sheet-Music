\version "2.19.35"
\language "english"
\header {
  title = "Violin licks from Stephane Grappelli"
  country = "France"
  genre = "Jazz"

  subgenre = "Gypsy Jazz"
}

global = {
  \time 4/4
}

lick_ThemThereEyes_Chords = \chordmode {
  \global
  g1

}

lick_ThemThereEyes_Melody = \relative c'' {
  \key c \major
  d4  \tuplet 3/2 { c8( d c)} b8 g e d 
  b' g a g8 ~ g4
}

\markup "Them There Eyes with Oscar Peterson"
\score {
  <<
    \new ChordNames {\lick_ThemThereEyes_Chords  }
    \new Staff      { \lick_ThemThereEyes_Melody }
  >>
  \layout { }
}


\markup "Sweet Georgia Brown"
lick_SweetGeorgiaBrown_Chords = \chordmode {

}
lick_SweetGeorgiaBrown_Melody = \relative c'' {
  \key c \major
  a'4. f8( gs) g( f) e 
  g f( e) d( c)   bf a  d\upbow( 
  a) g( f) d g_"/" d g_"/" f8 ~f4
}

\score {
  <<
    \new ChordNames {\lick_SweetGeorgiaBrown_Chords  }
    \new Staff      {\lick_SweetGeorgiaBrown_Melody }
  >>
  \layout { }
}
