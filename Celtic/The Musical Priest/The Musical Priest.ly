\version "2.24.0"
\language "english"
%\include "../../stylesheets/stylesheet_fiddle.ly"


\layout {
  \set beamExceptions = #'()
}

\paper {
  indent = 0
}
\header {
  tagline = ##f       % Remove default LilyPond tagline
  title = "The Musical Priest"
  composer = "Trad. Celtic"
  subtitle = "Sheila Falls"
}
\markup {
  \vspace #2
}

melody =  \relative c'' {
  \time 4/4
  \key b \minor

  % PART A
  \repeat volta 2 {
    \partial 4    \acciaccatura { b16 cs} b8[ a]
    | fs\downbow   b8(  \acciaccatura { cs} b a)  b4\turn  ~b8  d\upbow(
    | cs   b)    a\downbow    fs'    e    cs    b    a
    | fs\downbow   b8(  \acciaccatura { cs} b a)  b4\turn  ~b8  d\upbow(
    | cs   b)    a    cs   b4
  }

  \break

  % PART B
  \repeat volta 2 {
    \partial 4 b8(\upbow cs)
    d4   \acciaccatura { e8 } d8( cs)    d    fs    e    d
    \tuplet 3/2 { cs8\downbow([  b  a])}   e'  a,( fs')  a,( e')    a,(
    d)  cs    b   cs    d    e    fs    b(
    a   fs)   e   cs    b4
  }

  % PART C
  \repeat volta 2 {
    \partial 4 b8(\upbow cs)
    d    b    b4\turn    b'8    a    fs    b(
    a    fs)   e    cs( a b)    cs    e
    d    cs    b    cs    d    e    fs    b(
    a    fs)   e    cs    b4
  }

}

chordNames = \chordmode {
  % \set midiInstrument = #"orchestral harp"
  \repeat volta 2 {
    \partial 4 s4
    | b1:m | a1 | b1:m | a2 b4:m
  }


  \repeat volta 2 {
    b4:m d1  a1  b1:m  a2 b4:m
  }


  \repeat volta 2 {
    b4:m b1:m a1 b1:m  a2 b4:m
  }
}

music = {
  <<
    \new ChordNames  {
      \set chordChanges = ##f
      \chordNames
    }
    \new Voice = "one" {
      \set Staff.midiInstrument = #"accordion"
      \melody
    }
  >>
}
\score {
  \music
  \layout { }
  \midi {}
}



\markup {
  \vspace #10
}

\new Staff = main \relative c' {
  \time 2/4
  \key b \minor

  <<
    { fs8\downbow   b8(  \acciaccatura { cs} b a)  b4\turn  ~b8  d\upbow( }

    \new Staff \with {
      \remove "Time_signature_engraver"
      alignBelowContext = #"main"
      fontSize = #-3
      \override StaffSymbol.staff-space = #(magstep -3)
      \override StaffSymbol.thickness = #(magstep -3)
      firstClef = ##f
    }
    { \stopStaff s4 s4  \startStaff b8[ c32 b a b] ~ b8 d8  }
  >>
  | cs   b)    a\downbow    fs'    e    cs    b    a
}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}
