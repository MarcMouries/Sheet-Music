\version "2.10.33"

\paper {
 %ragged-right = ##t
 %ragged-bottom = ##t
 indent = 0\mm
}

\header{
  title = "Scales"
  arranger =  ""
  arranger = \markup
               { \column \right-align 
	              { \line 
	                 {\small "arr. Marc Mouries" } 
	                 {\teeny "PUT AS URL http://marcmouries.com/music"}
	               }
	            }
  instrument = "Violin"
  meter = "1) détaché 2) slurred 3) Staccato"
  tagline = ""
}

#(set-global-staff-size 18)

\markup {
1. Scales: Quarter note = 120. Optional: 2 slurred 2 separate going up - 4 slurred coming down.
Violin: G, A, B & C Major and melodic minor (3 octaves)
}

\score {
\new RhythmicStaff {
       d2 d        % long, slow 
       | d4 d d d    %
       | d8( d) d( d)   d8( d) d( d) 
       | d8( d d d)  d8( d d d)      
	   | d8( d d d   d8 d d d)      
	   | d8\tenuto \downbow d-.\upbow d-.\upbow d-.\upbow d8\tenuto \downbow d-.\upbow d-.\upbow d-.\upbow
       }
  \header {piece = "Bowing, Archets" }
}

\score {
  \relative a' {
    \key a \major
      a8 b8 cis8 d8 e8 fis8 gis8 a8 
    | a8 gis fis8 e8  d8 cis8 b a \bar ":|:"
    \times 2/3 {a8 cis8 e8} \times 2/3 {a8 e8 cis8} a2 \bar ":|"
  }
  \header { piece = "A Major"}
}

\score {
  \relative{
    \key d \major
       d8 e8 fis8 g8   a8 b8 cis8 d8
     | d8 cis8 b8 a8   g fis e d  \bar ":|:"
     \times 2/3 {d8 fis8 a8} \times 2/3 {d8 a8 fis8} d2 \bar ":|"
  }
  \header {piece = "D Major" }
}



\score {
  \relative g {
    \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible

    \key g \major
      g8 a b c   d e fis g
    | a8 b c d   e fis g fis8 
    | e8 d c b   a g fis e 
    | d c b a    g2 \bar ":|"
    \times 2/3 { g8 b8 d8 }  \times 2/3 { g8 b8 d8 }
    \times 2/3 { g8 d8 b8 }  \times 2/3 { g8 d8 b8 } \bar ":|" 
    \break
    \time 6/8    
	
    b8 g b  d b d  g d g  b g b  d b d  g d g  b4.
    g8 b g  d g d  b d b  g b g  d g d  b d b  g4.  
  }
  \header { piece = "G Major"}
  \layout{
  }
}

