\version "2.19.19"
\language "english"

\header {
  title = ""
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=200
}

lick_A_chordNames = \chordmode {
  \global
  d1:7
}

lick_A_melody = \relative c' {
  
d8 ds( e) f( fs) a cs d 
\appoggiatura {f8} fs8 a \tuplet 3/2 {gs8( g fs)}
e d( cs) a 
b8 a r8 e2 r8
a,8 c(ef) fs( a) c ef fs
}


\score {
  <<
    \new ChordNames \lick_A_chordNames
    \new Staff { \lick_A_melody }
  >>
  \layout { }
 \midi {
  \context {
    \Score
    tempoWholesPerMinute = #(ly:make-moment 150 4)
  }
}
}

lick_B_chordNames = \chordmode {
  \global
   a1:m6  a1:m6   d1:7  g1:7
}
lick_B_melody = \relative c'' {
r2. r8 a'8~
a8 fs( \tuplet 3/2 { e c b} a) fs( d) f
~ f8 a b( d~) d b( a) fs( 
d8) a b g ~ g 
<d' d'\harmonic>8  <c g''\harmonic>
r8


}


\score {
  <<
    \new ChordNames \lick_B_chordNames
    \new Staff { \lick_B_melody }
  >>
  \layout { }
 \midi {
  \context {
    \Score
    tempoWholesPerMinute = #(ly:make-moment 150 4)
  }
}
}


