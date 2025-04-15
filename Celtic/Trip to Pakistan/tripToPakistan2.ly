\version "2.14.0"
\header {
	crossRefNumber = "1"
	footnotes = ""
	tagline = "Lily was here 2.12.3 -- automatically converted from ABC"
	title = "Trip To Pakistan, The"
}
voicedefault =  {
\set Score.defaultBarType = "empty"

\time 4/4 \key e \minor   \repeat volta 2 {   e'8    g'8    b'8    e'8    g'4.  
  b'8  \bar "|"   a'4.    b'8    a'8    g'8    fis'8    g'8  \bar "|"   e'8    
g'8    b'8    e'8    g'4.    b'8  \bar "|"   a'8    g'8    fis'8    g'8    e'2  
}     \repeat volta 2 {   e'8    g'8    b'8    g'8    c''4.    a'8  \bar "|"   
b'4.    d''8    a'8    g'8    fis'8    g'8  \bar "|"   e'8    g'8    b'8    g'8 
   c''4.    a'8  \bar "|"   b'8    a'8    g'8    b'8    a'2  }     
\repeat volta 2 {   fis'8    g'8    b'8    fis'8    g'8    b'8    g'8    fis'8  
\bar "|"   e'8    fis'8    g'8    e'8    fis'8    g'8    fis'8    e'8  \bar "|" 
  d'8    fis'8    a'8    d'8    fis'8    a'8    d'8    fis'8  \bar "|"   a'8    
g'8    fis'8    g'8    e'2  }     \repeat volta 2 {   b'8    c''8  \bar "|"   
d''4. ^"~"    e''8    d''8    c''8    b'8    d''8  \bar "|"   c''4    c''8    
a'8    b'8    g'8    g'8    fis'8  \bar "|"   e'8    g'8    b'8    g'8    c''4. 
^"~"    d''8  \bar "|"   b'8    a'8    g'8    b'8    a'4  }   g'8    fis'8  
\bar "|"   e'8    g'8    b'8    e'8    g'4. ^"~"    b'8    \bar "|"   
}

\score{
    <<

	\context Staff="default"
	{
	    \voicedefault 
	}

    >>
	\layout {
	}
	\midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 140 4)
       }
    }
}
