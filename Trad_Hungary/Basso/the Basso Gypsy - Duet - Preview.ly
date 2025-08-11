% ****************************************************************
% Canon in D
% ****************************************************************
\version "2.14.0"
\include "english.ly"
#(set-global-staff-size 26)


\header {
  title = "Basso - Gypsy in Am"
  %subtitle = "Duet for 2 violins"
  composer = "Trad. Gypsy"
  %instrument = "Violin I"
  % copyright = "Copyright"
  %arranger = "Arranged by Marc Mouries"
  tagline = ""
}

global= { \time 4/4 \key a \minor }

violinOne = \new Voice { 
  \relative c''{
  \mark \default
    \partial 2. a4\upbow b c 

    \repeat volta 2 {
      d2 a4 d( | d) d c b | c2 a4 c(|c) c b a |     
	  b2 e,4 b'( | b) b a gs | a2 b2 | c cs         
      d2 a4 d4( | d4) d c b | c2 a4 c4( | c) c b a  
      b2 e4 b4( | b4) b c b | 
    }
	\alternative {
		{a1 | r4 a\upbow b c }
        {a1 ( | a2) r2 }            
    }
   \break 
  \mark \default
    \repeat volta 2 {
    <d, a' f'>2 d'2 | a'2 g4 f | r4 e2 c4 | e2 d4 c | 
   b2. c4 | d2 c4 b | a2 b | c2 cs2             
   d2 f a g4 f4 | r4 e2\downbow f4 | e2 e2      
	gs2 gs | gs4 e fs gs |
	}   
\alternative {
		{a1 ( | a2) r2 }
        {a1 ( | a4) a e c }            
    }
\break
  \mark \default
  \repeat volta 2 {
	d8 c b c    d8 c b c   | d8 c b c    d8 c b d
  | c8 b a b    c8 b a b   | c8 b a b    c8 b a c \break
  | b2. e8 f8 | e4 d c d   | e4 a8a8 a4 a4  | a g f e \break
  | d8 c b c    d8 c b c   | d8 c b c    d8 c b d 
  | c8 b a b    c8 b a b   | c8 b a b    c8 b a c \break
  | b2. e8 f8 | e4 d c b   | 
  }  
\alternative {
		{a4  a'8 a8 a4 a4 | a2 e2}
		{a,4  a'8 a8 a4 a4 | a4 a, b c}
    }
  }
}

violinTwo = \new Voice { \relative c''{
  	\partial 2. c4\upbow d e 
    \repeat volta 2 {
      f2 d4 f( | f) f e d | e2 c4 e(|e) e d c |        
	  d2 b4 d ( | d) d c b | c2 d2    | ds e     |     
      f2 d4 f ( | f) f e d | e2 c4 e( | e) e d c |     
      d2 b4 d ( | d) d c b | 
    }
	\alternative {
		{c1 | r4 c\upbow d e }
        {c1 ( | c2) r2 }            
    }
   \break 
  \mark \default
    \repeat volta 2 {
   	d2 a | f'2 e4 d | r4 c2 a4 | c2 b4 a | 
	gs2. a4 b2 a4 gs e2 gs a2 g | 
	f2 d' f e4 d4 | r4 c2 d4 | c2 c2 
	b2 b2 | b4 gs a b |
	}
\alternative {
		{c1 ( | c2) r2 }            
		{c1 ( | c4) r4  r2 } 
    }
  \mark \default
  \repeat volta 2 {
	f8 e d e    f8 e d e  | f8 e d e f8 e d f |
	e8 d c d    e8 d c d  | e8 d c d e8 d c e |
	d2.  gs8 a8  | gs4 f e gs | a4 c8c8 c4 c4 |	c b a g | 
	f8 e d e    f8 e d e  | f8 e d e f8 e d f |
	e8 d c d    e8 d c d  | e8 d c d e8 d c e |
	d2.  gs8 a8  | gs4 f e d | 
  }
\alternative {
		{c4  c'8 c8 c4 c4 | c2 g2}
		{c,4  c'8 c8 c4 c4 | c4 c, d e}
    }

   }
}

\score {
   \new StaffGroup <<
      \new Staff
        << 
		  \set Staff.midiInstrument = "violin"
		  \global \violinOne
        >>
      \new Staff << \global \violinTwo >>
   >>
   \layout {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 140 4)
    }
  }
   \midi { }
}