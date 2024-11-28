\version "2.19.3"
\language "english"               

\paper {
    indent = 0 
}
\header {
        tagline = ##f       % Remove default LilyPond tagline
	title = "The Musical Priest"
	composer = "Trad. Celtic"
        subtitle = ""
}
\markup {
 \vspace #2
}

melody =  \relative c'' {
 \time 2/4 
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

harmonies = \chordmode {
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
    \harmonies
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
      \override StaffSymbol #'staff-space = #(magstep -3)
      \override StaffSymbol #'thickness = #(magstep -3)
      firstClef = ##f
    }
    { \stopStaff s4 s4  \startStaff b8[ c32 b a b] ~ b8 d8  }
  >>
   | cs   b)    a\downbow    fs'    e    cs    b    a    
}
