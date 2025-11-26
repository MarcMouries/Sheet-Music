\version "2.24.4"
\language "english"

\header {
  title = "Io Ti Penso Amore"
  subtitle = "From the movie The Devil's Violinist (2013)"
  subsubtitle = "from the 2nd movement of Paganini 4th violin concerto"
  composer = "Niccolò Paganini"
  style = "classical"
  tagline = ""
}

global = {
  \time 6/8
  \key c \major
  \tempo 4=100
}

chordNames = \chordmode {
  \global
  c1
  
}

melody = \relative c'' {
  \global
  cs2 ~ cs8 fs, 
  e'2  ~ e8 d 
  cs4. cs4.
  r4. b8 b b 
  a4. fs4 fs8
  fs8 fs8 fs8   fs8 f8 fs8 
  
  \break
  a2.
  gs4. r4 cs8
  cs2 ~ cs8 fs, 
  g'2  ~ g8 fs 
  e4. d4.
  r4. cs8 b a
  a8 gs a16b cs8 fs,8 fs16 b16
  a4. gs4 r8
  r4. r4.  
  
}

words = \lyricmode {
  
  
}

\score {
  <<
    %\new ChordNames \chordNames
    \new Staff { \melody }
    %\addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
