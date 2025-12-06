\version "2.19.15"
\language "english"
\include "../common/bars-per-line-engraver.ly"

\layout {
    \context {
      \Score
      %use the line below to insist on your layout
      %\override NonMusicalPaperColumn.line-break-permission = ##f
      \consists #(bars-per-line-engraver '(4))
    }
  }

\header {
  title = "Besame Mucho"
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  d2:m    g2:m6           d1:m           g2:sus   g2:m g1:m
  g2:m    fs2:dim    g2:m    a2:7   d2:m   a:7  d1:m
  d1:7               d2:7    d2:7   g:m    g2:m g1:m
  d1:m               e1:7.9-        g1:m   g1:m  
  g1:m  d:m a2:7  g:m6 d1:m 
  g1:m  d:m e2:7  bf:7 a:7 
}

melody = \relative c' {
  \clef treble
  \key f \major
  \time 4/4

  \repeat volta 2 {
    d4 d8 d d2~ |     d \tuplet 3/2{d4 e f  }
    a2 g~      |    g2. r4
    \tuplet 3/2{g4 g g  } \tuplet 3/2{a a a  }      | % 9
    \tuplet 3/2{bf bf bf} \tuplet 3/2{cs d e }      | % 10
    a,1~       |  a2. r4
    | d1~      |  d2 c4 bf  | a2 g~     |  g2. r4
    \tuplet 3/2{d'4 a f } \tuplet 3/2{a f d  }      | % 17
    \tuplet 3/2{f e d  } \tuplet 3/2{e d cs  }      | % 18
    d1~        |  d2. r4      |
    g  g8 g \tuplet 3/2{g4 f e }
    f4 f8 f \tuplet 3/2{f4 e d }
    e8 e4. e8. e16 f8. g16      |    a1
    g4 g8 g \tuplet 3/2{g4 f e  }      | % 25
    f4 f8 f \tuplet 3/2{f4 e d  }      | % 26
    \tuplet 3/2{e e e  } \tuplet 3/2{f f f  }  |
    e2. r4      |
    d d8 d d2~  |  d \tuplet 3/2{d4 e f  }
    | a2 g~       |  g2. r4
    | \tuplet 3/2{g4 g g  } \tuplet 3/2{a a a  }
    | \tuplet 3/2{bf bf bf} \tuplet 3/2{cs d e }
    | a,1~    | a2. r4
    | d1~     | d2 c4 a | a2  g~ | g2. r4      | % 40
    \tuplet 3/2{d'4 a f}      \tuplet 3/2{a f d }
    \tuplet 3/2{f4  e d}      \tuplet 3/2{e d cs}
  } % end of repeat except alternate endings
  \alternative
  {
    {    d2~ d4 r }
    {    d2~ d4 r }
  } %close alternatives
}% end of last bar


words = \lyricmode {
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff {    \melody }
    \addlyrics {    \words }
  >>
  \layout {}
    \midi { \tempo 4 = 120 }

}