\version "2.24.0"
\header {
	title = "Traditional Irish Fiddle Tunes. Randy Miller and Jack Perron."
	crossRefNumber = "058"
	footnotes = ""
	tagline = "Lily was here 2.13.43 -- automatically converted from ABC"
	title = "Dr. Gilbert"
}
voicedefault =  {
\set Score.measureBarType = ""

% %topmargin 3cm
 \override Staff.TimeSignature.style = #'C
 \time 2/2 
 \key g \major   
 \partial 4
g''8    fis''8      
\bar "|"  e''8 ^"(A"   b'8  \tuplet 3/2 {   c''8 (   b'8    a'8) }   b'8    d''8  \grace { d'8 e'8    \tuplet 3/2 {   fis'8 (   e'8    d'8  -) }   e'8    d'8    b8    d'8    
\bar "|"  \tuplet 3/2 {   g'8 (   fis'8    e'8  -) }   \tuplet 3/2 {   fis'8( e'8    d'8  -) }   e'8    fis'8    g'8    a'8    
\bar "|"  \tuplet 3/2 {   b'8 (   c''8    d''8  -) }   e''8    d''8    b'8    d''8    e''8    b''8    
\bar "|"  \repeat volta 2 {   e''8    b'8    \tuplet 3/2 { \grace { a''8 (   fis''8    d''8  }   fis''8    e''8    d''8    b'8    c''8    
\bar "|"  \tuplet 3/2 {   d''8 (   c''8    b'8  -) }   a'8    fis'8    a'8    fis'8   d'8    fis'8    \bar "|"   e'8    b'8  \grace {      s8   s8   s8   s8     
\bar "||"   e''8 ^"(A"   b'8    \tuplet 3/2 {   c''8 (   b'8    a'8  -) }   b'4. ^"~"    c''8    
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


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.15.7, 2.15.9, 2.15.10, 2.15.16, 2.15.17,
2.15.18, 2.15.19, 2.15.20, 2.15.25, 2.15.32, 2.15.39, 2.15.40,
2.15.42, 2.15.43, 2.16.0, 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11,
2.17.14, 2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27,
2.17.29, 2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
