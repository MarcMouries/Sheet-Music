\version "2.24.4"
\include "../../stylesheets/stylesheet_fiddle.ly"
\language "english"

\header {
  title = "Auld Lang Syne"
  subtitle = "in D major"
  composer = "Traditional Scottish"
  country = "Scotland"
  style = "air"
  tagline = ""
}

global = {
  \time 4/4
  \key d \major
}

chordNames = \chordmode {
 s1
d1 a1 d1 g
d1 a1 d1 g
d1 a1 d1 g
d1 a1 d1 g
}

melody_in_D = \relative d'' {
  \global
  r2. a4^\p |

  d4. d8  d4 fs |
   \appoggiatura {fs8 } e4.  d8  e4 fs8 ( \appoggiatura {g8 fs8 } e ) |
  d4. d8  fs4 a |
  \appoggiatura {a8 } b2. b4 |
  \break
  a4. fs8  \appoggiatura {fs8 a} fs4 d |
  e4. d8  e4 \appoggiatura {fs8 a} fs8 ( e ) |
  d4.( b8)  b4( \appoggiatura {d8 b8 }a4) |
  d2. b'4 |
  \break
  a4.( fs8)  \appoggiatura {fs8 a} fs4( d)
  e4. d8  e4 b' |
  a4.( fs8)  \appoggiatura {fs8 a} fs4( a)
  b2. b4 |
  \break
  a4. fs8  fs4 d |
  e4. d8  e4 \appoggiatura {fs8 a} fs8(e) |
  d4.( b8)  b4( a) |
  d2. r4
}



  words = \lyricmode { }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % ORIGINAL VERSION — SCORE 1 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  % Big heading for the first version
  \markup {
    \vspace #1
    \fill-line { \fontsize #3 \bold "Auld Lang Syne  (in D)" }
  }

  \score {
    <<
      \new ChordNames { \chordNames }
      \new Staff { \melody_in_D }
      \addlyrics { \words }
    >>
    \layout { indent = 0 }
    \midi { \tempo 8 = 800 }
  }




melody_in_D_ds = \relative d' {
  \global
  r2. <d a'>4 |

  <fs d'>4. d8  d4 fs |
   \appoggiatura {fs8 } e4.  d8  e4 fs8 ( \appoggiatura {g8 fs8 } e ) |
  d4. d8  fs4 a |
  \appoggiatura {a8 } b2. b4 |
  \break
  a4. fs8  \appoggiatura {fs8 a} fs4 d |
  e4. d8  e4 \appoggiatura {fs8 a} fs8 ( e ) |
  d4.( b8)  b4( \appoggiatura {d8 b8 }a4) |
  d2. b'4 |
  \break
  a4.( fs8)  \appoggiatura {fs8 a} fs4( d)
  e4. d8  e4 b' |
  a4.( fs8)  \appoggiatura {fs8 a} fs4( a)
  b2. b4 |
  \break
  a4. fs8  fs4 d |
  e4. d8  e4 \appoggiatura {fs8 a} fs8(e) |
  d4.( b8)  b4( a) |
  d2. r4
}



  words = \lyricmode { }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % ORIGINAL VERSION — SCORE 1 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  % Big heading for the first version
  \markup {
    \vspace #1
    \fill-line { \fontsize #3 \bold "Auld Lang Syne  (in D)" }
  }

  \score {
    <<
      \new ChordNames { \chordNames }
      \new Staff { \melody_in_D_ds }
      \addlyrics { \words }
    >>
    \layout { indent = 0 }
    \midi { \tempo 8 = 800 }
  }
