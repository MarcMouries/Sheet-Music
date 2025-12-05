\version "2.19.11"
\include "english.ly"

\paper{ #(define fonts
           (make-pango-font-tree
            "Arial"
            "Arial"
            "Arial" (/ 18 20))) }

  \layout {
    \override Lyrics.LyricText.font-size = #-1
  }

global = {
  \time 4/4
  \tempo 4=100
}

chordNames = \chordmode {
 % \frenchChords
  \global
  s4.
  d2:m a:7
  d1:m d:7
  g:m a2
  a:7 d1:m
  a:7
  s2 d8:m
}

melody = \relative c'' {
  \global
    \key d \minor

  \partial 4. a8 d f
  a2 f4. e8 e d4. r8 d f a
   d2 bf4. bf8
   a g4. r8 g a bf
   a4. (e8) a4. g8 g
   f4. r8 e f g a4 a a a a8. g16 f8 e d
  \bar "|."
}

words = \lyricmode {
HE -- VE -- NU SHA -- LOM A -- LEI -- CHEM,
HE -- VE -- NU SHA -- LOM A -- LEI -- CHEM,
HE -- VE -- NU SHA -- LOM A -- LEI -- CHEM,
HE -- VE -- NU SHA -- LOM, SHA -- LOM, SHA -- LOM, A -- LEI -- CHEM,
}
