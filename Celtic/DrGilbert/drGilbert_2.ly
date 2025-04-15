\version "2.14.0"
\header {
	title = "Traditional Irish Fiddle Tunes. Randy Miller and Jack Perron."
	crossRefNumber = "058"
	footnotes = ""
	tagline = "Lily was here 2.13.43 -- automatically converted from ABC"
	title = "Dr. Gilbert"
}
voicedefault =  {
\set Score.defaultBarType = "empty"

% %topmargin 3cm
 \override Staff.TimeSignature #'style = #'C
 \time 2/2 
 \key g \major   
 \partial 4
g''8    fis''8      
\bar "|"  e''8 ^"(A"   b'8  \times 2/3 {   c''8 (   b'8    a'8) }   b'8    d''8  \grace { d'8 e'8    \times 2/3 {   fis'8 (   e'8    d'8  -) }   e'8    d'8    b8    d'8    
\bar "|"  \times 2/3 {   g'8 (   fis'8    e'8  -) }   \times 2/3 {   fis'8( e'8    d'8  -) }   e'8    fis'8    g'8    a'8    
\bar "|"  \times 2/3 {   b'8 (   c''8    d''8  -) }   e''8    d''8    b'8    d''8    e''8    b''8    
\bar "|"  \repeat volta 2 {   e''8    b'8    \times 2/3 { \grace { a''8 (   fis''8    d''8  }   fis''8    e''8    d''8    b'8    c''8    
\bar "|"  \times 2/3 {   d''8 (   c''8    b'8  -) }   a'8    fis'8    a'8    fis'8   d'8    fis'8    \bar "|"   e'8    b'8  \grace {      s8   s8   s8   s8     
\bar "||"   e''8 ^"(A"   b'8    \times 2/3 {   c''8 (   b'8    a'8  -) }   b'4. ^"~"    c''8    
\bar "|"   d''8    b'8    a'8    c''8    b'8    a'8    g'8    fis'8      
\bar "||"   s8 ^"A)"   s8   s8   s8     
\bar "||"   e'8 ^"(B"   b8
}}}}}

\score{
    <<

	\context Staff="default"
	{
	    \voicedefault 
	}

    >>
	\layout {
	}
	\midi {}
}
