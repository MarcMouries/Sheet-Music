\version "2.17.22"
signature = {
  \time 3/4
  \key g \major
  \clef violin
}
	
violin_Dynamics   = \relative c' {
    \signature             
           |  f8( \< a)    f( a)   g ( b) \!
  }
  

\markup { \bold Dynamics along side notes }
\score {
    <<
      \new Staff {
           \signature 
           \violin_Dynamics 
      }
      \new Dynamics { 
%        \Dynamics
      }
      >>  
   \layout { }
 }  
  
\markup { \bold Dynamics in a Dynamic context }
violin_No_Dynamics   = \relative c' {
    \signature             
           |  f8(  a)    f( a)   g ( b)
}

Dynamics =  {
   s8\< s2 s8\! s2. 
}  



  \score {
    <<
      \new Staff {
           \signature 
           \violin_No_Dynamics 
      }
      \new Dynamics { 
        \Dynamics
      }
      >>  
   \layout { }
  } 