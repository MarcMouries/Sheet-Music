\version "2.19.15"

\header {
  title = "The Gift Of Falling"
  subtitle = "from The Celtic Fiddle of Liz Knowles"
  composer = "Liz Knowles"
  country = "Ireland"
  style = "slow air"
  subsubtitle = "transcribed by Marc"
  tagline = ""
}

global = {
  \time 4/4
  \key c \major
}

chordNames = \chordmode {
  \global

}

melody = \relative c'' {
  \global
  %\partial 4
  a8\upbow ( b ) c4. c8 c b
  g4. g8 e d e4 e8 d e g g4. g8(
\break
  a8\upbow  b ) c4. d8 c b
  g4. g8 e d e4 e8 d e g a4

}

words = \lyricmode {


}

\score {
  <<
%    \new ChordNames \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout {indent=0 }
  \midi { }
}
