\version "2.19.11"
\language "english"
\header {
	crossRefNumber = "1"
	footnotes = ""
	title    = "Teardrop Waltz"
        composer = "Reg Bouvette"
  country = "Canada"
	arranger = "Casey Willis"
	  style = "waltz"
}

\include "../../common/common-header.ily"

\paper {
  indent = 0\mm
  %line-width = 127\mm
}

melody =  \relative c'' {
  \time 3/4 
  \key d \major


  \partial  8*3 a8\upbow( b8. cs16) 

\repeat volta 2 {     
  d8.(e16)  d8.( cs16)  b8.( \grace {cs16 b} a16 )   
  a4.      a,8    d8.    e16    
  fs4    fs4   ~   fs8    d8    
  b4 ^"Bm"  ~    b8    cs8    d8    e8        
  fs4 ^"D"   e4.    d8    
  fs4    e4.    d8    
  b'2 ^"G"  ~    b8  \grace  { cs8 } d8    
  b4 ^"A7"  ~    b8  \grace  { cs8 } d8  cs8    b8      
  a8 ^"D"   b8    a8    g8    fs8    e8    
 d4 ~    d8    a8    d8    e8    
 fs4    fs4   ~    fs8    d8  
 b4 ^"Bm"  ~    b8    cs8    d8    e8        
 fs4 ^"D"   a4~a8   <<   fs8    d8   >>   
 e4 ^"A7" ~    e8    d8    b8    cs8    
 d2 ^"D"  ~    d8    e8    
} 
\alternative {
  {  d8[  e]  fs   g  \tuplet 3/2 { a8 b  cs }   }
  {  d,4    d'4    cs4    }
}
\break
\repeat volta 2 {     
   b2 ^"Bm"  ~    b8    a8    
   \bar "|"     b2 ^"G"  ~    b8    a8    
\bar "|"   \grace {    fs8 ^"D" }   a2   ~    a8    b8    
\bar "|"   a4 \grace {    fs8  }   d'4    cs4        
\bar "|"     b2  ^"G"   cs4    
\bar "|"     d2  ^"A7"   e4    
\bar "|"     fs2 ^"D"  ~    fs8    g8 
\bar "|"     fs8    e8    d8    cs8    b8    cs8    
\bar "|"     
\bar "|"     d2  ^"G"  ~    d8    cs8    
\bar "|"     d2   ~    d8    cs8    
\bar "|"     d4  ^"D"  ~    d8    b8    a8    fs8    
\bar "|"     d4   ~    d8    a8    d8    e8        
\bar "|"     fs4 ^"Bm"   a4   ~    a8    fs8    
 \bar "|"    e4  ^"A7"  ~    e8    d8    b8    cs8    
} 
\alternative{
  {     d2 ^"D"  ~    d8    e8    
 \bar "|"   d4    d'4    cs4    } 
  {     d,4 ^"D"   fs4    a4    
                  \bar "|"   d4   ~    d8    
\bar "|."   }}
}



chordNames = \chordmode {
 s4. d2.    d2.     d2.    g2.
     d2.    d2.     b2.:m  g2.
     d2.    d2.     d2.    g2.
     d2.    a2.:7   d2.    d2.
     b2.:m  g2.     d2.    d2.
     b2.:m  g2.     d2.    d2.
     b2.:m  g2.     d2.    g2.
     d2.    a2.:7   d2.    d2
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff    { \melody }
  >>
  \layout { }
  \midi { }
}