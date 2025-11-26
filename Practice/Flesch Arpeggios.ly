\version "2.19.15"
\language "english"
\header {
  title = "Flesch One-octave arpeggios 2"
  composer = "Marc Mouries"
  style = "practice exercise"
}
%{
           Page
E majeur =  89
A majeur =  99
D majeur = 109
G majeur = 119
%}
global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}


scale_E_major = \relative c'{
  e8_1 fs16( gs_1) a( b-1) cs( ds)
  e8 ds16-4( cs) b( a) gs( fs)

  \override TupletNumber.stencil = ##f

  \tuplet 3/2 {e8 g! ( b-1)}
  \tuplet 3/2 {e8 b ( g-3) }
  \tuplet 3/2 {e8 gs( b)}
  \tuplet 3/2 {e8 b ( gs-3)}
  \tuplet 3/2 {e8 gs (cs )}
  \tuplet 3/2 {e8 cs! (gs! )}
  \tuplet 3/2 {e8 a (cs! )}
  \tuplet 3/2 {e8 cs! (a )}
  \tuplet 3/2 {e8 a (c! )}
  \tuplet 3/2 {e8 c (a-4 )}
  e16 g! as cs e cs as g!
  e16 gs b d e d b gs  a2

}
\score {
  \new Staff { \scale_E_major }
  \layout { indent = 0}
}



scale_D_major = \relative c'{
  d8_1 e16( fs_1) g( a-1) b( cs)
  d8 cs16-4( b) a( g) fs( e)

  \override TupletNumber.stencil = ##f

  \tuplet 3/2 {d8 f! ( a-1)}
  \tuplet 3/2 {d8 a ( f-3) }
  \tuplet 3/2 {d8 fs( a)}
  \tuplet 3/2 {d8 a ( fs-3)}
  \tuplet 3/2 {d8 fs (b )}
  \tuplet 3/2 {d8 b! (fs! )}
  \tuplet 3/2 {d8 g (b! )}
  \tuplet 3/2 {d8 b! (g )}
  \tuplet 3/2 {d8 g (bf! )}
  \tuplet 3/2 {d8 bf (g-4 )}
  d16 f! gs b d b gs f!
  d16 fs a c d c a fs  g2

}
\score {
  \new Staff { \scale_D_major }
  \layout { indent = 0}
}


