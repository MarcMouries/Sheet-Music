\version "2.24.0"
\language "english"

\header {
  title = "As Time Goes By"
  composer = "Herman Hupfeld"
  video = ""
  style = "jazz"
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1
  
}

melody = \relative c'' {
  \global
  r8 fs8 c4 d e f
  
}

words = \lyricmode {
  
  
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
