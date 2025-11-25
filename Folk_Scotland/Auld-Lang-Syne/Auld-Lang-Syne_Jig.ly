\version "2.24.4"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\header {
  title = "Auld Lang Syne"
  subtitle = "Jig arrangement in G major"
  composer = "Traditional Scottish"
  style = "jig"
  tagline = ""
}

global = {
  \time 4/4
  \key g \major
}

chordNames = \chordmode {
s4 
g1 d1 g1 c1 
g1 d1 g1 c1 
g1 d1 g1 c1 
g1 d1 g1 c1 
}

melody = \relative d' {
  \global
  \partial 4 d4^\p |

  g4. g8  g4 b |
  a4. g8  a4 b8(a) |
  g4. g8  b4 d |
  e2. e4 |
  \break
  d4. b8  b4 g |
  a4. g8  a4 b8(a) |
  g4.( e8)  e4( d) |
  g2. e'4 |
  \break
  d4.( b8)  b4( g)
  a4. g8  a4 e' |
  d4.( b8)  b4( d)
  e2. e4 |
  \break
  d4. b8  b4 g |
  a4. g8  a4 b8(a) |
  g4.( e8)  e4( d) |
  g2. r4
}

melody_jig = \relative d' {
  \time 6/8
    \partial 8 d8 |

    g4 g8 g4 b8
    a8 g8 g8  a4 b16 a
    g4 g8  b4 d8

    e4. ~ 4  g16  e
    \break
    d4 b8  b4 g8
    a8 g8 g8  a4 b16(a)
    g4 ( e8)  e4( d8)
    g4. ~ 4 e'8
    \break
    d4 b8   b4 g8
    a8 g8 g8  a4 e'8
    d4 b8   b4 d8
    e4. ~ e4 g16 e
    \break
    d4 b8   b4 g8
    a8 g8 g8  a4 b16(a)
    g4 ( e8)  e4( d8)
    g4. ~ g4 r8
  
}

  words = \lyricmode { }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % ORIGINAL VERSION — SCORE 1 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  % Big heading for the first version
  \markup {
    \vspace #1
    \fill-line { \fontsize #3 \bold "Original Version" }
  }

  \score {
    <<
      \new ChordNames { \chordNames }
      \new Staff { \melody }
      \addlyrics { \words }
    >>
    \layout { indent = 0 }
    \midi { \tempo 8 = 800 }
  }



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % JOYFUL VERSION — SCORE 2   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  % Big heading for the joyful version
  \markup {
    \vspace #2
    \fill-line { \fontsize #3 \bold "Auld Lang Syne (Jig)" }
  }

  \score {
    <<
      %\new ChordNames { \chordNames }
      \new Staff { \melody_jig }
      \addlyrics { \words }

    >>
    \layout { indent = 0 }
    \midi { \tempo 8 = 800 }
  }
