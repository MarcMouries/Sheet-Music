\version "2.24.4"

\header {
  title = "(On the) Sunny Side of the Street"
  composer = "Jimmy McHugh"
  country = "USA"
  genre = "Jazz"
}

\include "../../common/common-header.ily"


harmonies = \chordmode {
  \partial 4 { g4:7 }

  c1:6.9 | b2:m7 e:7 | f1:maj7 | b2:dim7 e:7 |
  a1:m7 | d:7 | d2:m7 g:7 | e4:m7 a:7 d:m7 g:7 |

  c1:6.9 | b2:m7 e:7 | f1:maj7 | b2:dim7 e:7 |
  a1:m7 | d:7 | d2:m7 g:7 | c1:6.9 |

  g1:m7 | c:7 | f2:maj7 c:7 | f4:6.9 f:7/c e:7/b es:7/bes |
  a1:m7 | d:7 | d:m7 | g2:sus4 g:7 |

  c1:6.9 | b2:m7 e:7 | f1:maj7 | b2:dim7 e:7 |
  a1:m7 | d:7 | d2:m7 g:7 | c1:6.9 |
}

melody = \relative c' {
  \key c \major
  \time 4/4
  \tempo 4 = 140


  \partial 4 { e8 d } \bar "||"

  c4 d e g | e'2. e8 es | d4 c a f | e2 d |
  \break
  c4 d e c' | b2. gis8 a | c4 a8 f r e d4 | g2. e8 d |
  \break

  c4 d e g | e'2. e8 es | d4 c a f | e2 d |
  \break
  c4 d e c' | b2. gis8 a | c4 a8 f r e d4 | c4 c' c c |
  \break

  c2 d,4 f | e2 c'4 c | c2 e,4 g | f2. c'4 |
  \break
  c2 e,4 g | fis2. a4 | b d r e, | f a r e8 d |
  \break


  c4 d e g | e'2. e8 es | d4 c a f | e2 d |
  \break
  c4 d e c' | b2. gis8 a | c4 a8 f r e d4 | c1 |
  \break
}

lyricsText = \lyricmode {
 % Aaa Bee Cee Dee
}


\score {
  <<
    \new ChordNames {    \harmonies     }
    %\new Voice = "melody" { \autoBeamOff \melody }
    \new Staff = "melody" \with { instrumentName = "Violin" } { \melody }
   
   % \new Lyrics \lyricsto "one" \lyricsText
  >>
  \layout { }
  \midi { \tempo 4 = 140 }
}




