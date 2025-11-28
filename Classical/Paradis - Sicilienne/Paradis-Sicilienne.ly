\version "2.24.0"
\language "english"
\include "../../common/violin-functions.ly"

\header {
  title = "Sicilienne"
  composer = "Maria-Theresia von Paradis (1759 – 1824)"
  subtitle = ""
  % 
  
  poet =  "Fingerings by Ivry Gitlis"
    style = "classical"
  tagline = ##f
}

\paper {
  ragged-last-bottom = ##f
  markup-system-spacing.basic-distance = #15
} 

\markup \huge "Practice"
\relative c'' {
 c f g af g 
}

sulA = \markup { \small \italic "sul A" }

global = {
  \time 6/8
  \key ef \major
  \tempo 2. =40
} 

chordNames = \chordmode {
  \global
    \partial 4 s4
               ef2. af2. 
    ef2. b2.   ef2. bf2. 
}

melody = \relative c'' {
  \global
  \partial 4 g4\p
  \repeat volta 2 {
  bf2 ~ bf4\tenuto cf4. bf8 af4
  bf2( g4-\shift-2) af4. g8-\shift-3 f4
  g4. bf,8 ef( g) 
      \afterGrace f2.\trill\( { ef8([ f])\)}
  \break
  g2. ~ g2 bf4 
  ef2-\shift-1\mf( bf4) cf4.-3 bf8 af4
  bf2\< ef8-1 f\! g2 ~ g4\tenuto
  g2\f ( d4-\shift-2) ef4. d8 c4
  \break
  g'2-\shift-3\p( d4-\shift-2) ef2( c4)
%  \break
\slurDashed
  df4.( c8 bf af) g2( b,4)
  }
  \alternative {
    {c2.   ~c2 g'4}
    {c,2. ~ c2 bf'4}
  }
    \repeat volta 2 {
\break
   g'2-2\f ~g4\tenuto c,4.-2 d8 ef4-\shift-1
   f4. g8 f4  bf,2-\shift-1 ~ bf4\tenuto\p
   g'2 ^\sulA ~g4\tenuto c,4.-\shift-2 d8 ef4-\shift-1
   f4. g8 f4  bf,2\< ~ bf4\!
   \break
   af'2.\mf ~ af8 g( f ef d c)
   g'2.-\shift-3 ^\sulA ~ g8 f( ef d c bf)
   \override Fingering.avoid-slur = #'inside

   
   f'2.-\shift-3 ~ f8 ef-2 ( d-\shift-2  c d ef)
   f,4.\< g8 af4\! g2\>( f4\!) 
   \break
   df'2.\p ~ df8 c( b c f af-3)
   g4.-\shift-3( bf,8 ef g)
   \slurSolid
    \afterGrace f2.\trill  { ef8([ f])}
    \slurDashed
   df'2.\f ~ df8 c( b c f, af)
   g4.( bf,8 ef-\shift-1 g) 
    \afterGrace f2.\trill  { ef8([ f])}
  }
  \alternative {
    {ef2. ~ ef2 bf4}
    {ef2. ~ ef2 g,4}
  }
  bf2 ~ bf4\tenuto cf4. bf8 af4
  bf2( g4) af4. g8 f4
  \break
  g4. bf,8 ef( g) f2.
  g4.^\rit bf,8 ef( g) f2\> ef8 f
  ef1. ~ ef2.\! r4 r2
  
\bar "|." 
}



\score {
  <<
    %\new ChordNames \chordNames
    \new Staff { \melody }
  >>
  \layout { }
  \midi { }
}


%{
convert-ly (GNU LilyPond) 2.24.1  convert-ly: Processing `'...
Applying conversion: 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2,
2.23.3, 2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10,
2.23.11, 2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
