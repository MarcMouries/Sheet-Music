\version "2.19.49"
\language "english"
%{
\include "violin-functions.ly"
%}
\header {
  title = "The Butterfly"
  composer = "Tommy Potts"
  footnotes = ""
    style = "irish traditional"
  tagline = ""
}
violin =  \relative c'' {
  \time 9/8
  \key e \minor

  \repeat volta 2 {
    b4\upbow       e,8 (   g4  -)   e8 (  \appoggiatura {fs16 g} fs4.  -)
    b4             e,8 (   g4  -)   e8 (   fs8   -)   e8    d8
    b'4 ^\downbow  e,8 (   g4  -)   e8 (   fs4.  -)
    b4 (  d8  -) d4      b8 (^\upbow   a8  -)   fs8    d8
  }
  \break
  \repeat volta 2 {
    b'4 (^\downbow   c8  -)   e4 (   fs8  -)   g4.
    |     b,4
    (^\upbow   d8  -)   g4 (   e8  -)   d8 (   b8    a8  -)
    b4 (   c8  -)   e4 (   fs8  -)   g4      a8 (^\upbow
    b4    a8  -)   g4 (   e8  -)   d8 (   b8    a8  -)
  }
  \repeat volta 2 {
    b4. ^"~"    b4 (   a8  -)   g4    a8
    b4.
    ^"~"    b8    a8      b8 (^\upbow   d8  -)   b8    a8
    b4.
    ^"~"    b4 (   a8  -)   g4    a8 (
    b4    d8  -)   g4 (
    e8  -)   d8 (   b8    a8  -)
  }
}

violinAdvanced =  \relative c'' {
    \time 9/8

  b4 ^\downbow   e,8 ( g4  -)  e8 (  \tuplet 3/2 {fs16\( g fs\) }e8 fs8 )
  b4             e,8 ( g4  -)  e8 (  fs8   -)      g8  a8
  b4 ^\downbow   e,8 ( g4  -)  e8 (  \tuplet 3/2 {fs16\( g fs\) }e8 fs8 )
  b4 (  d16 d16  -) d4      b8 (^\upbow   a8  -)   g8   a8

}
chordNames = \chordmode {
    \set chordChanges = ##t

  e2.:m ~ e4.:m
  e2.:m ~ e4.:m
  e2.:m ~ e4.:m
  g2. ~ d4.
 %
  e2.:m ~ e4.:m
  g2. ~ g4.
  e2.:m ~ e4.:m
  g2. ~ g4.


}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \violin }
   % \new Staff { \violinAdvanced }
  >>
  \layout { indent =0}
  \midi { }
}