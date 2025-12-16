\version "2.19.54"
\language "english"

\header {
  title = "Brandenburg Concerto No. 3"
  composer = "Johann Sebastian Bach"
  country = "Germany"
  opus = "BWV 1048"
  genre = "Classical"
  difficulty = "Level 3-4 - Intermediate"
}

\include "../common/common-header.ily"

Bach_Brandenburg_Concerto_Three  =  \relative c'' {
 \clef treble
 \key g \major
 \time 2/2

   \set beamExceptions = #'((end . (((1 . 8) . (2 2 2 2)))))

 \partial 4 
 \slurDotted
 g8 fs |
 g4 d8_4 c d4 g8 fs g4 b,8 a b4 g'8 fs |		%1
 g4 g,8 a b4( cs) d8-( cs d-) e d fs d g |
 \break
 d-( cs d-) e d a' d, b' d,-( cs d-) e d c'! d, d' |
 b4 a8 g a4 g8 fs g4 fs8 e d g d g |
 \break
 e4 d8 c b g' b, g' c,4 
 b8( a) g g' a, g' |		%5
 b, g' cs, g' d fs d g d a' d, b' d, c'! d, d' |
 b4 a8 g d4 fs g fs8 e d c b a |
 b4 a8 g d'4 d g,2  
 r2
}

% Only include score block when compiling standalone (not as part of a book)
#(if (not (defined? 'compilingBook))
  #{
    \score {
      \new Staff { \Bach_Brandenburg_Concerto_Three }
      \layout { }
      \header { piece = "Bach Brandenburg Concerto Three" }
    }
  #})