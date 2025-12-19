
\version "2.14.0"

#(set-global-staff-size 26)

\header {
    title = "Rhythm Humoresque"
	tagline = ""
}


\score {
  \relative c' {
  <<
    \new Staff { 
      \set Staff.instrumentName = "Violino"    
        { \time 2/4 d4~d8 e8 d4~d8 e8 | }
    	}
    \new Staff { <<  { \time 2/4 d8      d8       d8      d8       d8      d8       d8      d8} >> }
	\new Staff { <<  { \time 2/4 d16 d16 d16 d16  d16 d16 d16 d16  d16 d16 d16 d16  d16 d16 d16 d16} >> }
  >>
  <<
  	\new Staff { <<  {  d4      ~        r8      e8       d4      ~        r8      e8      |  } >> }
    \new Staff { <<  {  d8      d8       r8      e8       d8      d8       d8      e8      |  } >> }
	\new Staff { <<  {  d16 d16 d16 d16  d16 d16 d16 d16  d16 d16 d16 d16  d16 d16 d16 d16    } >> }
	
  >>
}
}

