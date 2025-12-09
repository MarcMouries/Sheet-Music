\version "2.19.14"
\language "english"

\header {
  title = "Greensleeves Jig"
  composer = "Traditional"
  country = "England"
    genre = "Folk"

    subgenre = "Irish"
}

\include "../../common/common-header.ily"

% ---- GLOBAL SETTINGS ----
globalGm = {
  \time 6/8
  \key g \minor
  \tempo 4=120
}

globalAm = {
  \time 6/8
  \key a \minor
  \tempo 4=120
}

% ---- CHORDS ----
ChordsInGm = \chordmode {
  \globalGm
  \partial 8 s8
  g2.:m  f2.  g2.:m     d2.:m
  g2.:m  f2.  g4.:m d4. g2.:m
  d2.:m  f2.  g2.:m     d2.:m
  d2.:m  f2.  g4.:m d4. g2.:m
}

ChordsInAm = \chordmode {
  \globalAm
  \partial 8 s8
  a2.:m  g2.  a2.:m     e2.:m
  a2.:m  g2.  a4.:m e4. a2.:m
  c2.    g2.  f2.       c2.
  c2.    g2.  a4.:m e4. a2.:m
}

% ---- MELODY IN Gm ----
MelodyInGm = \relative c'' {
  \globalGm
  \clef treble
  \partial 8 g16 a
  \repeat volta 2 {

  bf4 bf8   bf  c   d
  c8  a  f   f   g   a
  bf8 g  g   g   a   bf
  a8  d, d   d4  g16 a

  \break
  bf4 bf8   bf  c   d
  c8  a  f   f   g   a
  bf8 a  g   f   d   fs
  }
  \alternative {
    {  
      g4.  g,4 g'16 a
    }
    {
      g4.  g,4 d''16 ef
    }
  }
      
  \break
    \repeat volta 2 {

  f8  g  f   f   ef  d
  c8  a  f   f   a   c
  g'8 a  g   g   a   g
  f8  d  d   d4  d16 ef

  \break
  f8  g  f   f   ef  d
  c8  a  f   f   g   a
  bf8 a  g   f   d   fs
    }
  g4. g,4
}

% ---- MELODY IN Am ----
MelodyInAm = \relative c'' {
  \globalAm
  \clef treble
  \partial 8 a16 b

  % partA
  \repeat volta 4 {
    c4   c8   c   d   e
    d8   b    g   g   a   b
  }
  \alternative {
    {
      c8 a  a   a   b   c
      b8 e, e   e   a   b
    }
    {
      c8 b  a   b4  g8
      a4     a8  a4  a16 b
    }
    {
      c8 b  a   b4  g8
      a4     a8  a8  e' f
    }
  }

  \break
  \repeat volta 2 {
    g4   g8   g   f   e
    d8   b    g   g   b   d
    a'4  a8   a   b   a
    g8   e    c   c   e   f

    \break
    g8   c,   e   g   f   e
    d4   b8   g   a   b
    c8   b    a   b4  gs8
  }
  \alternative {
    { a4   a8   a8  e'  f }
    { a,4  a8   a4  a16 b }
  }

  \break
  % partA again
  \repeat volta 4 {
    c4   c8   c   d   e
    d8   b    g   g   a   b
  }
  \alternative {
    {
      c8 a  a   a   b   c
      b8 e, e   e   a   b
    }
    {
      c8 b  a   b4  g8
      a4     a8  a4  a16 b
    }
    {
      c8 b  a   b4  g8
      a4     a8  a8  e' f
    }
  }

  a,4 a8 a4.\fermata
}

% ---- SCORES ----

\markup \fill-line { \bold "In Gm" }
\score {
  <<
    \new ChordNames \ChordsInGm
    \new Staff { \MelodyInGm }
  >>
  \layout { indent = 0 }
  \midi { \tempo 4 = 160 }
}

\markup \fill-line { \bold "In Am" }
\score {
  <<
    \new ChordNames \ChordsInAm
    \new Staff { \MelodyInAm }
  >>
  \layout { indent = 0 }
  \midi { \tempo 4 = 160 }
}
